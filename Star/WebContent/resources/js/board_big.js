const real_text = document.querySelector('.real_text');
const moreText = document.querySelector('.more-text');
const lessText = document.querySelector('.less-text');        
const bigContent = document.getElementById('big-content');        

/*// 더보기 텍스트 클릭시 이벤트
moreText.addEventListener('click', () => {

  const height = real_text.offsetHeight;
  bigContent.style.height = height + '%';

  real_text.style.webkitLineClamp = 'unset'; // 라인 수 제한 없애기

  // text-overflow: ellipsis; -> '더보기' 눌렀을 때 이 속성 건드리지 않고도
  // -webkit-line-clamp: 4; -> 이거 하나만 없애도 글 내용 높이 조절이 가능해서 webkitLineClamp만 없애봤어요!

  moreText.style.display = 'none'; // 더보기 버튼 없애기
  lessText.style.display = 'inline-block'; // '줄이기' 보이게하기
});

// 줄이기 텍스트 클릭시 이벤트
lessText.addEventListener('click', () => {

 // 높이를 초기화하고 다시 원래대로 설정
 bigContent.style.height = 'auto'; // 높이 자동 
 real_text.style.webkitLineClamp = '4'; // 다시 라인 수 제한
 moreText.style.display = 'inline-block'; // '더보기' 보이게하기
});*/

// 더보기
function moretxt(th){
	if (th.id == 'true'){
		th.previousElementSibling .style.webkitLineClamp = 'unset';
		th.innerHTML = "줄이기";
		th.id = 'false';
	} else {
		th.previousElementSibling .style.webkitLineClamp = '4';
		th.innerHTML = "더보기";
		th.id = 'true';
	}
}

function reply(no) {	// 좋아요
	var reply = $('#reply_write').val();
	$.ajax({
		url: "reply.board",
		type: "get",
		dataType: "json",
		data: {
			"no" : no,
			"content" : reply,
		}
	});
	$('.comment').prepend('<div class="wid-100 flex flex-ali-center"><div class="wid-3"></div><i class="fa-regular fa-comment fa-lg" style="color: #1d69ed;"></i><div class="wid-2"></div>'+reply+'</div>');
	$('#reply_write').val('');
}