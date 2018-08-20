function expand() {
	var plus = document.getElementById('closed');
	plus.id = 'open';
	plus.onclick = contract;
	document.getElementById('hide').id = 'show';
}
function contract() {
	var plus = document.getElementById('open');
	plus.id = 'closed';
	plus.onclick = expand;
	document.getElementById('show').id = 'hide';
}
function toggle(that) {
	that.innerHTML = '<div></div><div></div>';
	that.className = 'toggled';
	that.setAttribute('onclick', 'untoggle(this)');
	that.parentElement.parentElement.style.background = 'blue';
}
function untoggle(that) {
	that.innerHTML = '';
	that.className = 'untoggled';
	that.setAttribute('onclick', 'toggle(this)');
	that.parentElement.parentElement.style.background = '#cee1ff';
}
