<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp"%>



<!-- TODO 여기서부터 main영역 -->

	<div class="container">
		<main class="profile_management_page">
			<div class="section">
				<h1 class="mb-4 ms-4 w-100">
					<b>프로필 관리</b>
				</h1>
				<div class="left_profile float-start w-25">
					<div class="picture text-center mb-4 mx-4 p-5 border">
						<img src="/images/git_img.png" alt="" name=""
							class="profile_image mx-auto d-block" /> <label for="form-label"
							class="my-4 fs-5">${principal.username}</label>
						<p class="left_profile_text">프로필 관리</p>
					</div>
					<div class="coupon_profile col ">
						<div class="coupon_count border mx-auto m-2 p-4 w-85 ">
							내 쿠폰<a class="color_primary02 float-end me-2" href="/user/coupon">${couponNum}
								></a>
						</div>
					</div>
					<!-- 쿠폰 창 끝 -->
				</div>
				<!-- 여기까지 left-profile -->
				<form action="/user/profile-management" method="post">
					<div
						class="profile_box float-end d-flex flex-column border p-5 w-75">
						<div class="picture text-center w-100 p-3">
							<div class="position-relative">
								<img src="/images/git_img.png" alt="" name="profileImage"
									class="input_profile_image mx-auto d-block" /> <span
									class="bedge_span position-absolute translate-middle border border-light rounded-circle">
									<span class="visually-hidden">New alerts</span>
								</span>
							</div>
							<label for="userName" class="form-label my-4">${principal.username}</label>
						</div>
						<!-- 프로필 사진 창 끝 -->
						<div class="row row-cols-2 w-100 mx-auto">
							<div class="type_name form-group col p-3">
								<label for="realName">이름</label>
							</div>
							<div class="form-group col w-75 mb-3 p-3 ms-2">
								<span class="realName">${principal.username}</span>
							</div>
							<div class="type_name form-group col p-3">
								<label for="userName">아이디</label>
							</div>
							<div class="form-group col w-75 mb-3 p-3 ms-2">
								<span class="userName">${principal.username}</span>
							</div>
							<div class="type_name form-group col p-3">
								<label for="userTel">연락처</label>
							</div>
							<div class="form-group col w-75 mb-3 ">
								<input type="text" class="userTel form-control m-1 d-inline w-100" name="phoneNumber" id="userTel" value="${principal.phoneNumber}">
							</div>
							<div class="type_name form-group col p-3">
								<label for="email">이메일</label>
							</div>
							<div class="form-group col w-75 mb-3 ">
								<input type="text" class="email form-control m-1 d-inline w-100" name="email" id="email" value="${principal.email}">
							</div>
							<div class="type_name col p-3">
								<label for="snsLink" class="me-5">SNS 연동</label>
							</div>
							<div
								class="form-group col form-check form-switch w-75 mb-3 p-3 ms-2">
								<label for="kakaoLink" class=""><img
									src="https://dffoxz5he03rp.cloudfront.net/icons/kakaotalk-logo.svg" />
									카카오 연동</label> <input type="checkbox"
									class="form-check-input sns_link float-end" role="switch"
									name="snsLink" />
							</div>
							<div class="type_name form-group col p-3">
								<label for="password" class="me-5">비밀번호</label>
							</div>
							<div class="form-group col w-75 mb-3 ">
								<input type="password" class="password form-control m-1 d-inline w-100" name="password" id="password" value="${principal.password}">
							</div>
						</div>
						<!-- 프로필 상세 창 끝 -->
						<hr>
						<div class="mt-3 mx-auto w-100">
							<button class="btn btn_cancel w-49 me-2">취소하기</button>
							<button class="btn btn-primary w-49">저장하기</button>
						</div>
					</div>
				</form>
				<!-- 우측 프로필 창 끝 -->
			</div>
		</main>
		<!-- 프로필 관리 창 끝 -->
	</div>

</div>
</div>

<script src="js/javascript.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>