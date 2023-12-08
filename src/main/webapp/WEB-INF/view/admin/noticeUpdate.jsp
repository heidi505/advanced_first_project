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
                <button type="button" onclick="history.back()"><img src="/images/icons/admin_arrow.svg" alt="뒤로가기">
                </button>
                공지 등록
            </h3>
            <div class="admin_common_form">
                <form>
                    <div class="admin_form_box">
                        <div class="admin_form_tit">
                            <h5>공지사항</h5>
                        </div>
                        <ul class="admin_form_area">
                            <li class="admin_form_textfield">
                                <label for="noticeTitle" class="form-label">제목</label>
                                <input type="text" id="noticeTitle" class="form-control"
                                       value="[공지] 2023년 12월 1일 부 유류할증료 안내드립니다."
                                       name="noticeTitle">
                            </li>
                            <li class="admin_form_textfield">
                                <label for="noticeCont" class="form-label">내용</label>
                                <div><textarea class="form-control" name="noticeCont" id="noticeCont" cols="30"
                                               rows="10" >유류할증료는 예약 시점 및 결제시한과 별개로 발권일 기
                                        준으로 변동되기에 여행이 확정되신 여행자분께서는 예약
                                        하신 항공권을 당월 내 발권까지 완료하는 것을 권장 드립
                                        니다!
                                        ※ 당월 내 예약 및 결제를 하셨더라도 여권 정보 미 입력 시
                                        발권 진행이 불가하며 결제금액이 인상 또는 예약이 취소될
                                        수 있습니다.</textarea>
                                </div>
                            </li>
                        </ul>
                        <div class="admin_common_btn">
                            <a href="#" class="btn btn-outline-primary">삭제</a>
                            <button type="submit" class="btn btn-primary">수정완료</button>
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
        altFormat: "F j, Y", // 추가 입력란의 날짜 및 시간 형식
    });
</script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>