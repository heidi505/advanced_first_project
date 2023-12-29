<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp"%>
<style>
	.airline_image{
		background:url('/images/airline_images/${cancelTrip.airline}.png');
		background-size: cover;
	}
</style>

<!-- TODO 여기서부터 main영역 -->
<main class="reservation_detail_page">
	<section class="reservation_detail_area">
		<div class="container">
			<div class="section">
				<h1 class="text-center my-5 color_cancle"><b>X 취소된 예약입니다.</b></h1>
				<hr class="my-5">
				<div><b class="mt-5 fs-5">${cancelTrip.realName}님의 예약번호는 ${cancelTrip.reservationNum}입니다. 해당 예약은 <span class="color_cancle">취소</span>되었습니다.</b>
					<hr class="border-2 border-primary">
				</div>
				<p class="text-end me-5">예약상태<span class="color_basic09 mx-2">|</span><span class="color_cancle">예약취소</span></p>
				<div class="detail_cont_box row mx-auto align-middle mt-3">
					<div class="col-3 air_info border-end text-center pt-4">
						<div class="float-start ms-5"><b class="lh-lg">${cancelTrip.koreanDepartureAirport}<br><span class="color_basic09">${cancelTrip.departureCity}</span></b></div>

						<div class="trip_image p-4 my-2 mx-auto"></div>
						<div class="float-end me-5"><b class="lh-lg">${cancelTrip.koreanArrivalAirport}<br><span class="color_basic09">${cancelTrip.arrivalCity}</span></b></div>
					</div>
					<div class="col py-3 border-end text-center align-middle">
						<div class="airline_image w-10 p-4 mx-auto mb-2"> </div>
						<p><b>${cancelTrip.koreanAirline}</b></p></div>
					<div class="col py-3 border-end text-center align-middle">
						<p class="mt-3 mb-4 color_basic09">운향종류</p>
						<p>
							<c:choose>
								<c:when test="${cancelTrip.isOneWay eq true}">
									편도
								</c:when>
								<c:otherwise>
									왕복
								</c:otherwise>
							</c:choose>
						</p>
					</div>
					<div class="col py-3 border-end w-25 text-center">
						<p class="mt-3 mb-4 color_basic09">좌석등급</p>
						<p>${cancelTrip.seatType}</p>
					</div>
					<div class="col py-3  w-25 text-center">
						<p class="mt-3 mb-4">출발일 ${cancelTrip.departureDate}</p>
						<p>도착일 ${cancelTrip.arrivalDate}</p>
					</div>
					<div class="col py-3  w-25">
						<p class="mt-3 mb-4">예약자명 : 김하얀</p>
						<p>연락처 : ${cancelTrip.phoneNumber}</p>
						<p class="mt-4">아이디 : ${sessionScope.principal.username}</p>
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
					<c:forEach var="payedInfo" items="${payedInfoList}">
						<tr>
							<td class="w-10">${payedInfo.lastName}${payedInfo.firstName}</td>
							<td class="w-10">${payedInfo.passengerType}</td>
							<td>${payedInfo.gender}</td>
							<td>${payedInfo.birthdate}</td>
							<td>${payedInfo.SAirFare}</td>
							<td>${payedInfo.SFuelSurcharge}</td>
							<td>${payedInfo.STaxes}</td>
							<td>${payedInfo.STicketingFee}</td>
							<td>${payedInfo.STotalPrice}</td>
							<c:choose>
								<c:when test="${payedInfo.isPayed eq true}">
									<td>결제완료됨</td>
								</c:when>
								<c:otherwise>
									<td>결제요청전</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
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
								<p class="my-3 fs-5 color_primary02">▶항공사 일반규정</p>
								<div class="lh-sm">
									※ 항공사 홈페이지에서 부가서비스 별도 구매 후 여정변경 및 취소 시, 부가서비스 반드시 선 취소 후 진행해야합니다.
									<br>※ 상기 모든 수수료는 1인/1회 기준 금액 입니다.
									<br>※ 예약일과 발권일이 상이한 경우 발권일의 환율에 따라 TAX(유류할증료 포함)가 변동될 수 있습니다.
									<br>※ 항공사의 사정으로 별도의 공지없이 운임 및 규정이 변경되어 운임 차액이 발생하는 경우 운임차액 추가 징수됩니다.
									<br>※ 항공권은 반드시 첫번째 여정부터 순서대로 사용하셔야하며, 순서대로 이용하지 않은 항공권은 취소처리될 수 있으며, 환불불가합니다.
									<br>※ 동일 혹은 다수의 여행사를 통해 동일항공편을 이중예약하는 경우, 항공사에 의해 예약취소될 수 있으니 유의해 주시기 바랍니다.
									<br>※ 자세한 운송약관은 항공사 홈페이지 [바로가기] 하단의 국제여객운송약관을 통해 확인 부탁드립니다.
								</div>
								<p class="my-2 fs-5 color_primary02">▶항공사 수수료- 환불</p>
								<div class="lh-sm">
									[환불수수료] * 수수료 공제 후 환불
									<br><br>ㆍ출발 91일 전: 환불수수료 없음
									<br>ㆍ출발 90일~61일 전: 편도당 30,000원
									<br>ㆍ출발 60일~31일 전: 편도당 50,000원
									<br>ㆍ출발 30일~ 7일 전: 편도당 70,000원
									<br>ㆍ출발 6일~ 출발당일 1시간 전: 편도당 90,000원

									<br><br>※ 왕복여정 구매 시
									<br>- 출발구간만 부분 환불 불가하며, 전체 환불 후 편도 재구매 필요합니다.
									<br>- 출발 이후에는 리턴편만 환불 가능합니다.
									<br><br>
								</div>


							</div>
							<!-- 예약규정 창 끝 -->
							<!-- 운임규정 창 -->
							<div class="rule_cont" id="2">
								<p class="my-3 fs-5 color_primary02">▶소아요금</p>
								<div class="lh-sm">
									성인판매가의 75%<br>
									※ 소아운임 적용기준 : 만2세이상 만12세미만(성인 동반)<br>
									[ 항공사 및 운항 항공편에 따라 소아 나이의 적용 기준이 달라질 수 있습니다. 출발 당시 소아 운임 적용 가능하더라도 여행 도중 만 12세 이상이 되는 경우,소아 운임 적용이 불가할 수 있으며 소아 항공권을 소지하더라도 운항 항공편에 따라 탑승이 거절되거나 추가 비용 발생 등 항공권 사용에 문제가 될 수 있으니 구매 전 반드시 확인하시기 바랍니다. ]
								</div>
								<p class="my-2 fs-5 color_primary02">▶유아요금</p>
								<div class="lh-sm">
									[일본] 편도 20,000원 / 왕복 40,000원<br>
									[대만] 편도 20,000원 / 왕복 40,000원<br>
									[베트남] 편도 30,000원 / 왕복 60,000원<br>
									[태국] 편도 45,000원 / 왕복 90,000원<br>
									※ 유아운임 적용기준 : 만 2세 미만(성인동반)<br>
									(왕복여정 중 출발구간과 리턴구간 유아/소아 적용기준이 달라지는 경우 출발구간 나이를 기준하여 운임적용)<br>
									※ 동반성인 왕복여정내 유아승객 편도 예약시 여행사 담당자에게 별도로 연락 부탁드립니다.<br>
								</div>


							</div>
							<!-- 운임규정 창 끝 -->
							<!-- 결제규정 창 -->
							<div class="rule_cont" id="3">
								<p class="my-3 fs-5 color_primary02">▶발권 수수료</p>
								<div class="lh-sm">
									발권 후 예약 변경 시, 구간당 매회 수수료 징수
									<br>(예약 변경 후 원래 여정으로 재변경 시에도 수수료 징수)

									<br><br>[변경수수료]
									<br><br>ㆍ출발 91일 전: 편도당 10,000원
									<br>ㆍ출발 90일~61일 전: 편도당 20,000원
									<br>ㆍ출발 60일~31일 전: 편도당 30,000원
									<br>ㆍ출발 30일~ 7일 전: 편도당 40,000원
									<br>ㆍ출발 6일~ 1시간 전: 편도당 60,000원
									<br>ㆍ출발 1시간 이내: 변경 불가
									<br>ㆍ예약변경은 동일 또는 상위 클래스로만 변경이 가능하며, 운임 및 TAX 차액이 발생될 수 있습니다.(운임 및 TAX가 낮아진 경우, 기존 운임 및 TAX 적용)
									<br>ㆍ예약변경 시 항공사 사정에 따라 사전 예고없이 운항일정 변경 및 취소가 발생할 수 있으므로 반드시 여행사에 확인 바랍니다.
									<br>(변경가능 스케줄이 없을경우 항공권 취소해야 하며 취소수수료 부과)
									<br>ㆍ전체미사용 항공권의 출발편 변경 유효기간은 항공사 규정 및 운임에 따라 상이하므로 여행사에 문의 바랍니다.
									<br><br>[이름변경(SPELL CHANGE)]
									<br><br>ㆍ영문명 변경 시 매회 10,000원 수수료 부과
									<br>ㆍ영문 SPELL 3자리까지만 변경 허용
									<br>ㆍ소아(INF)의 영문 SPELL 변경 불가하며, 예약 취소 후 재예약 필요합니다.
									<br>ㆍTitle 변경
									<br>(소아→성인) 운임차액이 추가 징수됩니다.
									<br>(성인→소아) 운임차액은 환불되지 않습니다.
									<br>ㆍ그 외 이름변경과 관련된 사항은 여행사에 문의하시기 바랍니다.<br><br>
								</div>
								<p class="my-2 fs-5 color_primary02">▶항공사 수수료- 환불</p>
								<div class="lh-sm">
									김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
									총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
								</div>


							</div>
							<!-- 결제규정 창 끝 -->
							<!-- 환불/결제 창 -->
							<div class="rule_cont" id="4">
								<p class="my-3 fs-5 color_primary02">▶항공사 수수료- 예약변경</p>
								<div class="lh-sm">
									발권 후 예약 변경 시, 구간당 매회 수수료 징수
									<br>(예약 변경 후 원래 여정으로 재변경 시에도 수수료 징수)

									<br><br>[변경수수료]
									<br><br>ㆍ출발 91일 전: 편도당 10,000원
									<br>ㆍ출발 90일~61일 전: 편도당 20,000원
									<br>ㆍ출발 60일~31일 전: 편도당 30,000원
									<br>ㆍ출발 30일~ 7일 전: 편도당 40,000원
									<br>ㆍ출발 6일~ 1시간 전: 편도당 60,000원
									<br>ㆍ출발 1시간 이내: 변경 불가
									<br>ㆍ예약변경은 동일 또는 상위 클래스로만 변경이 가능하며, 운임 및 TAX 차액이 발생될 수 있습니다.(운임 및 TAX가 낮아진 경우, 기존 운임 및 TAX 적용)
									<br>ㆍ예약변경 시 항공사 사정에 따라 사전 예고없이 운항일정 변경 및 취소가 발생할 수 있으므로 반드시 여행사에 확인 바랍니다.
									<br>(변경가능 스케줄이 없을경우 항공권 취소해야 하며 취소수수료 부과)
									<br>ㆍ전체미사용 항공권의 출발편 변경 유효기간은 항공사 규정 및 운임에 따라 상이하므로 여행사에 문의 바랍니다.
									<br><br>[이름변경(SPELL CHANGE)]
									<br><br>ㆍ영문명 변경 시 매회 10,000원 수수료 부과
									<br>ㆍ영문 SPELL 3자리까지만 변경 허용
									<br>ㆍ소아(INF)의 영문 SPELL 변경 불가하며, 예약 취소 후 재예약 필요합니다.
									<br>ㆍTitle 변경
									<br>(소아→성인) 운임차액이 추가 징수됩니다.
									<br>(성인→소아) 운임차액은 환불되지 않습니다.
									<br>ㆍ그 외 이름변경과 관련된 사항은 여행사에 문의하시기 바랍니다.<br><br>
								</div>
								<p class="my-2 fs-5 color_primary02">▶항공사 수수료- 환불</p>
								[환불수수료] * 수수료 공제 후 환불
								<br><br>ㆍ출발 91일 전: 환불수수료 없음
								<br>ㆍ출발 90일~61일 전: 편도당 30,000원
								<br>ㆍ출발 60일~31일 전: 편도당 50,000원
								<br>ㆍ출발 30일~ 7일 전: 편도당 70,000원
								<br>ㆍ출발 6일~ 출발당일 1시간 전: 편도당 90,000원

								<br><br>※ 왕복여정 구매 시
								<br>- 출발구간만 부분 환불 불가하며, 전체 환불 후 편도 재구매 필요합니다.
								<br>- 출발 이후에는 리턴편만 환불 가능합니다.
								<br><br>
							</div>
						</div>
						<!-- 환불/결제 창 끝 -->
					</div>
					<!-- 규정 내용 박스 끝-->
				</div>
			</div>
			<!-- 모달창 내용 끝 -->



		</div>
		<!-- section end -->
		</div>
	</section>
</main>

</div>
</div>


<script src="/js/reservation_cancel_info.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp"%>