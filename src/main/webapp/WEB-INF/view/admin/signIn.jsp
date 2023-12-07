<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<%@ include file="../layout/adminHeader.jsp"%>


<!-- TODO 여기서부터 main영역 -->
<main id="admin_sign_in_page" class="sign_in_page">
	<div class="container">
		<div class="section">
			<div class="login_box mx-auto w-35 border">
				<div class="top_bar p-3 border"><h2>로그인</h2></div>
				<div class="d-flex flex-column w-100">
					<form action="/user/sign-in" method="post">
						<div class="form-group w-75 mx-auto pt-2 mt-3">
							<label for="userId">아이디*</label> <input type="text"
																	class="form-control mt-2 me-2 p-2" name="userId" id="userId"
																	placeholder="아이디를 입력해주세요" />
						</div>
						<div class="form-group w-75 mx-auto pt-2 mt-2">
							<label for="password">비밀번호*</label> <input type="password"
																	   class="form-control mt-2 me-2 p-2" name="password"
																	   id="password" placeholder="비밀번호를 입력해주세요" />
						</div>
						<div class="d-flex flex-row-reverse mt-3">
							<a href="#" class="pwd_find w-75 mx-auto">비밀번호 찾기</a>
						</div>
						<div class="form-group w-75 mx-auto d-flex mb-4 mt-3">
							<button type="submit" class="btn btn-primary p-2 w-100">로그인</button>
						</div>
					</form>
					<div class="mb-3 mx-auto text-center">
						<span class="fs-6">아직 회원이 아니신가요?</span><a href="/user/sign-up"
																  class="insert_user ms-4">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

</div>
</div>

<script src="js/javascript.js"></script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp"%>