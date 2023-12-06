




window.onload = function(){
	
	//취소 버튼을 통해 온경우 값을 받아 모달창 열기
	const cancelRequest = true;
	if(cancelRequest)
		document.getElementById('cancel_modal').style.display = 'block';
	
	// 모달창 닫기
	document.getElementById('close_btn').addEventListener('click', function () {
    	document.getElementById('cancel_modal').style.display = 'none';
	});

	// 모달 외부 클릭 시 모달 닫기
	window.addEventListener('click', function (e) {
   	 var modal = document.getElementById('cancel_modal');
    	if (e.target == modal) {
       	 modal.style.display = 'none';
    	}
	});
	
	const cancel_btn  = document.getElementById('cancel_request_btn');
	cancel_btn.addEventListener('click',(e)=>{
		location.href='/reservation/cancel';
	});



}