<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>

<!-- TODO 여기서부터 main영역 -->
<main id="reservation_detail_page">
                                        <tr>
                                        <th class="">
                                            <span class="">${ticket.itineraries[0].segments[0].departure.cityName}</span>
                                            <span class="">${ticket.itineraries[0].segments[0].departure.iataCode}</span>
                                            <input type="hidden" name="departureCity" id="departureCity"
                                                   value="${ticket.itineraries[0].segments[0].departure.cityName}">
                                            <input type="hidden" name="departureAirport" id="departureAirport"
                                                   value="${ticket.itineraries[0].segments[0].departure.iataCode}">
                                        </th>
                                        <th class="">
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

                                                <c:if test="${ticket.oneWay eq false}">
                                                    직항
                                                </c:if>
                                                <c:if test="${ticket.oneWay eq true}">
                                                    경유
                                                </c:if>

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
                                    <input type="text" class="detail_input" id="resName" placeholder=""
                                           name="resName" value="성민경" required>
                                        <label for="email" class="detail_group_maginb"> 이메일 주소 </label>
                                    <input type="text" class="detail_input" id="emailn"
                                           placeholder="" name="emailn" value="wildlegion" required>
                                    <span class="detail_email">@</span>
                                    <input type="text" class="detail_input" id="emailsite"
                                           placeholder="" name="emailsite" value="naver.com" required>
                                    <input type="hidden" name="email" id="email" value="">
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
                            <c:forEach var="travelerPricing" items="${ticket.travelerPricings}" varStatus="loop">
                                    <div class="detail_group_padding">
                                        탑승객 ${loop.index + 1}:
                                        <c:choose>
                                            <c:when test="${travelerPricing.travelerType eq 'ADULT'}">
                                                성인
                                            </c:when>
                                            <c:when test="${travelerPricing.travelerType eq 'CHILD'}">
                                                소아
                                            </c:when>
                                            <c:when test="${travelerPricing.travelerType eq 'HELD_INFANT'}">
                                                유아
                                            </c:when>
                                            <c:otherwise>
                                                기타
                                            </c:otherwise>
                                        </c:choose>
                                            <p><label for="lastName" class="detail_group_maginb">영문 성</label></p>
                                            <input type="text" class="detail_name_input" id="lastName"
                                                   placeholder="예: ) HONG" name="lastName" value="SUNG" required>
                                            <p><label for="firstName" class="detail_group_maginb">영문 이름</label></p>
                                            <input type="text" class="detail_name_input" id="firstName"
                                                   placeholder="예: ) GILDONG" name="firstName" value="MINKYEONG" required>
                                            <input type="radio" class="form-control" id="select" name="gender" value="male"><label
                                                for="select">남자</label>
                                            <input type="radio" class="form-control" id="select2" name="gender"
                                                   value="female"><label for="select2">여자</label>
                                        <input type="text" class="detail_input" id="year" placeholder="" name="year"
                                               value="1991"
                                               required>
                                        <input type="text" class="detail_input" id="month" placeholder="" name="month"
                                               value="05"
                                               required>
                                        <input type="text" class="detail_input" id="day" placeholder="" name="day"
                                               value="22" required>
                                        <input type="hidden" name="birthDate" id="birthDate" value="">
                            </c:forEach>
                                    <span>${ticket.itineraries[0].segments[0].departure.cityName}
                                        <img src="../images/ico_from_to_02.png" class="preview_price_img">
                                        ${ticket.itineraries[0].segments[0].arrival.cityName}
                                    </span>

                                    ${ticket.itineraries[0].segments[0].departure.date()}
                                        - ${ticket.itineraries[0].segments[0].arrival.date()} ·
                                        승객 ${ticket.travelerPricings.size()}명

                                                    <span>${ticket.adultAnd()}</span>
                                                    <input type="hidden" name="passengerType" id="passengerType" value="성인">
                                                    <input type="hidden" name="passengerAmount" id="passengerAmount" value="1">

                                                        <td>${ticket.travelerPricings.size()}명</td>
                                                        <td>${ticket.price.base}원</td>
                                                        <input type="hidden" name="airFare" id="airFare"
                                                               value="${ticket.price.base}">

                                                        <td>${ticket.travelerPricings.size()}명</td>
                                                        <td>${ticket.price.oilPrice}원</td>
                                                        <input type="hidden" name="fuelSurcharge" id="fuelSurcharge"
                                                               value="${ticket.price.oilPrice}">

                                                        <td>${ticket.travelerPricings.size()}명</td>
                                                        <td>${ticket.price.oilPrice}원</td>
                                                        <input type="hidden" name="taxes" id="taxes"
                                                               value="${ticket.price.oilPrice}">

                                                        <td>${ticket.travelerPricings.size()}명</td>
                                                        <td>${ticket.price.fee}원</td>
                                                        <input type="hidden" name="ticketingFee" id="ticketingFee"
                                                               value="${ticket.price.fee}">

                                                        <td>${ticket.price.grandTotal}원</td>
                                                <b class="preview_price_marginr">${ticket.price.grandTotal}<span>원</span></b>
                                                <input type="hidden" name="totalPrice" id="totalPrice" value="${ticket.price.grandTotal}">

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
</main>

