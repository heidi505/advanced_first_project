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
					<form action="/admin/sign-in" method="post">
						<div class="form-group w-75 mx-auto pt-2 mt-3">
							<label for="userId">아이디*</label> <input type="text"
																	class="form-control mt-2 me-2 p-2" name="username" id="userId" value="admin1"
																	placeholder="아이디를 입력해주세요" />
						</div>
						<div class="form-group w-75 mx-auto pt-2 mt-2">
							<label for="password">비밀번호*</label> <input type="password"
																	   class="form-control mt-2 me-2 p-2" name="password" value="1111"
																	   id="password" placeholder="비밀번호를 입력해주세요" />
						</div>
						<div class="form-group w-75 mx-auto d-flex mb-4 mt-3">
							<button type="submit" class="btn btn-primary p-2 w-100">로그인</button>
						</div>
					</form>
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