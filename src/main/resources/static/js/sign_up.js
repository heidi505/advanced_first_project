
function validationForm() {
	let form = document.forms[1];
	let name = form.elements["realname"].value;
	let userId = form.elements["username"].value;
	let tel = form.elements["phoneNumber"].value;
	let email = form.elements["email"].value;
	let password = form.elements["password"].value;
	let passwordCheck = document.getElementById('passwordCheck').value;
	console.log(password);
	console.log(passwordCheck);
	
	
	// 이름dp 공백과 null값 검사
	if (!name || name.trim() == '') {
		alert("이름을 입력하세요.");
			return false;
	}
	if (!userId || userId.trim() == ''||userId.length<5) {
		alert("아이디를 입력하세요.");
			return false;
	}
	let emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if (!email||!emailCheck.test(email)){
			alert('올바른 이메일을 입력하세요');
		return false;
	}
	if (!tel.match(/^\d+$/) || tel.length < 5) {
		alert("올바른 연락처를 입력하세요.");
			return false;
	}
	let pwdCheck =/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,15}$/;
	if(!password||!pwdCheck.test(password)){
			alert("올바른 비밀번호를 입력하세요.");
			return false;
	}
	if(!(password == passwordCheck) ){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
	}
	


			return true; // 모든 유효성 검사를 통과하면 true를 반환
	}





window.onload = function(){
	
	
	//아이디가 입력될 때마다 유효성을 검사하여 통과되면 버튼 활성화
	// 통과후 아이디를 변경하지 못하게 불일치 시 버튼 비활성화
	let idInput = document.getElementById('userId');
	let doubleCheckBtn = document.getElementsByClassName('double_check')[0];
	
	idInput.addEventListener('keydown',(e)=>{
	let form = document.forms[1];
	let userId = form.elements["username"].value;
		if (!userId || userId.trim() == ''||userId.length<5) {
			doubleCheckBtn.disabled = true;
		} else {
			doubleCheckBtn.disabled = false;
			
		}
		
	})
		
	const submitBtn = document.getElementsByClassName('submit_btn')[0];
		submitBtn.addEventListener('click',(e)=>{
			if(validationForm()){
				form.submit();
			}
			
		});
	
	
	
}