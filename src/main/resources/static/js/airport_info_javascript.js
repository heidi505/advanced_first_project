
// 주차메뉴 버튼
function openMenu(evt, menuNumber) {
  let i, x, parking_btn;
  x = document.getElementsByClassName('parking_menu');
  for (i = 0; i < x.length; i++) {
    x[i].style.display = 'none';
  }
  parking_btn = document.getElementsByClassName('parking_btn');
  for (i = 0; i < x.length; i++) {
    parking_btn[i].className = parking_btn[i].className.replace(' btn-primary', '');
  }
  document.getElementById(menuNumber).style.display = 'block';
  evt.currentTarget.className += ' btn-primary';
}
	
	
window.onload = function(){
	
	//공항 주차장 버튼 이벤트 등록
	const aButton = document.getElementsByClassName('parking_btn');
	for(let i=0; i<aButton.length;i++){
		aButton[i].addEventListener('click', e=>{
			let menuNumber = aButton[i].id.replace('_button','');
			openMenu(e, menuNumber);
		});
	}
	
}