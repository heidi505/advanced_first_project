<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>


<!-- TODO 여기서부터 main영역 -->
<main class="reservation_detail_page pt-0 mt-0">
	<div class="container">
		<div class="section">
			<h1 class="text-center my-5 color_cancle"><b>X 취소된 예약입니다.</b></h1>
			<hr class="my-5">
			<div><b class="mt-5 fs-5">홍길동님의 예약번호는 1111-2222입니다. 해당 예약은 <span class="color_cancle">취소</span>되었습니다.</b>
			<b class="float-end color_primary02">결제마감시한 2023-12-01(금) 17:00</b>
			<hr class="border-2 border-primary">
			</div>
			<p class="text-end me-5">예약상태<span class="color_basic09 mx-2">|</span><span class="color_cancle">예약취소</span></p>
			<div class="detail_cont_box row mx-auto align-middle mt-3">
			<div class="col-3 air_info border-end text-center pt-4">
			<div class="float-start ms-5"><b class="lh-lg">부산<br><span class="color_basic09">PUS</span></b></div>
			
			 <div class="trip_image w-10 border p-4 my-2 mx-auto d-inline"></div> 
			 <div class="float-end me-5"><b class="lh-lg">김포<br><span class="color_basic09">GMP</span></b></div>
			</div>
			<div class="col py-3 border-end text-center align-middle">
			<div class="airline_image w-10 p-4 mx-auto mb-2"> </div>
			<p><b>진에어</b></p></div>
			<div class="col py-3 border-end text-center align-middle">
			<p class="mt-3 mb-4 color_basic09">운향종류</p>
			<p>왕복</p>
			</div>
			<div class="col py-3 border-end w-25 text-center">
			<p class="mt-3 mb-4 color_basic09">좌석등급</p>
			<p>일반석</p>
			</div>
			<div class="col py-3  w-25 text-center">
			<p class="mt-3 mb-4">출발일 01.09(화)</p>
			<p>도착일 01.11(목)</p>
			</div>
			<div class="col py-3  w-25">
			<p class="mt-3 mb-3">예약자명: 홍길동</p>
			<p>연락처명: 010-0000-0000</p>
			</div>
			</div>
			<div class="reservation_notice w-100 border p-3 mt-5 lh-lg" >
			<p>항공권은 이메일을 통해 전자항공권(E-TICKET)으로 발송됩니다.</p>
			<p>탑승시간 최소 2시간 전에 체크인 당부드립니다.</p>
			<p>여권 만료일이 출발일로부터 6개월 미만인 경우 탑승이 불가합니다.</p>
			</div>
			
			
			
			<div class="mt-5 fs-4"><b>탑승객 정보 및 결제 정보</b><button class="fare_regulations_btn btn float-end mb-2">운임규정보기</button></div>
			<table class="passenger_info_table w-100">
			<thead>
			<tr>
			<td colspan="3">탑승객</td>
			<td>생년월일</td>
			<td>항공요금</td>
			<td>유류할증료</td>
			<td>제세공과금</td>
			<td>발권수수료</td>
			<td>총액운임</td>
			<td>결제상태</td>
			</tr>
			</thead>
			<tbody>
			<tr>
			<td class="w-10">홍길동</td>
			<td class="w-10">성인</td>
			<td>남</td>
			<td>19990101</td>
			<td>159,000</td>
			<td>73,800</td>
			<td>48,900</td>
			<td>10,000</td>
			<td>300,000</td>
			<td>결제요청전</td>
			</tr>
			</tbody>
			</table>
			
			
		</div>
		<!-- section end -->
	</div>
</main>

</div>
</div>


<!-- <script src="/js/airport_info_javascript.js"></script> -->
<!-- footer.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>