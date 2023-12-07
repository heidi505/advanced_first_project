<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/adminHeader.jsp" %>


<!-- TODO 여기서부터 main영역 -->
<main id="banner_list_page">
    <div class="section">
        <div class="container">
            <h3 class="admin_common_tit">
                <button type="button" onclick="history.back()"><img src="/images/icons/admin_arrow.svg" alt="뒤로가기"></button>
                배너 수정
            </h3>
            <div class="admin_common_form">
                <form>
                    <div class="admin_form_box">
                        <div class="admin_form_tit">
                            <h5>항공권 배너 수정</h5>
                        </div>
                        <div class="admin_form_area">
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="countryName" class="form-label">나라명</label>
                                    <input type="text" id="countryName" class="form-control" value="방콕" name="countryName">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="flightPrice" class="form-label">가격</label>
                                    <input type="number" id="flightPrice" class="form-control" value="230000" name="flightPrice">
                                </li>
                            </ul>
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="startingPoint" class="form-label">출발지</label>
                                    <input type="text" id="startingPoint" class="form-control" value="서울" name="startingPoint">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="destination" class="form-label">도착지</label>
                                    <input type="text" id="destination" class="form-control" value="방콕" name="destination">
                                </li>
                            </ul>
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="departureDate" class="form-label">출발일</label>
                                    <input type="text" id="departureDate" class="datepicker" value="12월 05일 ( 화 )" name="departureDate">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="arrivalDate" class="form-label">도착일</label>
                                    <input type="text" id="arrivalDate" class="datepicker" value="12월 10일 ( 수 ) " name="arrivalDate">
                                </li>
                            </ul>
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <p>항공권 사진</p>
                                    <img class="admin_img" src="/images/flight_images/flight_img_01.jpg" alt="배너이미지">
                                </li>
                            </ul>
                        </div>
                        <div class="admin_common_btn">
                            <a href="#" class="btn btn-outline-primary">삭제</a>
                            <button type="submit" class="btn btn-primary">수정 완료</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</main>

</div>
</div>
<script>
    const datepicker = document.getElementsByClassName("datepicker");
    const datepicker2 = document.getElementById("datepicker2");
    const startDateInput = document.getElementById("startDate");
    const endDateInput = document.getElementById("endDate");

    function handleDateChange(selectedDates, dateStr, instance) {
        console.log("선택된 날짜:", dateStr);
    }

    flatpickr(datepicker, {
        mode: "range",
        minDate: "today",
        // dateFormat: "Y-m-d",
        disable: [
            function (date) {
                // disable every multiple of 8
                return !(date.getDate() % 8);
            },
        ],
        // dateFormat: "Y-m-d", // 날짜 및 시간 형식 설정 (예: 2023-09-12 15:30)// 시간 선택 활성화
        time_24hr: true, // 24시간 형식 사용
        minDate: "today", // 오늘 이전 날짜 선택 비활성화
        maxDate: "2025-12-31", // 특정 날짜까지 선택 가능
        defaultDate: "today", // 초기 날짜 설정 (현재 날짜와 시간)
        disable: ["2023-09-15", "2023-09-20"], // 특정 날짜 비활성화
        locale: "ko", // 한국어로 지역화
        onOpen: function (selectedDates, dateStr, instance) {
            // 위젯이 열릴 때 실행할 코드
        },
        onClose: function (selectedDates, dateStr, instance) {
            // 위젯이 닫힐 때 실행할 코드
        },
        onChange: function (selectedDates, dateStr, instance) {
            // 날짜가 변경될 때 실행할 코드
        },
        disableMobile: true, // 모바일 기기에서 위젯 비활성화
        altInput: true, // 추가 입력란 활성화
        altFormat: "F j, Y", // 추가 입력란의 날짜 및 시간 형식
    });
    // flatpickr(startDateInput, {
    //   dateFormat: "Y-m-d",
    //   enableTime: false,
    //   minDate: "today",
    //   defaultDate: "today",
    //   locale: "ko",
    //   onChange: handleDateChange, // 날짜 선택 이벤트 핸들러 등록
    // });
    // flatpickr(endDateInput, {
    //   dateFormat: "Y-m-d",
    //   enableTime: false,
    //   minDate: "today",
    //   defaultDate: "today",
    //   locale: "ko",
    //   onChange: handleDateChange, // 날짜 선택 이벤트 핸들러 등록
    // });
    // 날짜 라이브러리
</script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>