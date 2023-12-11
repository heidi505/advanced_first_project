
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
			allStatus[2].style.backgroundColor = 'orange';
			break;
		case '매우 혼잡': allStatus[3].style.color = 'var(--basic_wh)';
			allStatus[3].style.backgroundColor = '#ed5342';
			break;
	}
}
	
// 모든 주차장의 혼잡도 변화
// 주차장 수에 따라 상황판 수가 변경될 필요
// 클래스명을 모두 같은 이름으로 하여 끝에만 1,2,3,순서로 번호를 붙이도록
var statusTT1 = document.getElementById("statusTT1").innerText;
var statusTT2 = document.getElementById("statusTT2").innerText;
function updateStatus() {
	console.log("Received statusTT1:", statusTT1);
	console.log("Received statusTT2:", statusTT2);

	// 첫 번째 상황 초기화
	let allStatus = document.querySelectorAll('.parking_status');
	resetStatus(allStatus);

	// 첫 번째 상황 갱신
	let current = document.getElementById('statusTT1').textContent;
	changeStatus(allStatus, current);

	// 두 번째 상황 초기화
	allStatus = document.querySelectorAll('.parking_status_2nd');
	resetStatus(allStatus);

	// 두 번째 상황 갱신
	current = document.getElementById('statusTT2').textContent;
	changeStatus(allStatus, current);
}

// 상황 초기화 함수
function resetStatus(statusElements) {
	statusElements.forEach(status => {
		status.style.color = 'var(--basic_09)';
		status.style.backgroundColor = 'var(--basic_09)';
	});
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