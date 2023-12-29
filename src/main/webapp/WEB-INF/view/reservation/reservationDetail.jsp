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
                    <div class="float-start ms-5"><b class="lh-lg">${detailTrip.koreanDepartureAirport}<br><span class="color_basic09">${detailTrip.departureCity}</span></b>
                    </div>
                    <div class="trip_image p-4 my-2 mx-auto"></div>
                    <div class="float-end me-5"><b class="lh-lg">${detailTrip.koreanArrivalAirport}<br><span class="color_basic09">${detailTrip.arrivalCity}</span></b></div>
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
                    <p class="mt-3 mb-4">예약자명 : 김하얀</p>
                    <p>연락처 : ${detailTrip.phoneNumber}</p>
                    <p class="mt-4">아이디 :${sessionScope.principal.username}</p>
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
            <c:if test="${detailTrip.isPayed eq false&& detailTrip.statusEnum ne '취소'}">
                <div class="w-100 text-center p-4">
                    <form action="/kakaoPay" method="post">
                        <button type="submit" class="payed_check_btn btn btn-primary w-25">결제하기</button>
                    </form>
                </div>
            </c:if>



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
                            <div class="w-25 text-center p-2">번호</div>
                            <div class="p-2 ms-2 w-50">이름</div>
                        </div>
                        <div class="border-top border-bottom p-1 d-flex mb-4">
                            <div class="p-2 "><input type="checkbox" class="cancel_checkbox checkbox p-5 float-start"></div>
                            <div class="w-25 text-center py-2 ">${reservationNum}</div>
                            <div class="p-2 ms-2 w-50">${detailTrip.firstName}/${detailTrip.lastName} (MS)</div>
                        </div>

                        <div class="p-3 bg_line">
                            <p class="my-2 fs-5">취소 시 패널티</p>
                            <div class="lh-sm">
                                - 대한민국 출발 의 경우, 해당구간 변경(재발권) 시 구간 별 KRW 100,000 수수료 징수
                                <br>- 동일 요금, 동일 시즌 및 항공권 유효기간 내에서 구간별 재발행 수수료 ~91일 이전 : 없음 / 90~31일 이전 : 4만 원/ 30일~7일 이전 : 6만 원 / 6일 이내 ~ 당일 : 10만 원 + 여행 업무 취급 수수료 지불 후 가능
                                <br>- 하위 운임으로 변경 불가/제세 공과금(TAX), 유류할증료 및 운임 차액 발생 시 추가 지불
                                <br>- 재발행은 1회 한정이며 추가 변경 시 환불 후 재구매 해야 함
                                <br>- 구간 변경 시 환불 후 재 구매 해야함(단, 동일 국가 내에서는 구간 변경 가능)
                                <br>- 각 구간의 탑승 일자를 기준으로 시점별 수수료 부과

                                <br><br>- 해당구간 취소(환불, 취소) 시 구간 별 KRW 100,000 수수료 징수
                                <br>- 해당 구간 취소(취소, 환불) 시 구간 별 수수료 징수
                                <br>- 항공사 수수료 ~91일 이전 : 없음 / 90~31일 이전 : 4만 원/ 30일~7일 이전 : 6만 원 / 6일 이내 ~ 당일 : 10만 원, 여행업무 취급 수수료 별도 부과
                                <br>- 각 구간의 탑승 일자를 기준으로 시점별 수수료 부과

                                <br><br>- 해당구간 취소(NO-SHOW) 시 구간 별 KRW 120,000 수수료 징수
                                <br>- 예약 부도(NO-SHOW, 탑승수속 마감 전까지 예약취소를 하지 않은 경우)일 경우 항공사 예약 부도 위약금 부과/재발행 항공권은 최초 발권일 기준으로 적용](환불 시 이중부과됨)
                                <br>- 여정 취소, 환불 등의 각종 작업은 탑승수속 마감 전 여행사 및 항공사 업무 처리 가능 시간 내까지 환불 완료되어야 함 (이후 작업 완료 시 NO-SHOW 처리됨)

                                <br><br>- 일본 출발 의 경우, 해당구간 변경(재발권) 시 구간 별 JPY 5,000 수수료 징수
                                <br>- 동일 요금, 동일 시즌 및 항공권 유효기간 내에서 재발행 수수료 + 여행 업무 취급 수수료 지불 후 가능
                                <br>- 하위 운임으로 변경 불가/제세 공과금(TAX), 유류할증료 및 운임 차액 발생 시 추가 지불
                                <br>- 재발행은 1회 한정이며 추가 변경 시 환불 후 재구매 해야 함
                                <br>- 구간 변경 불가(환불 후 재구매 해야 함)

                                <br><br>- 해당구간 취소(환불, 취소) 시 구간 별 JPY 6,000 수수료 징수
                                <br>- 해당구간 취소(NO-SHOW) 시 구간 별 JPY 10,000 수수료 징수
                                <br>- 예약 부도(NO-SHOW, 탑승수속 마감 전까지 예약취소를 하지 않은 경우)일 경우 항공사 예약 부도 위약금 부과/재발행 항공권은 최초 발권일 기준으로 적용](환불 시 이중부과됨)
                                <br>- 여정 취소, 환불 등의 각종 작업은 탑승수속 마감 전 여행사 및 항공사 업무 처리 가능 시간 내까지 환불 완료되어야 함 (이후 작업 완료 시 NO-SHOW 처리됨)<br>
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

<script src="/js/reservation_detail_info.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>