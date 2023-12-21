<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>

<!-- TODO 여기서부터 main영역 -->
<main id="flight_ticket_page">
    <section class="nav_bg">
        <div class="nav_container">
            <div class="flight_ticket_box">
                <div class="flight_ticket_title">
                    <h4>항공권 예매</h4>
                </div>
                <form class="from_to_form" action="/tmk" method="post">

                    <input type="hidden" name="originLocationCode" id="origin" value="GMP"/>
                    <input type="hidden" name="destinationLocationCode" id="destination" value="BUS"/>
                    <input type="hidden" name="adults" id="adults" value="0"/>
                    <input type="hidden" name="children" id="children" value="0"/>
                    <input type="hidden" name="infants" id="infants" value="0">
                    <input type="hidden" name="travelClass" id="travelClass" value="일반석"/>
                    <input type="hidden" name="nonStop" id="nonStop" value="false"/>


                    <div class="from_to_form_box">
                        <ul class="round_trip_one_way">
                            <li >
                                <button type="button" class="round distance_active">왕복</button>
                            </li>
                            <li>
                                <button type="button" class="one_way">편도</button>
                            </li>
                        </ul>
                        <div class="form_to_area">
                            <div class="from_to_box">
                                <div class="from_to_select">
                                    <div class="from_select">
                                        <button type="button" id="from_select_btn"
                                                class="common_modal_btn from_to_modal_btn"
                                                data-target="from_modal">
                                            <span class="from_code_value">GMP</span>
                                            <span class="from_airport_value">서울</span>
                                        </button>
                                    </div>
                                    <button type="button" class="from_to_icon transform_btn">
                                        <img src="/images/icons/transform_icon.svg" alt="전환"/>
                                    </button>
                                    <div class="to_select">
                                        <button type="button" id="to_select_btn"
                                                class="common_modal_btn from_to_modal_btn"
                                                data-target="to_modal">
                                            <span class="to_code_value">BUS</span>
                                            <span class="to_airport_value">부산</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="ticket_date_field">
                                <div class="trip_round">
                                    <label for="datepicker">출발일 & 도착일</label>
                                    <input type="text" class="form-control" id="datepicker" placeholder="출발일 및 도착일 선택" name="startDate"/>
                                </div>
                                <div class="trip_one_way">
                                    <label for="datepicker2">출발일</label>
                                    <input type="text" class="form-control" id="datepicker2" placeholder="출발일 선택" name="startDate"/>
                                </div>
                            </div>
                            <div class="passenger_seat_field">
                                <span class="passenger_seat_title">탑승객 & 좌석</span>
                                <div>
                                    <button type="button" class="common_modal_btn passenger_seat_btn"
                                            data-target="passenger_seat_modal">
                                        <span>승객 1 명</span>
                                        <span id="seatClass">일반석</span>
                                    </button>
                                </div>
                            </div>
                            <button class="btn btn-primary" type="submit">검색</button>
                        </div>
                    </div>
                </form>
                <a href="#" class="bbanner-link">
                    <ul class="w3-white">
                        <li><img src="/images/flight_images/flight_img_01.jpg" alt="항공 이미지_01"></li>
                        <li class="flight_content">
                            <h5 class="flight_content_tit">방콕</h5>
                            <div class="from_to_txt">서울 → 방콕</div>
                            <div class="flight_data_txt">2월 6일 ~ 2월 10일</div>
                            <div class="price_transfer">
                                <p class="flight_price">483,900원~</p>
                                <span>직항,경유 포함</span>
                            </div>
                        </li>
                    </ul>
                </a>
                <a href="#" class="bbanner-link">
                    <ul class="w3-white">
                        <li><img src="/images/flight_images/flight_img_02.jpg" alt="항공 이미지_02"></li>
                        <li class="flight_content">
                            <h5 class="flight_content_tit">도쿄</h5>
                            <div class="from_to_txt">서울 → 도쿄</div>
                            <div class="flight_data_txt">2월 6일 ~ 2월 9일</div>
                            <div class="price_transfer">
                                <p class="flight_price">429,400원~</p>
                                <span>직항,경유 포함</span>
                            </div>
                        </li>
                    </ul>
                </a>
                <a href="#" class="bbanner-link">
                    <ul class="w3-white">
                        <li><img src="/images/flight_images/flight_img_03.jpg" alt="항공 이미지_03"></li>
                        <li class="flight_content">
                            <h5 class="flight_content_tit">다낭</h5>
                            <div class="from_to_txt">서울 → 다낭</div>
                            <div class="flight_data_txt">2월 6일 ~ 2월 10일</div>
                            <div class="price_transfer">
                                <p class="flight_price">494,500원~</p>
                                <span>직항,경유 포함</span>
                            </div>
                        </li>
                    </ul>
                </a>
                <a href="#" class="bbanner-link">
                    <ul class="w3-white">
                        <li><img src="/images/flight_images/flight_img_04.jpg" alt="항공 이미지_04"></li>
                        <li class="flight_content">
                            <h5 class="flight_content_tit">대만(타오위안)</h5>
                            <div class="from_to_txt">서울 → 대만</div>
                            <div class="flight_data_txt">2월 5일 ~ 2월 8일</div>
                            <div class="price_transfer">
                                <p class="flight_price">460,000원~</p>
                                <span>직항,경유 포함</span>
                            </div>
                        </li>
                    </ul>
                </a>
            </div>
        </div>
    </section>
