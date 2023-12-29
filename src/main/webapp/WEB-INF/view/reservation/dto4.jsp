<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>

<!-- TODO 여기서부터 main영역 -->
<main id="reservation_detail_page">
            <form id="reservationp" action="/reservation/save" method="post">
                <div>
                    <div>
                        <section>
                                <table>
                                    <thead>
                                    <tr>
                                        <th class="detail_info_th">
                                            <span >${ticket.itineraries[0].segments[0].departure.cityName}</span>
                                            <span >${ticket.itineraries[0].segments[0].departure.iataCode}</span>
                                            <input type="hidden" name="departureCity" id="departureCity"
                                                   value="${ticket.itineraries[0].segments[0].departure.cityName}">
                                            <input type="hidden" name="departureAirport" id="departureAirport"
                                                   value="${ticket.itineraries[0].segments[0].departure.iataCode}">
                                        </th>
                                        <th>
                                                <span>${ticket.itineraries[0].segments[0].departure.date()}</span>
                                        </th>
                                        <th class="">
                                            <span class="">${ticket.itineraries[0].segments[0].arrival.cityName}</span>
                                            <span>${ticket.itineraries[0].segments[0].arrival.iataCode}</span>
                                            <input type="hidden" name="arrivalCity" id="arrivalCity" value="${ticket.itineraries[0].segments[0].arrival.cityName}">
                                            <input type="hidden" name="arrivalAirport" id="arrivalAirport" value="${ticket.itineraries[0].segments[0].arrival.iataCode}">
                                        </th>
                                        <th class="">
                                        <img src="/images/airline_images/${ticket.itineraries[0].segments[0].carrierCode}.png" class="detail_info_img">
                                            <span class="">${ticket.itineraries[0].segments[0].airlineName}</span>
                                            <input type="hidden" name="airline" id="airline" value="${ticket.itineraries[0].segments[0].airlineName}">
                                        </th>
                                        <th class="">
                                            <span class="">
                                                <c:if test="${ticket.oneWay eq false}">
                                                    직항
                                                </c:if>
                                                <c:if test="${ticket.oneWay eq true}">
                                                    경유
                                                </c:if>
                                            </span>
                                        </th>
                                        <th class="">
                                            <span class="">좌석등급</span>
                                            <%--                                            <span class="detail_info_span2">${ticket.travelerPricings[0].fareDetailsBySegment[0].cabin}</span>--%>
                                        </th>
                                        <div style="display: none">
                                            <%-- 직항, 경유체크부분 화면에 없네용! --%>
                                            <span>직항</span>
                                            <input type="hidden" name="flightType" id="flightType" value="직항">
                                        </div>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="round" items="${ticket.roundTrip()}" varStatus="status">
                                        <c:forEach var="segment" items="${round.value.segments()}">
                                            <tr>
                                                <td>${round.key}</td>
                                                <td>${segment.airlineName} ${segment.number} <a class="btn">상세</a></td>
                                                <td>${segment.departure.cityName} - ${segment.arrival.cityName}</td>
                                                <td>${segment.departure.date()} ${segment.departure.time()}</td>
                                                <td>${segment.arrival.date()} ${segment.arrival.time()}</td>
                                                <td><%--                                            ECONOMY, PREMIUM_ECONOMY, BUSINESS, FIRST--%>
                                                    <c:if test="${ticket.travelerPricings[0].fareDetailsBySegment[0].cabin eq 'ECONOMY'}">
                                                        일반
                                                    </c:if>
                                                    <c:if test="${ticket.travelerPricings[0].fareDetailsBySegment[0].cabin eq 'BUSINESS'}">
                                                        비즈니스
                                                    </c:if>
                                                    <input type="hidden" name="seatType" id="seatType" value="${ticket.travelerPricings[0].fareDetailsBySegment[0].cabin}">
                                                </td>
                                                <td>
                                                    <c:if test="${ticket.travelerPricings[0].fareDetailsBySegment[0].includedCheckedBags.weight eq null}">
                                                        0
                                                    </c:if>
                                                    <c:if test="${ticket.travelerPricings[0].fareDetailsBySegment[0].includedCheckedBags.weightUnit eq null}">
                                                        kg
                                                    </c:if>
                                                    <input type="hidden" name="baggageAllowance" id="baggageAllowance" value="${ticket.travelerPricings[0].fareDetailsBySegment[0].includedCheckedBags.weight}">
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:forEach>
                                    </tbody>
                                </table>
                        </section>
                        <section>
                                    <p>
                                        <label for="resName" class="detail_group_maginb">예약자 이름</label>
                                    </p>
                                    <input type="text" class="detail_input" id="resName" placeholder=""
                                           name="resName" value="성민경" required>

                                <div class="">
                                    <p>
                                        <label for="email" class="detail_group_maginb"> 이메일 주소 </label>
                                    </p>
                                    <input type="text" class="detail_input" id="emailn"
                                           placeholder="" name="emailn" value="wildlegion" required>
                                    <span class="detail_email">@</span>
                                    <input type="text" class="detail_input" id="emailsite"
                                           placeholder="" name="emailsite" value="naver.com" required>
                                    <input type="hidden" name="email" id="email" value="">
                                </div>

                                <div class="">
                                    <p><label for="phoneInput1" class="detail_group_maginb">휴대전화 번호</label></p>
                                    <input type="tel" class="detail_input" id="phoneInput1"
                                           placeholder="" name="phonef" value="010" required>
                                    <label for="phoneInput2" class="detail_hidden_label">중간자리</label>
                                    <input type="tel" class="detail_input" id="phoneInput2"
                                           placeholder="" name="phonem" value="3001" required>
                                    <label for="phoneInput3" class="detail_hidden_label">뒷자리</label>
                                    <input type="tel" class="detail_input" id="phoneInput3"
                                           placeholder="" name="phoneb" value="3108" required>
                                    <input type="hidden" name="phoneNum" id="combinedPhoneNum" value="">
                                </div>
                        </section>
                        <section>
                            <div class="">
                                <div class="">
                                    탑승객 1: 성인
                                </div>
                                <div class="">
                                    <div class="">
                                        <p><label for="lastName" class="detail_group_maginb">영문 성</label></p>
                                        <input type="text" class="detail_name_input" id="lastName"
                                               placeholder="예: ) HONG" name="lastName" value="SUNG" required>
                                    </div>
                                    <div class="">
                                        <p><label for="firstName" class="detail_group_maginb">영문 이름</label></p>
                                        <input type="text" class="detail_name_input" id="firstName"
                                               placeholder="예: ) GILDONG" name="firstName" value="MINKYEONG" required>
                                    </div>
                                </div>
                                <div class="">
                                    <p class="">성별</p>
                                    <div class="">
                                        <input type="radio" class="form-control" id="select" name="gender" value="male"><label
                                            for="select">남자</label>
                                        <input type="radio" class="form-control" id="select2" name="gender"
                                               value="female"><label for="select2">여자</label>
                                    </div>
                                </div>
                                <div class="">
                                    <p class="">생년월일</p>
                                    <input type="text" class="detail_input" id="year" placeholder="" name="year"
                                           value="1991"
                                           required>
                                    <input type="text" class="detail_input" id="month" placeholder="" name="month"
                                           value="05"
                                           required>
                                    <input type="text" class="detail_input" id="day" placeholder="" name="day"
                                           value="22" required>
                                    <input type="hidden" name="birthDate" id="birthDate" value="">
                                </div>
                            </div>

                        </section>
                    </div>
                    <div class="">
                        <div class="">
                                <div>
                                    <div class="">
                                    <span>${ticket.itineraries[0].segments[0].departure.cityName}
                                        <img src="../images/ico_from_to_02.png" class="preview_price_img">
                                        ${ticket.itineraries[0].segments[0].arrival.cityName}
                                    </span>
                                    </div>
                                    <div class="">${ticket.itineraries[0].segments[0].departure.date()}
                                        - ${ticket.itineraries[0].segments[0].arrival.date()} ·
                                        승객 ${ticket.travelerPricings.size()}명
                                    </div>
                                    <div>
                                        <!-- 요금표 -->
                                        <div>
                                            <h2 class="">
                                                <a>
                                                    <span>${ticket.adultAnd()}</span>
                                                    <input type="hidden" name="passengerType" id="passengerType" value="성인">
                                                    <input type="hidden" name="passengerAmount" id="passengerAmount" value="1">
                                                </a>
                                            </h2>
                                            <div class="">
                                                <table>
                                                    <colgroup>
                                                        <col style="width: 40%;">
                                                        <col style="width: 30%;">
                                                        <col style="width: 30%;">
                                                    </colgroup>
                                                    <tbody>
                                                    <tr>
                                                        <td>항공요금</td>
                                                        <td>${ticket.travelerPricings.size()}명</td>
                                                        <td>${ticket.price.base}원</td>
                                                        <input type="hidden" name="airFare" id="airFare"
                                                               value="${ticket.price.base}">
                                                    </tr>
                                                    <tr>
                                                        <td>유류할증료</td>
                                                        <td>${ticket.travelerPricings.size()}명</td>
                                                        <td>${ticket.price.oilPrice}원</td>
                                                        <input type="hidden" name="fuelSurcharge" id="fuelSurcharge"
                                                               value="${ticket.price.oilPrice}">
                                                    </tr>
                                                    <tr>
                                                        <td>제세공과금</td>
                                                        <td>${ticket.travelerPricings.size()}명</td>
                                                        <td>${ticket.price.oilPrice}원</td>
                                                        <input type="hidden" name="taxes" id="taxes"
                                                               value="${ticket.price.oilPrice}">
                                                    </tr>
                                                    <tr>
                                                        <td>발권수수료</td>
                                                        <td>${ticket.travelerPricings.size()}명</td>
                                                        <td>${ticket.price.fee}원</td>
                                                        <input type="hidden" name="ticketingFee" id="ticketingFee"
                                                               value="${ticket.price.fee}">
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="">
                                                <table>
                                                    <colgroup>
                                                        <col style="width: 40%;">
                                                        <col style="width: 30%;">
                                                        <col style="width: 30%;">
                                                    </colgroup>
                                                    <tfoot>
                                                    <tr>
                                                        <td>성인 총 요금</td>
                                                        <td></td>
                                                        <td>${ticket.price.grandTotal}원</td>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- 성인요금 -->
                                        <div class="">
                                            <div>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <h2 class="">총 요금</h2>
                                                    <td></td>
                                                    <td></td>
                                                    </td>
                                                    <td>
                                                    <td><span class="">세금 및 수수료 포함</span>
                                                    </td>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </div>
                                            <div>
                                                <b class="">${ticket.price.grandTotal}<span>원</span></b>
                                                <input type="hidden" name="totalPrice" id="totalPrice" value="${ticket.price.grandTotal}">
                                            </div>
                                        </div>
                                        <div class="">
                                            <button type="button" class="btn btn-primary preview_price_btnw"
                                                    data-bs-toggle="modal" data-bs-target="#myModal">
                                                항공권 예약하기
                                            </button>
                                        </div>

                                        <!-- The Modal -->
                                        <div class=" " id="myModal">
                                            <div class="">
                                                <div class="">
                                                    <!-- Modal Header -->
                                                    <div class="">
                                                        <h2 class="-">예약내역 최종 확인</h2>
                                                        <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal"></button>
                                                    </div>

                                                    <!-- Modal body -->
                                                    <div class="">
                                                        <div class="">
                                                            <p>
                                                            <h3>
                                                             <span>고객님의 휴대폰 번호는
                                                                 <b class="res_modal_b">
                                                                     <span id="userphone">010-3001-3108</span>
                                                                </b> / 이메일은
                                                                <b class="res_modal_b">
                                                                    <span id="useremail">wildlegion@naver.com</span>
                                                                </b>입니다.
                                                            </span>
                                                            </h3>
                                                            </p>
                                                        </div>
                                                        <p class="">
                                                            <label for="agreeRadioChk0">
                                                                <input type="checkbox" id="agreeRadioChk0"
                                                                       class="res_modal_check_btn" name="agreeRadioChk"
                                                                       value="N"
                                                                       onclick="enableConfirmButton()">
                                                                <span class=""></span>위 내용을 확인했습니다.
                                                            </label>
                                                        </p>

                                                        <div class="">
                                                            <button class="btn res_modal_btn2" type="button"
                                                                    onclick="resetForm()">
                                                                다시입력
                                                            </button>
                                                            <button class="btn res_modal_btn2" type="button"
                                                                    id="confirmYnn" disabled
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#additionalModal">
                                                                확인
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- 모달 끝--%>
                                        <%-- 카카오 모달--%>
                                        <div class="" id="additionalModal" tabindex="-1"
                                             aria-labelledby="additionalModalLabel" aria-hidden="true"
                                             data-bs-backdrop="static" data-bs-keyboard="false">
                                            <div class="">
                                                <div class="">
                                                    <div class=" ">
                                                        <h3 class=" " id="additionalModalLabel">
                                                            항공권 예약 문자</h3>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class=" ">
                                                        <p>예약하신 항공권을 카카오톡으로 보내드릴까요?</p>
                                                        <p>항공권 결제 완료 후 카카오톡 메세지로 예약 링크를 보내드립니다</p>
                                                    </div>
                                                    <div class="">
                                                        <input type="hidden" name="OptionMessage" id="OptionMessage"
                                                               value="Y">
                                                        <button type="submit" id="confirmYn"
                                                                class="btn btn-secondary res_kko_btn"

                                                                onclick="sendKOption('N')">괜찮아요
                                                        </button>

                                                        <button type="submit" id="confirmYn"
                                                                class="btn btn-primary res_kko_btn"
                                                                onclick="sendKOption('Y')">보내주세요

                                                        </button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </form>
