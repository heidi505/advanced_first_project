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
					<c:choose>
						<c:when
							test="${not empty principal and not empty principal.profileImage}">
							<div class="input_profile_image mt-4">
								<img class="preview"
									src="<c:url value='/image/${principal.profileImage}'/>"
									alt="프로필 이미지">
							</div>
						</c:when>
						<c:otherwise>
							<div class="input_profile_image mt-4">
								<img class="preview" src="<c:url value='/image/basic_img.svg'/>"
									alt="기본 이미지">
							</div>
						</c:otherwise>
					</c:choose>
					<p class="my-4 principal_username">${principal.username}</p>
					<!-- 쿠폰 창 끝 -->
				</div>
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
				<p class="mx-4"><b>나의 쿠폰 목록</b></p>
				<div class="coupon_list row">
					<c:forEach var="coupon" items="${couponList}">
						<div class="pt-2 w-28 ms-4 mb-4 mt-2 border rounded">
							<input type="hidden" class="coupon_number" value="${coupon.id}">
							<div class="coupon_discount p-2 fs-4 w-75">${coupon.SDiscountingPrice}원</div>
							<span class="ms-2 w-10 fs-6">${coupon.remainingDays}일 남음</span>
							<p class="px-2 pt-3 fs-6">${coupon.couponName}</p>
							<div class="m-2 p-3 bg_line text-center">${coupon.expiredAt}
								까지</div>
						</div>
					</c:forEach>
					<c:if test="${couponList eq '[]'}">
					<p class="py-5 text-center">보유하신 쿠폰이 없습니다</p>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</main>
</div>
</div>

<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp"%>