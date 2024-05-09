function openSlide() {
  var slide = document.getElementById("slide1");
  slide.style.left ='0';

  var background = document.getElementById("slide1_background");
  background.style.display = 'block';

}

function closeSlide() {
  var slide = document.getElementById("slide1");
  slide.style.left='-80vw';

  var background = document.getElementById("slide1_background");
  background.style.display = 'none';
}

// 카테고리 중앙 이동
function scrollToCenter(select) {
    const preSelect = document.getElementById('select_cate');
	preSelect.setAttribute("id", "");
	select.setAttribute("id", "select_cate");
    const container = document.getElementById('all_mini');

    // 요소가 가운데로 오도록 스크롤 위치 계산
    const scrollLeft = (select.offsetLeft - container.offsetLeft) - (container.clientWidth - select.offsetWidth)/2;

    // 스크롤 애니메이션 적용
    container.scrollTo({
      left: scrollLeft,
      behavior: 'smooth'
    });
}