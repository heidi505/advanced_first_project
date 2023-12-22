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
                쿠폰 등록
            </h3>
            <div class="admin_common_form">
                <form action="/admin/coupon-save" method="post">
                    <div class="admin_form_box">
                        <div class="admin_form_tit">
                            <h5>쿠폰 등록</h5>
                        </div>
                        <div class="admin_form_area">
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="userId" class="form-label">사용자 번호</label>
                                    <input type="number" id="userId" class="form-control" placeholder="쿠폰 이름을 입력해주세요" name="userId" >
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="couponName" class="form-label">쿠폰 이름</label>
                                    <input type="text" id="couponName" class="form-control" placeholder="쿠폰 이름을 입력해주세요" name="couponName">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="departureDate" class="form-label">쿠폰 발급 번호 </label>
                                    <input type="text" id="departureDate" class="form-control" placeholder="쿠폰 랜덤으로 8자리 생성됩니다." disabled name="couponNumber">
                                </li>

                            </ul>
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="issueDate" class="form-label">발급일</label>
                                    <input type="text" id="issueDate" class="datepicker" placeholder="발급일을 입력해주세요" name="createdAt">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="expirationDate" class="form-label">만료일</label>
                                    <input type="text" id="expirationDate" class="datepicker" placeholder="만료일을 입력해주세요" name="expiredAt">
                                </li>
                            </ul>
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="couponPrice" class="form-label">쿠폰 금액</label>
                                    <input type="number" id="couponPrice" class="form-control" placeholder="쿠폰 금액을 입력해주세요" name="discountingPrice">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="couponCont" class="form-label">쿠폰 내용</label>
                                    <textarea cols="30" rows="5" id="couponCont" class="form-control" placeholder="쿠폰 내용을 입력해주세요" name="couponContent"></textarea>
                                </li>
                            </ul>
                            <div>
                                <input type="hidden" value="false" name="isUsed">
                            </div>
                        </div>
                        <div class="admin_common_btn"><button type="submit" class="btn btn-primary">등록하기</button></div>
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
        minDate: "today",
        dateFormat: "Y-m-d",
        disable: [
            function (date) {
                // disable every multiple of 8
                return !(date.getDate() % 8);
            },
        ],
        dateFormat: "Y-m-d", // 날짜 및 시간 형식 설정 (예: 2023-09-12 15:30)// 시간 선택 활성화
        time_24hr: true, // 24시간 형식 사용
        minDate: "today", // 오늘 이전 날짜 선택 비활성화
        maxDate: "2025-12-31", // 특정 날짜까지 선택 가능
        // defaultDate: "today", // 초기 날짜 설정 (현재 날짜와 시간)
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
        altFormat: "Y-m-d", // 추가 입력란의 날짜 및 시간 형식
    });
</script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>