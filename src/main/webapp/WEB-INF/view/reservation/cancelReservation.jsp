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
			
			<!-- 모달창 부분 -->
   		   <div id="modal_box" class="modal">
       	   <div class="modal_cont">
       	   <!-- 여기부터 모달창 내용 -->
           
           <div class="pt-2">
           <b class="fs-5">운임규정</b><span class="close" id="close_btn">&times;</span>
           
           </div>
           <!-- 규정 내용 박스 -->
           <div class="regulation_box p-3 mt-5">
           <ul class="nav nav-underline border-bottom">
  			<li class="nav-item">
   				 <a class="rule_btn nav-link active" aria-current="page" href="#" id="button_1">예약규정</a>
 			 </li>
 			 <li class="nav-item">
   			 <a class="rule_btn nav-link" href="#" id="button_2">운임규정</a>
 			 </li>
 			 <li class="nav-item">
  			  <a class="rule_btn nav-link" href="#" id="button_3">결제규정</a>
 			 </li>
 			 <li class="nav-item">
   			 <a class="rule_btn nav-link" href="#" id="button_4">환불/변경</a>
 			 </li>
			</ul>
			<!-- navbar 끝 -->
			<!-- 예약규정 창 -->
			<div class="rule_cont " id="1">  
            <p class="my-3 fs-5 color_primary02">▶발권 수수료1111</p>
            <div class="lh-sm">
           		김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
            </div>
            <p class="my-2 fs-5 color_primary02">▶발권 수수료</p>
            <div class="lh-sm">
            김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
            </div>
            
            
           </div>
           <!-- 예약규정 창 끝 -->
           	<!-- 운임규정 창 -->
			<div class="rule_cont" id="2">  
            <p class="my-3 fs-5 color_primary02">▶발권 수수료2222</p>
            <div class="lh-sm">
           		김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
            </div>
            <p class="my-2 fs-5 color_primary02">▶발권 수수료</p>
            <div class="lh-sm">
            김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
            </div>
            
            
           </div>
           <!-- 운임규정 창 끝 -->
            	<!-- 결제규정 창 -->
			<div class="rule_cont" id="3">  
            <p class="my-3 fs-5 color_primary02">▶발권 수수료3333</p>
            <div class="lh-sm">
           		김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
            </div>
            <p class="my-2 fs-5 color_primary02">▶발권 수수료</p>
            <div class="lh-sm">
            김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
            </div>
            
            
           </div>
           <!-- 결제규정 창 끝 -->
            	<!-- 환불/결제 창 -->
			<div class="rule_cont" id="4">  
            <p class="my-3 fs-5 color_primary02">▶발권 수수료4444</p>
            <div class="lh-sm">
           		김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
            </div>
            <p class="my-2 fs-5 color_primary02">▶발권 수수료</p>
            <div class="lh-sm">
            김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
            김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
			 <p class="my-2 fs-5 color_primary02">▶발권 수수료</p>
            김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
            김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
			총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다. 
            </div>
            
            
           </div>
           <!-- 환불/결제 창 끝 -->
          
           
           
           </div>
            <!-- 규정 내용 박스 끝-->
           
           
            <!-- 모달창 내용 끝 -->
           </div>
           </div>
			
			
			
		</div>
		<!-- section end -->
	</div>
</main>

</div>
</div>


<script src="/js/cancel_reservation.js"></script>
<!-- footer.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>