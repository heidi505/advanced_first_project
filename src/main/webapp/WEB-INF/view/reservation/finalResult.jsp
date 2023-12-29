<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>


<!-- TODO 여기서부터 main영역 -->
<main class="airport_info_page">
    <div class="container">
        <div class="section">
            <div class=" w-85 pt-2 mx-auto">
                <div class="p-5 text-center">
                    <img class="payed_result_mark p-3 rounded-circle" src="/images/check_mark.png">
                    <p class="fs-1 my-2"><b>항공권 예약이 정상적으로 완료되었습니다.</b></p>
                    <p class="mt-3">예약상세/결제하기에서 확인할 수 있습니다.</p>
                </div>
                <%--                <h3 class="text-center">예약번호 <b>${Result.reservation.reservationNum}</b></h3>--%>
            </div>
            <!-- 상단 페이지 끝-->
            <%--            <div>--%>
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
                <%--                <c:forEach var="passenger" items="${Result.passenger}">--%>
                <%--                    <c:set var="currentPassenger" value="${passenger}"/>--%>
                <%--                    <p>ID: ${passenger.id}</p>--%>
                <%--                    <p>예약 ID: ${passenger.reservationId}</p>--%>
                <%--                </c:forEach>--%>
                <%--                <p>ID: ${Result.passenger.id}</p>--%>
                <%--                <p>예약 ID: ${Result.passenger.reservationId}</p>--%>

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
                <c:forEach var="ticket" items="${Result.ticket}">
                    <tr>
                        <td>성민경</td>
                        <td>ANA 272</td>
                        <td>1991-02-22</td>
                        <td>${ticket.airFare}</td>
                        <td>${ticket.fuelSurcharge}</td>
                        <td>${ticket.taxes}</td>
                        <td>${ticket.ticketingFee}</td>
                        <td>${ticket.totalPrice}</td>
                        <td>${ticket.totalPrice}</td>
                        <td>결제 전</td>
                    </tr>
                    <c:set var="totalPriceSum" value="${totalPriceSum + ticket.totalPrice}" />
                </c:forEach>
                </tbody>
            </table>
            <div class="mt-5 fs-4"><b>나의 쿠폰 목록</b>
            </div>
            <table class="passenger_info_table w-100" style="margin-top: 30px">
                <thead>
                <c:forEach var="coupon" items="${Coupon}">
                    <tr>
                        <td style="font-weight: bold;">쿠폰 이름</td>
                        <td style="border-right: 1px solid var(--line);">${coupon.couponName}</td>
                        <td style="font-weight: bold">쿠폰 만료일</td>
                        <td style="border-right: 1px solid var(--line)">${coupon.expiredAt}일까지</td>
                        <td style="font-weight: bold">쿠폰 금액</td>
                        <td style="border-right: 1px solid var(--line)">${coupon.discountingPrice}</td>
                        <td style="display: flex; align-items: center; justify-content: center;">
                            <button type="button" class="btn btn-primary apply-coupon-btn"
                                    data-coupon="${coupon.discountingPrice}">
                                적용하기
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </thead>
            </table>
            <table class="passenger_info_table w-100" style="margin-top: 30px">
                <thead>
<%--<<<<<<< HEAD--%>
<%--                <tr>--%>
<%--                    <td style="font-weight: bold;">쿠폰 이름</td>--%>
<%--                    <td style="border-right: 1px solid var(--line);">가입 쿠폰</td>--%>
<%--                    <td style="font-weight: bold">쿠폰 만료일</td>--%>
<%--                    <td style="border-right: 1px solid var(--line)">2023-12-20일까지</td>--%>
<%--                    <td style="font-weight: bold">쿠폰 금액</td>--%>
<%--                    <td style="border-right: 1px solid var(--line)">12000</td>--%>
<%--                    <td style="display: flex; align-items: center; justify-content: center;">--%>
<%--                        <button type="button" class="btn btn-primary apply-coupon-btn"--%>
<%--                                data-coupon="12000">--%>
<%--                            적용하기--%>
<%--                        </button>--%>
<%--                    </td>--%>
<%--                </tr>--%>


