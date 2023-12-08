function doubleCheck(username){
	fetch(`/check/username?username=${username}`
	,{ method: "GET",
		headers:{ 
			"Content-Type": "application/json",
			"charset": "UTF-8"
		},
    }).then(response => response.json())
    .then(result=>{ 
		alert(result.data);
		return result.success;
		}).catch(error =>{
		alert(error.data);
		return error.success;
	});
}

function bringNumber(email){
	fetch(`/check/email?email=${email}`
	,{ method: "GET",
		headers:{ 
			"Content-Type": "application/json",
			"charset": "UTF-8"
		},
    }).then(response => response.json())
	  .catch(error =>{
		alert(error.data);
	});
}

function verifyNumber (key){
	fetch(`/verify/email?key=${key}`
	,{ method: "GET",
		headers:{ 
			"Content-Type": "application/json",
			"charset": "UTF-8"
		},
     }).then(response => response.json())
      .then(result=>{ 
			alert(result.data);
			return result.success;
		})
	   .catch(error =>{
			alert(error.data);
			return error.success;
		});
}






// 유효성 검사
function validationForm(form) {
	let name = form.elements["realName"].value;
	let userId = form.elements["username"].value;
	let tel = form.elements["phoneNumber"].value;
	let email = form.elements["email"].value;
	let password = form.elements["password"].value;
	let passwordCheck = document.getElementById('passwordCheck').value;
	
	// 이름dp 공백과 null값 검사
	if (!name || name.trim() == '') {
		alert("이름을 입력하세요.");
			return false;
	}
	if (userId.trim() == ''||userId.length<5) {
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
	//비밀번호가 일치하면 회원가입 활성화
	if(!(password == passwordCheck) ){
		let submitBtn = document.getElementsByClassName('submit_btn')[0];
		submitBtn.disabled = true;
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	} else {
		submitBtn.disabled = false;
	}
		return true; // 모든 유효성 검사를 통과하면 true를 반환
}




window.onload = function(){
	
	let verifyInput = document.getElementById('verifyNumber');
	let idInput = document.getElementById('userId');
	let emailInput = document.getElementById('email');
	let doubleCheckBtn = document.getElementsByClassName('double_check')[0];
	let idCheck = false; // 아이디 중복 체크 통과(true, false);
	let username = ''; //아이디
	let form = document.forms[1];
	let email = ''; 
	let key = verifyInput.value; //인증번호
	let numberCheck = false; // 인증번호 통과(true, false);
	
	//아이디가 입력될 때마다 유효성을 검사하여 통과되면 버튼 활성화
	// 통과후 아이디를 변경하지 못하게 불일치 시 버튼 비활성화
	//아이디 타이핑 시 유효성 검사
	idInput.addEventListener('keydown',(e)=>{
		let form = document.forms[1];
		userId = form.elements["username"].value;

		if (!userId || userId.trim() == '') {
			doubleCheckBtn.disabled = true;
		} else {
			doubleCheckBtn.disabled = false;
		}
	})
	
	let bringNumberBtn = document.getElementsByClassName('bring_number_btn')[0];
	// 이메일 타이핑 시 유효성 검사
	emailInput.addEventListener('keydown',(e)=>{
		email = form.elements["email"].value;
		let emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if (!email||!emailCheck.test(email)){
			bringNumberBtn.disabled = true;
		} else {
			bringNumberBtn.disabled = false;
		}
	})
	
	// 처음 인증받기와 인증번호 display 제거
	let verifyBtn = document.getElementsByClassName('verify_btn')[0]; 
	verifyBtn.style.display = 'none';
	verifyInput.style.display = 'none';
	bringNumberBtn.disabled = true;
	doubleCheckBtn.disabled = true;
	
	//이메일에 인증메일 보내기
	bringNumberBtn.addEventListener('click',(e)=>{
		bringNumber(email);
		verifyBtn.style.display = 'inline-block';
		verifyInput.style.display = 'inline';
	})
	
	//인증 번호 일치여부 확인
	verifyBtn.addEventListener('click',(e)=>{
		numberCheck =  verifyNumber(key);
		
	})
	
	//중복 체크 이벤트
	doubleCheckBtn.addEventListener('click',(e)=>{
		idCheck = doubleCheck(username);
	})
	
	// 가입 버튼 시 유효성 검사 통과 후 가입	
	let submitBtn = document.getElementsByClassName('submit_btn')[0];
	submitBtn.addEventListener('click',(e)=>{
		if(validationForm(form)){
			if(idCheck&&numberCheck){
				form.submit();
			}
		}
	});
	
}