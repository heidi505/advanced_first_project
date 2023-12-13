async function cancelReservation(reservationNumArray){
	try {
        const response = await fetch(`/reservation/cancel`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
				list:reservationNumArray,
            }),
        });
        const result = await response.json();     
		console.log(result);
    } catch (error) {
		alert('예약 취소에 실패했습니다');
        return false; 
    }
	
}



window.onload = function(){
	
	const allCheckbox = document.querySelector('.all_checkbox');
	allCheckbox.addEventListener('change',e=>{
		let check = e.target.checked;
		let checkboxes = document.querySelectorAll('.checkbox');
		checkboxes.forEach((checkbox)=>{
			checkbox.checked = check;
		});
	});

	//예약 취소 버튼을 통해 온경우 값을 받아 모달창 열기
	let cancelRequest = document.querySelector('.cancel_request').value;
	if(cancelRequest){
		document.getElementById('modal_box').style.display = 'block';
	}
	
	// 모달창 닫기
	document.getElementById('close_btn').addEventListener('click', function () {
    	document.getElementById('modal_box').style.display = 'none';
	});

	// 모달 외부 클릭 시 모달 닫기
	window.addEventListener('click', function (e) {
   	 var modal = document.getElementById('modal_box');
    	if (e.target == modal) {
       	 modal.style.display = 'none';
    	}
	});
	
	//모달창에서 취소요청버튼 이벤트 연결
	const cancel_btn  = document.getElementById('cancel_request_btn');
	cancel_btn.addEventListener('click',(e)=>{
		let checkboxes = document.querySelectorAll('.checkbox:checked');
		//let reservationNumArray = [];
		let reservationNumArray = new Array();
		checkboxes.forEach((checkbox)=>{
			reservationNumArray.push(checkbox.parentElement.nextElementSibling.innerText);
		});
		cancelReservation(reservationNumArray);
		//location.href=`/reservation/cancel/${reservationNum}`;
	});
	
	



}