<%--                <tr>--%>
<%--                    <td style="font-weight: bold;">쿠폰 이름</td>--%>
<%--                    <td style="border-right: 1px solid var(--line);">가입 쿠폰</td>--%>
<%--                    <td style="font-weight: bold">쿠폰 만료일</td>--%>
<%--                    <td style="border-right: 1px solid var(--line)">2023-12-20일까지</td>--%>
<%--                    <td style="font-weight: bold">쿠폰 금액</td>--%>
<%--                    <td style="border-right: 1px solid var(--line)">13000</td>--%>
<%--                    <td style="display: flex; align-items: center; justify-content: center;">--%>
<%--                        <button type="button" class="btn btn-primary apply-coupon-btn"--%>
<%--                                data-coupon="13000">--%>
<%--                            적용하기--%>
<%--                        </button>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--=======--%>
<%--                    <tr>--%>
<%--                        <td style="font-weight: bold;">쿠폰 이름</td>--%>
<%--                        <td style="border-right: 1px solid var(--line);">가입 쿠폰</td>--%>
<%--                        <td style="font-weight: bold">쿠폰 만료일</td>--%>
<%--                        <td style="border-right: 1px solid var(--line)">2023-12-20일까지</td>--%>
<%--                        <td style="font-weight: bold">쿠폰 금액</td>--%>
<%--                        <td style="border-right: 1px solid var(--line)">12000</td>--%>
<%--                        <td style="display: flex; align-items: center; justify-content: center;">--%>
<%--                            <button type="button" class="btn btn-primary apply-coupon-btn"--%>
<%--                                    data-coupon="12000">--%>
<%--                                적용하기--%>
<%--                            </button>--%>
<%--                        </td>--%>
<%--                    </tr>--%>


<%--                    <tr>--%>
<%--                        <td style="font-weight: bold;">쿠폰 이름</td>--%>
<%--                        <td style="border-right: 1px solid var(--line);">가입 쿠폰</td>--%>
<%--                        <td style="font-weight: bold">쿠폰 만료일</td>--%>
<%--                        <td style="border-right: 1px solid var(--line)">2023-12-20일까지</td>--%>
<%--                        <td style="font-weight: bold">쿠폰 금액</td>--%>
<%--                        <td style="border-right: 1px solid var(--line)">13000</td>--%>
<%--                        <td style="display: flex; align-items: center; justify-content: center;">--%>
<%--                            <button type="button" class="btn btn-primary apply-coupon-btn"--%>
<%--                                    data-coupon="13000">--%>
<%--                                적용하기--%>
<%--                            </button>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                </thead>
            </table>

            <div class="mx-auto p-3" style="width: 20%;">
                <table class="passenger_info_table w-100" style="margin-top: 30px; border: 1px solid var(--form);">
                    <thead>
                    <tr>
                        <td style="height: 1em; vertical-align: bottom; font-weight: 700;">결제 금액</td>

                        <%--                        <td id="paymentAmount" style="height: 3em; vertical-align: bottom; font-weight: 700;">${currentTicket.totalPrice}</td>--%>

<%--                        <td id="paymentAmount" style="height: 3em; vertical-align: bottom; font-weight: 700;">${currentTicket.totalPrice}</td>--%>

                        <td id="paymentAmount" style="height: 3em; vertical-align: bottom; font-weight: 700;">${totalPriceSum}</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td style="border-top: hidden; height: 1em; vertical-align: top; font-weight: 700;">할인 금액</td>
                        <td id="discountAmount" style="border-top: hidden; height: 3em; vertical-align: top; font-weight: 700;"></td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr style="background-color: var(--form)">
                        <td style="height: 3em; vertical-align: middle; font-weight: 900;">최종 결제 금액</td>
                        <td id="finalAmount" style="height: 3em; vertical-align: middle; font-weight: 900;"></td>
                    </tr>
                    </tfoot>
                </table>
            </div>
            <div class="w-100 text-center p-4">
                <form action="/kakaoPay" method="post">
                    <input type="hidden" name="reservationNum" value="${Result.reservation.reservationNum}">
                    <input type="hidden" name="reservationId" value="${Result.reservation.id}">
                    <input type="hidden" name="resName" value="${Result.reservation.resName}">
                    <input type="hidden" name="couponPrice" id="couponPrice">
                    <input type="hidden" name="finalPrice" id="finalPrice">
                    <input type="hidden" name="originalPrice" value="${currentTicket.totalPrice}">
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
<script>
    var totalPrice = parseFloat("${totalPriceSum}");
    if (!isNaN(totalPrice)) {
        document.getElementById("paymentAmount").innerText = totalPrice.toLocaleString();
    }
    document.addEventListener("click", function (event) {
        if (event.target.classList.contains("apply-coupon-btn")) {
            applyCoupon(event.target.dataset.coupon);
        }
    });

    function applyCoupon(couponDiscount) {
        // 할인 금액을 화면에 표시하는 부분
        document.getElementById("discountAmount").innerText = parseFloat(couponDiscount).toLocaleString();

        // 현재 결제 금액 가져오기
        var paymentAmount = parseFloat(document.getElementById("paymentAmount").innerText.replace(",", ""));

        // 총 결제 금액 계산 (현재 결제 금액 - 할인 금액)
        var finalAmount = paymentAmount - parseFloat(couponDiscount);

        // 총 결제 금액을 화면에 표시하는 부분
        document.getElementById("finalAmount").innerText = finalAmount.toLocaleString(); // 콤마 추가

        document.getElementById("couponPrice").value = couponDiscount;
        document.getElementById("finalPrice").value = finalAmount;

    }
</script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>