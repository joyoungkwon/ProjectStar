function scrollInit(){
	const select = document.getElementById('select_cate');
	const container = document.getElementById('all_mini');
	
	// 요소가 가운데로 오도록 스크롤 위치 계산
	const scrollLeft = (select.offsetLeft - container.offsetLeft) - (container.clientWidth - select.offsetWidth)/2;
	
	// 스크롤 조정
	container.scrollTo({
		left: scrollLeft
	});
}

setTimeout(function() {
	scrollInit();
}, 100);