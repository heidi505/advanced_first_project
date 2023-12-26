
// 운임규정 열기
function openMenu(event, ruleNumber) {
  let i, x, ruleBtn;
  x = document.getElementsByClassName('rule_cont');
  for (i = 0; i < x.length; i++) {
    x[i].style.display = 'none';
  }
  ruleBtn = document.getElementsByClassName('rule_btn');
  for (i = 0; i < x.length; i++) {
    ruleBtn[i].className = ruleBtn[i].className.replace(' active', '');
  }
  document.getElementById(ruleNumber).style.display='block';
  event.currentTarget.className += ' active';
}



window.onload = function(){

	
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
	
	
	
	//메뉴 버튼 이벤트 등록
	const ruleBtn = document.getElementsByClassName('rule_btn');
	for(let i=0; i<ruleBtn.length;i++){
		ruleBtn[i].addEventListener('click', e=>{
			let ruleNumber = e.target.id.replace('button_','');
			openMenu(e, ruleNumber);
		});
	}
	
	const rulOpenBtn = document.getElementsByClassName('fare_regulations_btn')[0];
	rulOpenBtn.addEventListener('click',(e)=>{
		ruleBtn[0].click();
		document.getElementById('modal_box').style.display = 'block';
	})


}