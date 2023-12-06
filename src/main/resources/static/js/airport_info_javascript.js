
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

// 모든 주차장의 혼잡도 변화(미구현)
function updateStatus(){
	let i, allStatus;
  	allStatus = document.getElementsByClassName('parking_status');
  // 모든 상황 초기화
  for (i = 0; i < allStatus.length; i++) {
    allStatus[i].style.color = 'var(--basic_09)';
	allStatus[i].style.backgroundColor = 'var(--basic_09)';
  }
  allStatus[2].style.color = 'var(--basic_wh)';
  allStatus[2].style.backgroundColor = 'var(--cancle)';
  allStatus = document.getElementsByClassName('parking_status_2nd');
  for (i = 0; i < allStatus.length; i++) {
    allStatus[i].style.color = 'var(--basic_09)';
	allStatus[i].style.backgroundColor = 'var(--basic_09)';
  }
  // api를 통해 현황을 받으면 변화
  let current = '원활';
  switch(current) {
	  case '원활': allStatus[0].style.color = 'var(--basic_wh)';
  				   allStatus[0].style.backgroundColor = 'green'; 
  				   break;
	  case '보통': break;
	  case '혼잡': break;
  }
  
}
	
	
window.onload = function(){
	
	//공항 주차장 버튼 이벤트 등록
	const aButton = document.getElementsByClassName('parking_btn');
	for(let i=0; i<aButton.length;i++){
		aButton[i].addEventListener('click', e=>{
			let menuNumber = aButton[i].id.replace('_button','');
			if( i == 2){
				updateStatus();
			} 
			openMenu(e, menuNumber);
		});
	}
	
	const parkingStatusBtn = document.getElementById('2_button');
	parkingStatusBtn.addEventListener('click',e=>{
		updateStatus();
	})
	
	//시작 메뉴
	const startMenu = document.getElementById('2_button');
	startMenu.click();
	
	//api로 받은 데이터 기반으로 색상및 글 변환(미구현)
	const congestionStatus = document.getElementsByClassName('congestion_status')[0];
	congestionStatus.style.color = 'var(--cancle)';
	congestionStatus.innerHTML = '혼잡';	
}