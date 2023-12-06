<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>


<!-- TODO 여기서부터 main영역 -->
<main class="reservation_detail_page pt-0 mt-0">
	<div class="container">
		<div class="section">
			<hr class="mt-5">
			<div><b class="mt-5">홍길동님의 예약번호는 1111-2222입니다</b>
			<b class="float-end color_primary02">결제마감시한 2023-12-01(금) 17:00</b>
			<hr class="border-2 border-primary">
			</div>
			<p class="text-end me-5">예약상태: 결제 전</p>
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
		</div>
		<!-- section end -->
	</div>
</main>

</div>
</div>


<!-- <script src="/js/airport_info_javascript.js"></script> -->
<!-- footer.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>