<script src="js/javascript.js"></script>
<script>
    /* 예약하기 페이지 동의항목 */
    function openMenu(evt, agreeMenuName) {
        var i, x, tablinks;
        x = document.getElementsByClassName("agreeMenu");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("agreeTablink");
        for (i = 0; i < x.length; i++) {
            tablinks[i].style.color = ""; // 기존 글자색 제거
        }
        document.getElementById(agreeMenuName).style.display = "block";
        // 외부 스타일 가져오기
        var computedStyle = window.getComputedStyle(evt.currentTarget.firstElementChild);
        var linkColor = computedStyle.getPropertyValue('--primary_02');

        evt.currentTarget.firstElementChild.style.color = linkColor; // 가져온 색상으로 클릭한 탭의 글자색 지정
    }

    document.getElementById("agreeMyLink").click();

    function enableConfirmButton() {
        var checkbox = document.getElementById("agreeRadioChk0");
        var confirmButton = document.getElementById("confirmYnn");

        // 체크박스가 선택되었을 때 버튼 활성화
        confirmButton.disabled = !checkbox.checked;
    }

    function resetForm() {
        // 다시입력 버튼 클릭 시 동작할 내용 추가
        // 예: 입력된 내용 초기화 또는 페이지 새로고침
    }


    // 카카오 모달
    function sendMessage(option) {
        document.getElementById("OptionMessage").value = option;
    }

    function sendKOption(option) {
        if (option === 'N') {
            // '괜찮아요' 버튼 클릭 시 모달 창 닫기
            sendMessage('N');
            $('#additionalModal').modal('hide');
        } else if (option === 'Y') {
            // '보내주세요' 버튼 클릭 시 알림 창 띄우기
            sendMessage('Y');
            alert('성공적으로 전송했습니다.');
            $('#additionalModal').modal('hide');
        }
    }

    // post
    // 이메일 조합
    function combineEmail() {
        var emailn = document.getElementById("emailn").value;
        var emailsite = document.getElementById("emailsite").value;
        var email = emailn + "@" + emailsite;

        // hidden 필드에 값 설정
        document.getElementById("email").value = email;
    }

    // 휴대전화 번호 조합 및 hidden 필드에 설정
    function combinePhoneNum() {
        var phonef = document.getElementById("phoneInput1").value;
        var phonem = document.getElementById("phoneInput2").value;
        var phoneb = document.getElementById("phoneInput3").value;
        var combinedPhoneNum = phonef + phonem + phoneb;

        // hidden 필드에 값 설정
        document.getElementById("combinedPhoneNum").value = combinedPhoneNum;
    }

    // 생년월일 조합
    function combineBirthDate() {
        var year = document.getElementById("year").value;
        var month = document.getElementById("month").value;
        var day = document.getElementById("day").value;
        var birthDate = day + "/" + month + "/" + year;

        document.getElementById("birthDate").value = birthDate;
    }

    // 성별 조합
    function combineGender() {
        var selectedGender = document.querySelector('input[name="gender"]:checked').value;

        // hidden 필드에 값 설정
        document.getElementById("combinedGender").value = selectedGender;
    }

    // 좌석 타입
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

    // 폼 제출 시에 조합 함수 호출 및 폼 submit
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