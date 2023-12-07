<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp"%>


<!-- TODO 여기서부터 main영역 -->
<main class="reservation_detail_page pt-0 mt-0">
	<div class="container">
		<div class="section">
			<hr class="my-5">
			<div><b class="mt-5">홍길동님의 예약번호는 1111-2222입니다</b>
			<b class="float-end color_primary02">결제마감시한 2023-12-01(금) 17:00</b>
			<hr class="border-2 border-primary">
			</div>
			<p class="text-end me-5">예약상태<span class="color_basic09 mx-2">|</span> 결제 전</p>
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
			

			<!-- 모달창 부분 -->
   		   <div id="modal_box" class="modal">
       	   <div class="modal_cont">
       	   <!-- 여기부터 모달창 내용 -->
           
           <div class="pt-2">
           <b class="fs-5">예약 취소 요청</b><span class="close" id="close_btn">&times;</span>
           <div class="border-top p-1 mt-4 d-flex">
           <div class="p-2"><input type="checkbox" class="checkbox_all p-5 float-start" ></div>
           <div class="w-10 text-center p-2">번호</div>
           <div class="p-2 ms-2 w-75">이름</div>
           </div>
           <div class="border-top border-bottom p-1 d-flex mb-4">
           <div class="p-2 "><input type="checkbox" class="checkbox p-5 float-start" ></div>
           <div class="w-10 text-center py-2 ">1</div>
           <div class="p-2 ms-2 w-75">HONG/GILDONG (MS)</div>
           </div>
           
           <div class="p-3 bg_line">
            <p class="my-2 fs-5">재예약을 위한 취소인가요?</p>
            <div class="lh-sm">
           		김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
			김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
			
            </div>
            <p class="my-2 fs-5">탑승객에 소아/유아가 있는 경우</p>
            <div class="lh-sm">
            김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
			김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.  
            </div>
           </div>
           <div class="py-4 mb-4">
           <b class="float-start lh-lg">취소 요청 후 철회할 수 없습니다</b><button class="btn w-35 btn-primary float-end" id="cancel_request_btn">탑승객 취소요청</button>
           </div>
           
           </div>
           
           
            <!-- 모달창 내용 끝 -->
           </div>
           </div>
			
			
			
		</div>
		<!-- section end -->
	</div>
</main>

</div>
</div>


<script src="/js/reservation_detail.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp"%>