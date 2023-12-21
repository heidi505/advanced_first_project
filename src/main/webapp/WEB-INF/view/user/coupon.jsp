<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header.jsp -->
<%@ include file="../layout/header.jsp"%>


<!-- TODO 여기서부터 main영역 -->
<main class="counpon_page">
	<div class="container">
		<div class="section">
			<h1 class="my-4 ms-4">
				<b>내 쿠폰</b>
			</h1>
			<div class="left_profile float-start w-25">
				<div class="picture text-center mb-4 mx-4 p-5 border">
					<img src="/images/git_img.png" alt="" name=""
						class="profile_image mx-auto d-block" />
					<p class="my-4 fs-5">홍길동</p>
					<p class="left_profile_text">프로필 관리</p>
				</div>
				<div class="coupon_profile col ">
					<div class="point_amount coupon_count border mx-auto m-2 p-4 w-85 ">
						<p class="mb-3">내 포인트<a class="color_primary02 float-end me-2" href="/user/point">0원
							></a></p>
						<p>내 쿠폰<a class="color_primary02 float-end me-2" href="/user/coupon">0장
							></a></p>
					</div>
				</div>
				<!-- 쿠폰 창 끝 -->
			</div>
			<!-- 여기까지 left-profile -->
			<ul class="nav nav-underline w-60">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">사용가능한 쿠폰</a></li>
			</ul>



			<div class="coupon_box d-flex flex-column border w-60">
				<div class="bg_primary01 m-4 p-2">
					<p class="pt-3">· 지급 받으신 쿠폰은 중복 사용이 불가능합니다.</p>
					<p class="mt-2 pb-3">· 거래 취소시 사용기간이 남아 있을 경우 쿠폰에 따라 돌려드립니다.</p>
				</div>
				<!-- 쿠폰 넣을 창 -->
				<p class="mx-4">나의 쿠폰 목록</p>
				<div class="coupon_list d-flex">
				<div class="pt-2 w-28 mx-4 mb-4 mt-2 border rounded">
					<div class="coupon_discount mt-4 p-2 fs-4 w-75 d-inline">2000원</div><span class="ps-3 w-10 fs-6">7일 남음</span>
					<p class="p-2 fs-6">가입 축하 쿠폰 증정</p>
					<div class="m-2 p-3 bg_line text-center">2023 - 12 - 18 까지</div>
				</div>
				<div class="pt-2 w-28 mx-4 mb-4 mt-2 border rounded">
					<div class="coupon_discount mt-4 p-2 fs-4 w-75 d-inline">2000원</div><span class="ps-3 w-10 fs-6">7일 남음</span>
					<p class="p-2 fs-6">가입 축하 쿠폰 증정</p>
					<div class="m-2 p-3 bg_line text-center">2023 - 12 - 18 까지</div>
				</div>
				<div class="pt-2 w-28 mx-4 mb-4 mt-2 border rounded">
					<div class="coupon_discount mt-4 p-2 fs-4 w-75 d-inline">2000원</div><span class="ps-3 w-10 fs-6">7일 남음</span>
					<p class="p-2 fs-6">가입 축하 쿠폰 증정</p>
					<div class="m-2 p-3 bg_line text-center">2023 - 12 - 18 까지</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</main>
</div>
</div>

<script src="js/javascript.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp"%>