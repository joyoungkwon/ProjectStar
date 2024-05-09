// function ImgFileview(event) {

// 	var reader = new FileReader();
// 	var file = event.target.files[0];

// 	if (file && file.type.match("image.*")) {
// 		reader.onload = function(e) {
// 			var img = document.createElement("img");
// 			img.setAttribute("src", e.target.result);
// 			document.querySelector("#doc_photoview")
// 			document.querySelector("#doc_photoview").appendChild(img);
// 		}
// 		reader.readAsDataURL(file);
// 	}
// }

// 1. 업로드 버튼(id="fileUpload_btn")을 누르면, input type="file"이 클릭되도록 함 -> 파일 업로드 창 열기 
var file_num = 0;
function openFileUpload() {
	if (file_num < 10){
		file_num++;
		let file = document.getElementById('file'+file_num);
		file.click();
	}
}

// 2. 파일 저장할 배열 (파일 선택할 때 배열에 저장하고, 업로드 할 때 순서 유지)
var selectedFiles = [];

// 3.  HTML 문서의 모든 요소가 로드되면 실행되는 DOMContentLoaded 이벤트 핸들러를 등록
$(function () {
  var myCarousel = new bootstrap.Carousel(document.getElementById('carousel'), { // Bootstrap 라이브러리를 사용하여 새로운 캐러셀 객체를 생성
    interval: 0,  // 캐러셀의 자동 슬라이드 기능 비활성화
    wrap: false,    // 마지막 슬라이드에 도달하면 더 이상 슬라이딩하지 않음 (무한반복 비활성)
  });
});

function ImgFileview(event) {
  var carouselIndicators = document.getElementById("carouselIndicators"); // 인디케이터
  var carouselInner = document.getElementById("carouselInner"); // 이미지

  // 선택한 파일들 초기화
  // carouselIndicators.innerHTML = "";
  // carouselInner.innerHTML = "";

  var files = event.target.files;

	// 배열에 파일 추가
	for (var i = 0; i < files.length; i++) {
    selectedFiles.push(files[i]);

    // 캐러셀 인디케이터 생성
    // -> 파일 수만큼 반복하면서 각 파일에 대한 캐러셀 인디케이터 생성 (버튼 요소로 생성됨)
    var indicator = document.createElement("button");
    indicator.type = "button";
    indicator.setAttribute("data-bs-target", "#carousel");
    indicator.setAttribute("data-bs-slide-to", i); /*  인디케이터가 몇 번째 슬라이드를 가리키는지 */
		if (i === 0 && carouselIndicators.childElementCount === 0) {  
      // 현재 인덱스가 0이라면 첫번째 인디케이터에  'active' 클래스 추가 -> 활성화 (초기 화면 설정)
			indicator.classList.add("active");
      // -> 캐러셀이 로드될 때 첫 번째 슬라이드와 그에 해당하는 인디케이터가 활성화되어 보임
		}
    carouselIndicators.appendChild(indicator);
   

    var reader = new FileReader(); // 파일 읽기
    reader.onload = (function (index) { // onload 이벤트 핸들러는 파일 읽기가 완료되었을 때 실행됨
      return function (e) { // 즉시 호출 
		var car_it = document.getElementsByClassName('carousel-item');
		for (var i of car_it){
			i.classList.remove('active')
		}
        var image = document.createElement("div");
        image.className = "carousel-item";
        image.classList.add("active"); // active 클래스 추가하여 캐러셀 첫번째 이미지로 지정 
        image.innerHTML = '<div id="carImg"><div><img src="' + e.target.result + '" class="d-block w-100 img_b_size"></div></div>';
        carouselInner.appendChild(image); // "appendChild"는 DOM(Document Object Model)에서 사용되는 메서드로, 특정 요소를 다른 요소의 자식으로 추가하는 역할
        // "carouselInner"에 새로운 "image"를 자식 요소로 추가하는 역할 (=이미지를 캐러셀에 추가)
      };
    })(i); // 즉시 호출되는 함수 표현식을 사용한 부분에서 현재 파일의 인덱스를 해당 함수로 전달하기 위함 -> index값
    reader.readAsDataURL(files[i]); // FileReader를 사용하여 선택한 파일을 데이터 URL로 읽어오는 역할
  }

  // 파일 선택 후 캐러셀을 보이게 함
  document.getElementById("carousel").style.display = selectedFiles.length > 0 ? "flex" : "none";

  // 화살표 숨김 처리 (사진이 1개일땐 < > 화살표가 나올 필요가 없어서 숨기려고)
  var controlButtons = document.querySelectorAll('.carousel-control-prev, .carousel-control-next');
  controlButtons.forEach(function(button) {
    button.style.display = selectedFiles.length >= 1 ? "block" : "none";
  });
}
  var controlButtons = document.querySelectorAll('.carousel-control-prev, .carousel-control-next');
  controlButtons.forEach(function(button) {
    button.style.display = selectedFiles.length >= 1 ? "block" : "none";
  });

	// 나중에 업로드할 때 이 함수 호출하기
	function uploadFiles() {
		// selectedFiles 배열을 서버로 전송
		// 여기에서 서버로 파일을 업로드하거나 다른 작업을 수행
		console.log(selectedFiles);
		// 서버로 전송 후 배열 초기화
		selectedFiles = [];
	}
	
	function upload(bool){
		console.log(bool);
		document.getElementById("open").value = bool;
		document.writer_frm.submit();
	}
	
	