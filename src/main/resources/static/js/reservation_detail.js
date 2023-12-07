




window.onload = function(){
	
	//취소 버튼을 통해 온경우 값을 받아 모달창 열기(미구현)
	const cancelRequest = true;
	if(cancelRequest)
		document.getElementById('modal_box').style.display = 'block';
	
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
		alert('예약 취소가 정상적으로 처리되었습니다');
		//취소 요청한 예약번호를 인자로 전달(미구현)
		location.href='/reservation/cancel';
	});



}