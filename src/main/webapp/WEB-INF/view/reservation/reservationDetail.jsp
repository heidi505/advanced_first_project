<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>
<style>
.airline_image{
	background:url('/images/airline_images/${detailTrip.airline}.png');
	background-size: cover;
}
</style>

<!-- TODO 여기서부터 main영역 -->
<main class="reservation_detail_page">
    <div class="container">
        <div class="section">
            <hr class="my-5">
            <div><b class="mt-5">${detailTrip.realName}님의 예약번호는 ${detailTrip.reservationNum} 입니다</b>
                <c:if test="${ detailTrip.statusEnum eq '예정'}">
                <b class="float-end color_primary02">결제마감시한 ${detailTrip.cuttedPaymentDeadline}</b>
                </c:if>
                <hr class="border-2 border-primary">
            </div>
            <p class="text-end me-5">예약상태<span class="color_basic09 mx-2">|</span>
            <c:choose>
            <c:when test="${detailTrip.statusEnum eq '취소'}">
            <span class="color_cancle">예약취소</span>
            </c:when>
            <c:otherwise>
            	<c:choose>
            	<c:when test="${detailTrip.isPayed ne true}">
            	결제 전
            	</c:when>
            	<c:otherwise>
            	결제완료
           	 	</c:otherwise>
            	</c:choose>
            </c:otherwise>
            </c:choose>
            </p>
            <div class="detail_cont_box row mx-auto align-middle mt-3">
                <div class="col-3 air_info border-end text-center pt-4">
                    <div class="float-start ms-5"><b class="lh-lg">${detailTrip.koreanDepartureCity}<br><span class="color_basic09">${detailTrip.departureCity}</span></b>
                    </div>
                    <div class="trip_image p-4 my-2 mx-auto"></div>
                    <div class="float-end me-5"><b class="lh-lg">${detailTrip.koreanArrivalCity}<br><span class="color_basic09">${detailTrip.arrivalCity}</span></b></div>
                </div>
                <div class="col py-3 border-end text-center align-middle">
                    <div class="airline_image p-4 w-10 mx-auto"></div>
                    <p><b>${detailTrip.koreanAirline}</b></p></div>
                <div class="col py-3 border-end text-center align-middle">
                    <p class="mt-3 mb-4 color_basic09">운향종류</p>
                    <p>
                    <c:choose>
                    <c:when test="${detailTrip.isOneWay eq true}">
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
                    <p>${detailTrip.seatType}</p>
                </div>
                <div class="col py-3  w-25 text-center">
                    <p class="mt-3 mb-4">출발일 ${detailTrip.departureDate}</p>
                    <p>도착일 ${detailTrip.arrivalDate}</p>
                </div>
                <div class="col py-3  w-25">
                    <p class="mt-3 mb-4">예약자명 : ${detailTrip.realName}</p>
                    <p>연락처 : ${detailTrip.phoneNumber}</p>
                    <p class="mt-4">아이디 : ${detailTrip.resName}</p>
                </div>
            </div>
            <div class="reservation_notice w-100 border p-3 mt-5 lh-lg">
                <p>항공권은 이메일을 통해 전자항공권(E-TICKET)으로 발송됩니다.</p>
                <p>탑승시간 최소 2시간 전에 체크인 당부드립니다.</p>
                <p>여권 만료일이 출발일로부터 6개월 미만인 경우 탑승이 불가합니다.</p>

            </div>
            
            
            <div class="mt-5 mb-4 fs-4"><b>탑승객 정보 및 결제 정보</b></div>
			<table class="passenger_info_table w-100 mb-5">
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
            <input type="hidden" class="cancel_request" value="${cancelRequest}">
            <input type="hidden" class="reservation_num" value="${detailTrip.reservationNum}">
            <div id="modal_box" class="modal">
                <div class="modal_cont">
                    <!-- 여기부터 모달창 내용 -->

                    <div class="pt-2">
                        <b class="fs-5">예약 취소 요청</b><span class="close" id="close_btn">&times;</span>
                        <div class="border-top p-1 mt-4 d-flex">
                            <div class="p-2"><input type="checkbox" class="all_checkbox p-5 float-start"></div>
                            <div class="w-10 text-center p-2">번호</div>
                            <div class="p-2 ms-2 w-75">이름</div>
                        </div>
                        <div class="border-top border-bottom p-1 d-flex mb-4">
                            <div class="p-2 "><input type="checkbox" class="cancel_checkbox checkbox p-5 float-start"></div>
                            <div class="w-10 text-center py-2 ">${reservationNum}</div>
                            <div class="p-2 ms-2 w-75">${detailTrip.firstName}/${detailTrip.lastName} (MS)</div>
                        </div>

                        <div class="p-3 bg_line">
                            <p class="my-2 fs-5">재예약을 위한 취소인가요?</p>
                            <div class="lh-sm">
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등
                                총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등
                                총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.

                            </div>
                            <p class="my-2 fs-5">탑승객에 소아/유아가 있는 경우</p>
                            <div class="lh-sm">
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등
                                총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등
                                총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                            </div>
                        </div>
                        <div class="py-4 mb-4">
                            <b class="float-start lh-lg">취소 요청 후 철회할 수 없습니다</b>
                            <button class="btn w-35 btn-primary float-end" id="cancel_request_btn">탑승객 취소요청</button>
                        </div>
                    </div>
                </div>
              <!-- 모달창 내용 끝 -->
            </div>
        </div>
        <!-- section end -->
    </div>
</main>

</div>
</div>

<script src="/js/reservation_detail.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>