function select_toggle() {
	const div = document.getElementsByClassName('true');
	
	for (var i of div){
		if (i.style.display === 'none') {
			i.style.display = 'flex';
		} else {
			i.style.display = 'none';
		}
	}

} 