function management(){
	location.href="/user/profile-management";
}



window.onload = function(){
	
	const btn = document.getElementsByClassName('go_management');
	console.log(btn);
	btn[0].addEventListener('click', () =>{ management()});
	
}