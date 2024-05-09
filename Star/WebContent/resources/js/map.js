var lat = 35.1741212; // 초기값, 전대후문
var lon = 126.9135834;  // 초기값, 전대후문
var latlon = { y: lat, x: lon };
var map = []; // 지도
var marker = [];  // 마커


function mapCreate(id, lv, num) {
    var mapContainer = document.getElementById(id), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(latlon.y, latlon.x), // 지도의 중심좌표
            level: lv // 지도의 확대 레벨
        };
    // 지도를 생성합니다    
    map[num] = new kakao.maps.Map(mapContainer, mapOption);
}

function makerCreate(num) {
	var imageSrc = 'resources/img/maker.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(70, 70), // 마커이미지의 크기입니다
	    imageOption = { offset: new kakao.maps.Point(32, 60) }; // 마커이미지의 옵션

    marker[num] = new kakao.maps.Marker({
        map: map[num],
        position: new kakao.maps.LatLng(latlon.y, latlon.x),
        image: new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    });
}


function displayLocation(position) {
	latlon.y = position.coords.latitude; // 위도
	latlon.x = position.coords.longitude; // 경도
	mapinit();
}

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//geolocation을 받아 올 수 있나 확인하는 if구문
if (navigator.geolocation) {
    //geolocation을 이용해 접속 위치를 얻어오기
    navigator.geolocation.getCurrentPosition(displayLocation);
}

// 해당 id에 좌표로 주소명 띄우기 (input)
function coo2add(latlng, id) {
    geocoder.coord2Address(latlng.x, latlng.y, function (result, status) {
        if (status === kakao.maps.services.Status.OK) { // 정상적으로 검색이 완료됐으면 
			document.getElementById(id).value = result[0].address.address_name;
        }
    });
}

// 해당 id에 좌표로 주소명 띄우기 (div)
function coo2add_div(latlng, id) {
    geocoder.coord2Address(latlng.x, latlng.y, function (result, status) {
        if (status === kakao.maps.services.Status.OK) { // 정상적으로 검색이 완료됐으면 
            document.getElementById(id).innerHTML = result[0].address.address_name;
        }
    });
}

// 클릭으로 마커 옮겨지는 map 생성
function mapinit(id, add) {
    // 주소 검색창 지도 띄우기
    mapCreate(id, 8, 0);
    // 마커 띄우기
    makerCreate(0);
	// 주소 띄우기
	coo2add(latlon, add);

    // 지도에 클릭 이벤트를 등록합니다
    kakao.maps.event.addListener(map[0], 'click', function (mouseEvent) {
        var ll = mouseEvent.latLng;
        // 마커 위치를 클릭한 위치로 옮깁니다
        marker[0].setPosition(ll);
        latlon.x = ll.getLng();
        latlon.y = ll.getLat();
        coo2add(latlon, add);
    });
}