</main>
</div>
</div>
<script>

    const oneWay = document.querySelector(".one_way");
    const datepicker = document.getElementById("datepicker");
    const datepicker2 = document.getElementById("datepicker2");
    const startDateInput = document.getElementById("startDate");
    const endDateInput = document.getElementById("endDate");
    console.log(datepicker.value);

    function handleDateChange(selectedDates, dateStr, instance) {
        console.log("선택된 날짜:", dateStr);
    }

    flatpickr(datepicker, {
        // mode: "range",
        // // minDate: "today",
        // dateFormat: "Y-m-d",
        // disable: [
        //     function (date) {
        //         // disable every multiple of 8
        //         return !(date.getDate() % 8);
        //     },
        // ],
        mode: "range",
        minDate: "today",
        dateFormat: "Y-m-d",
        disable: [
            function(date) {
                // disable every multiple of 8
                return !(date.getDate() % 8);
            }
        ],
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

    flatpickr(datepicker2, {
        altInput: true,
        dateFormat: 'Y-m-d', // 날짜 형식 설정 (예: 2023-09-12)
        enableTime: false,   // 시간 선택 비활성화
        minDate: 'today',    // 오늘 이전 날짜 선택 비활성화
        // defaultDate: new Date(), // 초기 날짜 설정 (현재 날짜로 설정)
        locale: "ko", // 한국어로 지역화
        altFormat: "Y-m-d", // 추가 입력란의 날짜 및 시간 형식
    });
    // 날짜 라이브러리
    //
    let tripRound = document.querySelector(".round");
    let tripOneWay = document.querySelector(".one_way");
    let tripRoundDate = document.querySelector(".trip_round");
    let tripOneWayDate = document.querySelector(".trip_one_way");


    tripRound.addEventListener("click",()=> {
        tripRoundDate.style.display="block";
        tripRound.style.color="var(--primary_02)";
        tripOneWayDate.style.display="none";
        tripOneWay.style.color="var(--basic_bl)";

    })
    tripOneWay.addEventListener("click",()=> {
        tripOneWayDate.style.display="block";
        tripRound.style.color="var(--basic_bl)";
        tripRoundDate.style.display="none";
        tripOneWay.style.color="var(--primary_02)";
    })
    // 왕복 편도

    function getCities(event) {
    }

    // 로딩페이지 뒤로가기 눌리면 안됨ㅠㅠ
    $(document).ready(function() {
        // 초기에는 로딩 페이지를 숨깁니다.
        $(".loading").hide();

        // 폼이 제출될 때 로딩 페이지를 표시합니다.
        $("form").submit(function() {
            $(".loading").show();
        });

    });

    // 비동기 요청이 완료되면 로딩 페이지를 숨깁니다.
    $(document).ajaxStop(function() {
        $(".loading").hide();
    });

    document.addEventListener('DOMContentLoaded', function() {
        // a 태그를 찾아 클릭 이벤트를 추가
        var flightLink = document.querySelector('.bbanner-link');

        flightLink.addEventListener('click', function(event) {
            // 클릭 이벤트가 발생했을 때 실행될 코드
            event.preventDefault(); // 기본 동작 방지
            console.log("이벤트 리스너가 추가되었습니다.");

            // 가져올 값들을 a 태그에서 찾아옴
            var origin = 'ICN'; // 예시 값, 필요에 따라 수정
            var destination = 'BKK'; // 예시 값, 필요에 따라 수정
            var adults = '1'; // 예시 값, 필요에 따라 수정
            var children = '0'; // 예시 값, 필요에 따라 수정
            var infants = '0'; // 예시 값, 필요에 따라 수정
            var travelClass = '일반석'; // 예시 값, 필요에 따라 수정
            var nonStop = 'false'; // 예시 값, 필요에 따라 수정

            // form의 각 input에 값을 할당
            document.getElementById('origin').value = origin;
            document.getElementById('destination').value = destination;
            document.getElementById('adults').value = adults;
            document.getElementById('children').value = children;
            document.getElementById('infants').value = infants;
            document.getElementById('travelClass').value = travelClass;
            document.getElementById('nonStop').value = nonStop;

            // form submit
            document.querySelector('.from_to_form').submit();
        });
    });
</script>
<script src="/js/javascript.js"></script>
<script src="/js/ticket_search.js"></script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>