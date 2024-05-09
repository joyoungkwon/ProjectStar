/*function change_Container(x) {
	document.getElementById('open_big').style.display= x;
}*/

//Element.classList.replace('content_small','content_big');

// 게시판에서 리뷰 클릭하여 small <-> big
/*function small2big(id){
	id.style.display = 'none';
	id.nextElementSibling.style.display = 'block';
}
function big2small(id){
	id.parentNode.parentNode.style.display = 'none';
	id.parentNode.parentNode.previousElementSibling.style.display = 'block';
}*/

function view_select(select){
	var child = document.getElementById('view_box').children;
	for (i=0; i<child.length; i++){
		if (i%2==select){
			child[i].style.display = 'none';
		} else {
			child[i].style.display = 'block';
		}
	}
}

/*영고니꺼*/
function sort(option){
	
	var param = option.value;
	const urlParams = new URL(location.href).searchParams;
	var cate = urlParams.get("cate");
	var search_value = urlParams.get("search_value");
	
	var path = "board_view.jsp?&sort="+param;
	if (cate != null){
		path += "&cate="+cate;
	}
	if (search_value != null){
		path += "&search_value="+search_value;
	}
	
	location.href=path;
}

function favoriteChange(div, no) {	// 찜
	var isFavor = (div.id == "true");
	div.id = !isFavor;
	if (!isFavor){	// 추가
		div.innerHTML = '<i class="fa-solid fa-star fa-lg" style="color: #1d69ed;"></i>';
		alert("찜목록에 추가되었습니다.");
	} else {	// 삭제
		div.innerHTML = '<i class="fa-regular fa-star fa-lg" style="color: #1d69ed;"></i>';
		alert("찜목록에서 삭제되었습니다.");
	}
	
	$.ajax({
		url: "wish_board.member",
		type: "get",
		dataType: "json",
		data: {
			"favor" : !isFavor,
			"no" : no,
		}
	});
}

function GoodChange(div, no) {	// 좋아요
	var isFavor = (div.id == "true");
	div.id = !isFavor;
	
	var count = div.nextElementSibling;
	
	if (!isFavor){	// 추가
		div.innerHTML = '<i class="fa-solid fa-thumbs-up fa-lg" style="color: #1d69ed;"></i>';
		count.innerHTML = parseInt(count.innerHTML)+1;
	} else {	// 삭제
		div.innerHTML = '<i class="fa-regular fa-thumbs-up fa-lg" style="color: #1d69ed;"></i>';
		count.innerHTML = parseInt(count.innerHTML)-1;
	}
	
	$.ajax({
		url: "good_bad.board",
		type: "get",
		dataType: "json",
		data: {
			"favor" : !isFavor,
			"no" : no,
			"table" : "board_good"
		}
	});
}

function BadChange(div, no) {	// 싫어요
	var isFavor = (div.id == "true");
	div.id = !isFavor;
	var count = div.nextElementSibling;
	if (!isFavor){	// 추가
		div.innerHTML = '<i class="fa-solid fa-thumbs-down fa-lg" style="color: #1d69ed;"></i>';
		count.innerHTML = parseInt(count.innerHTML)+1;
	} else {	// 삭제
		div.innerHTML = '<i class="fa-regular fa-thumbs-down fa-lg" style="color: #1d69ed;"></i>';
		count.innerHTML = parseInt(count.innerHTML)-1;
	}
	
	$.ajax({
		url: "good_bad.board",
		type: "get",
		dataType: "json",
		data: {
			"favor" : !isFavor,
			"no" : no,
			"table" : "board_Bad"
		},
		 success: 
		 	function (data){
			console.log("113");
		 },
		 error: 
		 	function (data){
			console.log("223");
		 }
	});
}