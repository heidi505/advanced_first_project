<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>


<!-- TODO 여기서부터 main영역 -->
<main class="airport_info_page pt-0 mt-0">
	<div class="container">
		<div class="section">
			<div class="pt-5">
				<h2>
					<b>나의 공항정보 - <span class="color_primary02">인천공항</span></b><span
						class="fs-6 float-end me-3"><span class="">원활</span> 보통 혼잡
						매우혼잡</span>
				</h2>
				<div class="p-5 mx-auto text-center">
					<p class="color_primary02">BOARDING PROCESS TIME</p>
					<p class="fs-1 my-2"><b>국내선 탑승수속 소요시간 안내</b></p>
					<p class="mt-3"><b>셀프 체크인부터 항공기 탑승까지 평균 체류시간</b></p>
					<div class="mt-5">
						<span class="p-3">
							<b class="fs-1 color_primary02">66</b><b class="ms-2 fs-3 align-text-baseline">분</b> 
						</span>
					</div>
				</div>
				<hr>
			</div>
			<!-- 상단 페이지 끝-->
			<h2 class="mb-3 mt-5"><b>주차장 안내</b></h2>
			<div class="airport_parking_nav_bar mt-5 w-100 mx-auto">
				<div class="btn-group w-100"  role="group" aria-label="Basic example">
					<a href="#parking-area" class="parking_btn btn btn-primary w-100 px-5 border" id="1_button">주차장</a>
					<a href="#parking-current" class="parking_btn btn w-100 px-5 border" id="2_button">주차현황</a>
					<a href="#parking-fee" class="parking_btn btn w-100 px-5 border" id="3_button">주차요금</a>
				</div>
			</div>
			<!-- nav 끝 -->
			<!-- parking_area 시작 -->
			<div class="parking_menu" id="1">
			<div class="w-100 mt-5">
			<h1 class="mb-4"><b>주차장 안내</b></h1>
			<div class="w-100">
			김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
			</div>
			</div>
			<div class="image_box">
			<img class="my-5 w-100" src="/images/parking_gimhae.png" alt="">
			<img class="my-5 w-100" src="/images/parking_gimhae.png" alt="">
			</div>
			</div>
			<!-- parking_area 끝 -->
			<!-- parking_menu 시작 -->
			<div class="parking_menu" id="2">
			
			</div>
			<!-- parking_menu 끝 -->
			<!-- parking_fee 시작 -->
			<div class="parking_menu" id="3">
			
			</div>
			<!-- parking_fee 끝 -->
			
			
			
		</div>
		<!-- section end -->
	</div>
</main>

</div>
</div>


<script src="/js/airport_info_javascript.js"></script>
<!-- header.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>