function change_Container(x) {
	document.getElementById('open_big').style.display= x;
}

//Element.classList.replace('content_small','content_big');

function small2big(id){
	id.style.display = 'none';
	id.nextElementSibling.style.display = 'block';
}
function big2small(id){
	id.parentNode.parentNode.style.display = 'none';
	id.parentNode.parentNode.previousElementSibling.style.display = 'block';
}
function view_select(select){
	var child = document.getElementById('view_box').children;
	for (i=0; i<child.length; i++){
		if (i%2==select.value){
			child[i].style.display = 'none';
		} else {
			child[i].style.display = 'block';
		}
		
	}
}