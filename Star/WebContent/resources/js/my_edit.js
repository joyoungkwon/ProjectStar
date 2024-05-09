
function onMap() {
	document.querySelector('.modal_wrap').style.display = 'flex';
	document.querySelector('.black_bg').style.display = 'flex';
	mapinit('map','add_input');
}
function offMap() {
	document.querySelector('.modal_wrap').style.display = 'none';
	document.querySelector('.black_bg').style.display = 'none';
}

// 영권
// 폼 안에 있는 요소 세팅


function able(th){
	const introInput = document.getElementById('intro');
	introInput.removeAttribute('disabled');
	introInput.focus();
	th.innerHTML = '수정 끝내버리기 >';
    // 버튼 클릭 이벤트를 폼 제출로 변경
	th.setAttribute('onclick', 'document.intro_frm.submit()');
}

setTimeout(function() {
	coo2add_div(latlon, 'addr_div');
}, 100);