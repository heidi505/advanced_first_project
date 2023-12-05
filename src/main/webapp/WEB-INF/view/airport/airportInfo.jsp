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
					<a href="#parking-area" class="parking_btn btn w-100 border btn-primary" id="1_button">주차장</a>
					<a href="#parking-current" class="parking_btn btn w-100 border" id="2_button">주차현황</a>
					<a href="#parking-fee" class="parking_btn btn w-100 border" id="3_button">주차요금</a>
				</div>
			</div>
			<!-- nav 끝 -->
			<!-- parking_area 시작 -->
			<div class="parking_menu w-100 mt-5" id="1">
			<h1 class="mb-4"><b>주차장 안내</b></h1>
			<div class="w-100">
			김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
			</div>
			<div class="image_box">
			<img class="my-5 w-100" src="/images/parking_gimhae.png" alt="">
			<img class="my-5 w-100" src="/images/parking_gimhae.png" alt="">
			</div>
			</div>
			<!-- parking_area 끝 -->
			<!-- parking_menu 시작 -->
			<div class="parking_menu w-100 mt-5" id="2">
			
			</div>
			<!-- parking_menu 끝 -->
			<!-- parking_fee 시작 -->
			<div class="parking_menu w-85 mx-auto mt-5" id="3">
			<h1 class="mb-3"><b>주차요금 체계</b></h1>
			<h2><b class="color_primary02">p1,p2 여객주차장</b></h2>
			<table class="parking_fee_table table w-100 mt-3">
			<thead>
			<tr>
			<th rowspan="2" class="align-middle">구분</th>
			<th colspan="2">월요일~목요일</th>
			<th colspan="2">금요일~일요일 및 법정공휴일</th>
			</tr>
			<tr>
			  <th>소형</th>
			  <th>대형</th>
			  <th>소형</th>
			  <th>대형</th>
			</tr>
			</thead>
			<tbody>
			<tr>
			<td class="align-middle">1일(24시간)주차시
			</td>
			<td class="lh-lg py-5 pe-5 text-start">
			· 기본30분:900원<br>
			· 매 10분:300원 추가<br>
			· 24시간:10,000원
			</td>
			<td class="lh-lg py-5 pe-5">
			· 기본30분:900원<br>
			· 매 10분:300원 추가<br>
			· 24시간:10,000원
			</td >
			<td class="lh-lg py-5 pe-5">
			· 기본30분:900원<br>
			· 매 10분:300원 추가<br>
			· 24시간:10,000원
			</td>
			<td class="lh-lg py-5 pe-5">
			· 기본30분:900원<br>
			· 매 10분:300원 추가<br>
			· 24시간:10,000원
			</td>
			</tr>
			<tr>
			<td class="py-3">1일 추가 주차시</td>
			<td colspan="4" class="py-3">상기요금 반복적용</td>
			</tr>
			</tbody>
			</table>
			<!-- 주차장 요금 정보 테이블1 끝 -->
			<!-- 주차장 요금 정보 테이블2 시작 -->
			<h2><b class="color_primary02">p1,p2 여객주차장</b></h2>
			<table class="parking_fee_table table w-100 mt-3">
			<thead>
			<tr>
			<th rowspan="2" class="align-middle">구분</th>
			<th colspan="2">월요일~목요일</th>
			<th colspan="2">금요일~일요일 및 법정공휴일</th>
			</tr>
			<tr>
			  <th>소형</th>
			  <th>대형</th>
			  <th>소형</th>
			  <th>대형</th>
			</tr>
			</thead>
			<tbody>
			<tr>
			<td class="align-middle">1일(24시간)주차시
			</td>
			<td class="lh-lg py-5 pe-5">
			· 기본30분:900원<br>
			· 매 10분:300원 추가<br>
			· 24시간:10,000원
			</td>
			<td class="lh-lg py-5 pe-5">
			· 기본30분:900원<br>
			· 매 10분:300원 추가<br>
			· 24시간:10,000원
			</td >
			<td class="lh-lg py-5 pe-5">
			· 기본30분:900원<br>
			· 매 10분:300원 추가<br>
			· 24시간:10,000원
			</td>
			<td class="lh-lg py-5 pe-5">
			· 기본30분:900원<br>
			· 매 10분:300원 추가<br>
			· 24시간:10,000원
			</td>
			</tr>
			<tr>
			<td class="py-3">1일 추가 주차시</td>
			<td colspan="4" class="py-3">상기요금 반복적용</td>
			</tr>
			</tbody>
			</table>
			<!-- 주차장 요금 정보 테이블2 끝 -->
			<!-- 주차장 요금 정보 div 끝 -->
			<div class="lh-base">
			· 상기 요금은 입차시간 기준이며, 24시간마다 상기 요금을 반복 적용합니다.
			<br>(문의전화:대표번호:1234-5678, 111-222-3333)
			<br><span class="color_primary02">· P3 여객(화물)주차장은 주말 및 성수기에는 이용객 과다로 만차가 될 수 있음을 미리 알려드리오며, 만차 시에는 P1,P2여객 주차장을 이용해 주시기를 부탁드립니다.
			</span><br>(P1,P2 여객 주차장 이용 시에는 일반 주차장 요금 적용)
			<br>· 주차장 서비스 타임 시행:입차후 10분 이내 출차 시 주차요금 무료(P3여객(화물)주차장은 20분 이내 출차 시 주차요금 무료)
			</div>
			
			
			
			
			
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