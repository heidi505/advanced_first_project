
// 주차메뉴 버튼
function openMenu(evt, menuNumber) {
  let i, parkingMenu, parkingBtn;
  parkingMenu = document.querySelectorAll('.parking_menu');
  parkingMenu.forEach(menu => {
    menu.style.display = 'none';
  });
  parkingBtn = document.getElementsByClassName('parking_btn');
  i = 0;
  parkingMenu.forEach(e => {
    parkingBtn[i].className = parkingBtn[i].className.replace(' btn-primary', '');
    i++;
  });
  document.getElementById(menuNumber).style.display = 'block';
  evt.currentTarget.className += ' btn-primary';
}

//혼잡도 상황 변화 함수
function changeStatus(allStatus, current){
	switch(current) {
	  case '원활': allStatus[0].style.color = 'var(--basic_wh)';
  				  allStatus[0].style.backgroundColor = 'green'; 
  				   break;
	  case '보통': allStatus[1].style.color = 'var(--basic_wh)';
  				  allStatus[1].style.backgroundColor = 'var(--primary02)'; 
	  			  break;
	  case '혼잡': allStatus[2].style.color = 'var(--basic_wh)';
  				  allStatus[2].style.backgroundColor = 'var(--cancle)'; 
	  			  break;
  }
}
	
// 모든 주차장의 혼잡도 변화(미구현)
// 주차장 수에 따라 상황판 수가 변경될 필요
// 클래스명을 모두 같은 이름으로 하여 끝에만 1,2,3,순서로 번호를 붙이도록
// for문 안에서 숫자를 + 시키면서 클래스를 찾아야 할듯
function updateStatus(){
	let allStatus;
	let current = '혼잡'; // 첫번째 값(api로 받은 값)
  	allStatus = document.querySelectorAll('.parking_status');
  // 첫번째 모든 상황 초기화
  allStatus.forEach(status=>{
    status.style.color = 'var(--basic_09)';
	status.style.backgroundColor = 'var(--basic_09)';
  });
  changeStatus(allStatus, current);
  // 두번째 상황도 초기화
  allStatus = document.querySelectorAll('.parking_status_2nd');
  allStatus.forEach(status=>{
    status.style.color = 'var(--basic_09)';
	status.style.backgroundColor = 'var(--basic_09)';
  });
  // api를 통해 현황을 받으면 변화
  current = '원활'
  changeStatus(allStatus, current);
  
}
	
	
window.onload = function(){
	
	//공항 주차장 버튼 이벤트 등록
	const aButton = document.querySelectorAll('.parking_btn');
	aButton.forEach(button=>{
		button.addEventListener('click', e=>{
			let menuNumber = e.target.id.replace('_button','');
			if( menuNumber == 2){
				updateStatus();
			} 
			openMenu(e, menuNumber);
		});
	});
	
	//시작 메뉴
	const startMenu = document.getElementById('1_button');
	startMenu.click();
	
	//api로 받은 데이터 기반으로 색상및 글 변환(미구현)
	const congestionStatus = document.getElementsByClassName('congestion_status')[0];
	congestionStatus.style.color = 'var(--cancle)';
	congestionStatus.innerHTML = '혼잡';
}