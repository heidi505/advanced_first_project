<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>


<!-- TODO 여기서부터 main영역 -->
<main class="airport_info_page">
    <div class="container">
        <div class="section">
            <div class=" w-85 pt-5 mx-auto">
                <div class="p-5 text-center">
                    <img class="payed_result_mark p-3 rounded-circle" src="/images/check_mark.png">
                    <p class="fs-1 my-2"><b>항공권 예약이 정상적으로 완료되었습니다.</b></p>
                    <p class="mt-3">예약상세/결제하기에서 확인할 수 있습니다.</p>
                </div>
                <hr class="w-75 mx-auto">
                <h3 class="text-center">예약번호 <b>${Result.reservation.reservationNum}</b></h3>
            </div>
            <!-- 상단 페이지 끝-->
            <div style="display: none">
                <h2>예약 결과화면을 보여주기 위해 필요한 것들 예.</h2>
                <!-- Reservation 정보 출력 -->
                <h2>예약 정보</h2>
                <p>예약ID: ${Result.reservation.id}</p>
                <p>유저 ID: ${Result.reservation.userId}</p>
                <p>이름: ${Result.reservation.resName}</p>
                <p>Email: ${Result.reservation.email}</p>
                <p>전화번호: ${Result.reservation.phoneNum}</p>

                <!-- Passenger 정보 출력 -->
                <h2>승객 정보</h2>
                <p>ID: ${Result.passenger.id}</p>
                <p>예약 ID: ${Result.passenger.reservationId}</p>

                <!-- Tickets 정보 출력 -->
                <h2>티켓 정보</h2>
                <!-- 각각의 티켓 정보를 반복문으로 출력 -->
                <c:forEach var="ticket" items="${Result.ticket}">
                    <c:set var="currentTicket" value="${ticket}"/>
                    <h3>티켓 ID : ${ticket.id}</h3>
                    <p>Air Fare: ${ticket.airFare}</p>
                    <p>세: ${ticket.taxes}</p>
                    <p>총액: ${ticket.totalPrice}</p>
                </c:forEach>
            </div>

            <div class="mt-5 fs-4"><b>탑승객 정보 및 결제 정보</b>
                <button class="fare_regulations_btn btn float-end mb-2">운임규정보기</button>
            </div>
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
                    <td class="w-10">${Result.passenger.lastName}/${Result.passenger.firstName}</td>
                    <td class="w-10">${Result.passenger.passengerType}</td>
                    <td>${Result.passenger.gender}</td>
                    <td>${Result.passenger.birthDate}</td>
                    <td>${currentTicket.airFare}</td>
                    <td>${currentTicket.fuelSurcharge}</td>
                    <td>${currentTicket.taxes}</td>
                    <td>${currentTicket.ticketingFee}</td>
                    <td>${currentTicket.totalPrice}</td>
                    <td>${Result.reservation.statusEnum}</td>
                </tr>
                </tbody>
            </table>
            <div class="w-100 text-center p-5">
                <form action="/kakaoPay" method="post">
                    <input type="hidden" name="" value="${Result.reservation.id}">
                    <button type="submit" class="payed_check_btn btn btn-primary w-25">결제하기</button>
                </form>
            </div>


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
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등 총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                            </div>
                            <p class="my-2 fs-5 color_primary02">▶발권 수수료</p>
                            <div class="lh-sm">
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등 총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                            </div>


                        </div>
                        <!-- 예약규정 창 끝 -->
                        <!-- 운임규정 창 -->
                        <div class="rule_cont" id="2">
                            <p class="my-3 fs-5 color_primary02">▶발권 수수료2222</p>
                            <div class="lh-sm">
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등 총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                            </div>
                            <p class="my-2 fs-5 color_primary02">▶발권 수수료</p>
                            <div class="lh-sm">
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등 총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                            </div>


                        </div>
                        <!-- 운임규정 창 끝 -->
                        <!-- 결제규정 창 -->
                        <div class="rule_cont" id="3">
                            <p class="my-3 fs-5 color_primary02">▶발권 수수료3333</p>
                            <div class="lh-sm">
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등 총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                            </div>
                            <p class="my-2 fs-5 color_primary02">▶발권 수수료</p>
                            <div class="lh-sm">
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등 총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                            </div>


                        </div>
                        <!-- 결제규정 창 끝 -->
                        <!-- 환불/결제 창 -->
                        <div class="rule_cont" id="4">
                            <p class="my-3 fs-5 color_primary02">▶발권 수수료4444</p>
                            <div class="lh-sm">
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등 총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                            </div>
                            <p class="my-2 fs-5 color_primary02">▶발권 수수료</p>
                            <div class="lh-sm">
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등 총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등 총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                                <p class="my-2 fs-5 color_primary02">▶발권 수수료</p>
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등 총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                                김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장
                                등 총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
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


<script src="/js/final_result.js"></script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>