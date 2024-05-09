function openSlide() {
  var slide = document.getElementById("slide");
  slide.style.left ='0';

  var background = document.getElementById("slide_background");
  background.style.display = 'block';

}

function closeSlide() {
  var slide = document.getElementById("slide");
  slide.style.left='-80vw';

  var background = document.getElementById("slide_background");
  background.style.display = 'none';
}