</main>

<script src="js/javascript.js"></script>
<script>
    function openMenu(evt, agreeMenuName) {
        var i, x, tablinks;
        x = document.getElementsByClassName("agreeMenu");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("agreeTablink");
        for (i = 0; i < x.length; i++) {
            tablinks[i].style.color = "";
        }
        document.getElementById(agreeMenuName).style.display = "block";

        var computedStyle = window.getComputedStyle(evt.currentTarget.firstElementChild);
        var linkColor = computedStyle.getPropertyValue('--primary_02');

        evt.currentTarget.firstElementChild.style.color = linkColor;
    }

    document.getElementById("agreeMyLink").click();

    function enableConfirmButton() {
        var checkbox = document.getElementById("agreeRadioChk0");
        var confirmButton = document.getElementById("confirmYnn");

        confirmButton.disabled = !checkbox.checked;
    }

    function resetForm() {
    }

    function sendMessage(option) {
        document.getElementById("OptionMessage").value = option;
    }

    function sendKOption(option) {
        if (option === 'N') {
            sendMessage('N');
            $('#additionalModal').modal('hide');
        } else if (option === 'Y') {
            sendMessage('Y');
            alert('성공적으로 전송했습니다.');
            $('#additionalModal').modal('hide');
        }
    }
    function combineEmail() {
        var emailn = document.getElementById("emailn").value;
        var emailsite = document.getElementById("emailsite").value;
        var email = emailn + "@" + emailsite;
        document.getElementById("email").value = email;
    }
    function combinePhoneNum() {
        var phonef = document.getElementById("phoneInput1").value;
        var phonem = document.getElementById("phoneInput2").value;
        var phoneb = document.getElementById("phoneInput3").value;
        var combinedPhoneNum = phonef + phonem + phoneb;


        document.getElementById("combinedPhoneNum").value = combinedPhoneNum;
    }

    function combineBirthDate() {
        var year = document.getElementById("year").value;
        var month = document.getElementById("month").value;
        var day = document.getElementById("day").value;
        var birthDate = day + "/" + month + "/" + year;

        document.getElementById("birthDate").value = birthDate;
    }


    function combineGender() {
        var selectedGender = document.querySelector('input[name="gender"]:checked').value;


        document.getElementById("combinedGender").value = selectedGender;
    }


    function setFlightType() {
        var flightType = document.getElementById("flightType").value;
        if (flightType === "직항") {
            document.getElementById('isOneWay').value = 'true';
            document.getElementById('isNonStop').value = 'false';
        } else {
            document.getElementById('isOneWay').value = 'false';
            document.getElementById('isNonStop').value = 'true';
        }

    }


    document.getElementById("confirmYn").addEventListener("click", function () {
        combinePhoneNum();
        combineEmail();
        combineBirthDate();
        combineGender();
        setFlightType();
        sendMessage();
        document.getElementById("reservationp").submit();
    });
</script>

<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>