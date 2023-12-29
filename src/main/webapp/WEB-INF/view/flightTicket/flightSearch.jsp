<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>

<!-- TODO 여기서부터 main영역 -->
<main id="flight_search_page">
    <section class="flight_search_from_to">
        <div class="search_from_to_box">
            <div class="container">
                <div class="form_to_area">
                    <div class="from_to_box">
                        <div class="from_to_select">
                            <div class="from_select">
                                <button type="button" id="from_select_btn"
                                        class="common_modal_btn from_to_modal_btn" data-target="from_modal">
                                    <span class="from_code_value">${req.originLocationCode}</span>
                                    <span class="from_airport_value">${req.originLocationName}</span>
                                </button>
                            </div>
                            <button type="button" class="from_to_icon transform_btn">
                                <img src="/images/icons/transform_icon.svg" alt="전환"/>
                            </button>
                            <div class="to_select">
                                <button type="button" id="to_select_btn"
                                        class="common_modal_btn from_to_modal_btn" data-target="to_modal">
                                    <span class="to_code_value">${req.destinationLocationCode}</span>
                                    <span class="to_airport_value">${req.destinationLocationName}</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="ticket_date_field">
                        <div class="trip_round">
                            <label for="datepicker">출발일 & 도착일</label>
                            <input type="text" class="form-control" id="datepicker" placeholder="출발일 및 도착일 선택"
                                   name="startDate" value="${req.startDate}" data-input/>
                        </div>
                        <div class="trip_one_way">
                            <label for="datepicker2">출발일</label>
                            <input type="text" class="form-control" id="datepicker2" placeholder="출발일 선택"
                                   name="startDate" value="${req.startDate}" data-input/>
                        </div>
                    </div>
                    <div class="passenger_seat_field">
                        <span class="passenger_seat_title">탑승객 & 좌석</span>
                        <div>
                            <button type="button" class="common_modal_btn passenger_seat_btn"
                                    data-target="passenger_seat_modal">
                                <span>승객 ${req.allPassengers} 명</span>
                                <span id="seatClass">${req.seatType()}</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 출발지 모달 -->
            <div class="common_modal from_to_modal" id="from_modal">
                        <span class="modal_close">
                            <img src="/images/icons/close.png" alt="닫기"/>
                        </span>
                <div class="modal_title">
                    <h4>주요 도시 바로 선택</h4>
                </div>
                <div class="modal-content">
                    <div class="from_to_search">
                        <form class="d-flex">
                            <input class="form-control me-2" type="text" placeholder="검색어를 입력해주세요"/>
                            <button class="btn btn-primary" type="submit">검색</button>
                        </form>
                    </div>
                    <form action="">
                        <div class="regions_cities_box">
                            <div>
                                <div class="regions">
                                    <ul class="regions_menu tab_menu">
                                        <li>
                                            <a href="#" data-tab="from_korea" class="tab_active">대한민국</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="from_japan" class="regions_list_item">일본</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="from_asia" class="regions_list_item">아시아</a>
                                        </li>
                                        <li><a href="#" data-tab="from_americas"
                                               class="regions_list_item">미주</a></li>
                                        <li><a href="#" data-tab="from_europe" class="regions_list_item">유럽</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="from_oceania_guam"
                                               class="regions_list_item">대양주/괌</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="from_middle_east"
                                               class="regions_list_item">중동</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="from_latin_america"
                                               class="regions_list_item">중남미</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="from_africa"
                                               class="regions_list_item">아프리카</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="from_china" class="regions_list_item">중국</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div>
                                <div class="cities tab-content" id="from_korea">
                                    <div class="cities_list">
                                        <ul class="from_local_item">
                                            <c:forEach var="korea" items="${korea}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" id="originReal"
                                                            name="origin"
                                                            value="${korea.cityCode}">
                                                        <span class="from_local_code">${korea.cityCode}</span><span
                                                            class="from_local_airport">${korea.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 대한민국  -->
                                <div class="cities tab-content regions_list_item" id="from_japan">
                                    <div class="cities_list">
                                        <ul class="from_local_item">
                                            <c:forEach var="japan" items="${japan}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="${japan.cityCode}">
                                                        <span class="from_local_code">${japan.cityCode}</span><span
                                                            class="from_local_airport">${japan.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 일본 -->
                                <div class="cities tab-content regions_list_item" id="from_asia">
                                    <div class="cities_list">
                                        <ul class="from_local_item">
                                            <c:forEach var="asia" items="${asia}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="${asia.cityCode}">
                                                        <span class="from_local_code">${asia.cityCode}</span><span
                                                            class="from_local_airport">${asia.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 아시아 -->
                                <div class="cities tab-content regions_list_item" id="from_americas">
                                    <div class="cities_list">
                                        <ul class="from_local_item">
                                            <c:forEach var="america" items="${america}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="${america.cityCode}">
                                                        <span class="from_local_code">${america.cityCode}</span><span
                                                            class="from_local_airport">${america.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 미주 -->
                                <div class="cities tab-content regions_list_item" id="from_europe">
                                    <div class="cities_list">
                                        <ul class="from_local_item">
                                            <c:forEach var="europe" items="${europe}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="${europe.cityCode}">
                                                        <span class="from_local_code">${europe.cityCode}</span><span
                                                            class="from_local_airport">${europe.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 유럽 -->
                                <div class="cities tab-content regions_list_item" id="from_oceania_guam">
                                    <div class="cities_list">
                                        <ul class="from_local_item">
                                            <c:forEach var="oceania" items="${oceania}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="${oceania.cityCode}">
                                                        <span class="from_local_code">${oceania.cityCode}</span><span
                                                            class="from_local_airport">${oceania.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 대양주/괌 -->
                                <div class="cities tab-content regions_list_item" id="from_middle_east">
                                    <div class="cities_list">
                                        <ul class="from_local_item">
                                            <c:forEach var="middleEast" items="${middleEast}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="${middleEast.cityCode}">
                                                        <span class="from_local_code">${middleEast.cityCode}</span><span
                                                            class="from_local_airport">${middleEast.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 중동 -->
                                <div class="cities tab-content regions_list_item" id="from_latin_america">
                                    <div class="cities_list">
                                        <ul class="from_local_item">
                                            <c:forEach var="southAmerica" items="${southAmerica}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="${southAmerica.cityCode}">
                                                        <span class="from_local_code">${southAmerica.cityCode}</span><span
                                                            class="from_local_airport">${southAmerica.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 중남미 -->
                                <div class="cities tab-content regions_list_item" id="from_africa">
                                    <div class="cities_list">
                                        <ul class="from_local_item">
                                            <c:forEach var="africa" items="${africa}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="${africa.cityCode}">
                                                        <span class="from_local_code">${africa.cityCode}</span><span
                                                            class="from_local_airport">${africa.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 아프리카 -->
                                <div class="cities tab-content regions_list_item" id="from_china">
                                    <div class="cities_list">
                                        <ul class="from_local_item">
                                            <c:forEach var="china" items="${china}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="${china.cityCode}">
                                                        <span class="from_local_code">${china.cityCode}</span><span
                                                            class="from_local_airport">${china.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 중국 -->
                            </div>
                        </div>
                        <button class="btn btn-primary check_btn" type="button">선택하기</button>
                    </form>
                </div>
            </div>

            <!-- 도착지 모달 -->
            <div class="common_modal from_to_modal" id="to_modal">
                        <span class="modal_close">
                            <img src="/images/icons/close.png" alt="닫기"/>
                        </span>
                <div class="modal_title">
                    <h4>주요 도시 바로 선택</h4>
                </div>
                <div class="modal-content">
                    <div class="from_to_search">
                        <form class="d-flex">
                            <input class="form-control me-2" type="text" placeholder="검색어를 입력해주세요"/>
                            <button class="btn btn-primary" type="submit">검색</button>
                        </form>
                    </div>
                    <form action="">
                        <div class="regions_cities_box">
                            <div>
                                <div class="regions">
                                    <ul class="regions_menu tab_menu">
                                        <li>
                                            <a href="#" data-tab="to_korea" class="tab_active">대한민국</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="to_japan" class="regions_list_item">일본</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="to_asia" class="regions_list_item">아시아</a>
                                        </li>
                                        <li><a href="#" data-tab="to_americas" class="regions_list_item">미주</a>
                                        </li>
                                        <li><a href="#" data-tab="to_europe" class="regions_list_item">유럽</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="to_oceania_guam"
                                               class="regions_list_item">대양주/괌</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="to_middle_east"
                                               class="regions_list_item">중동</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="to_latin_america"
                                               class="regions_list_item">중남미</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="to_africa" class="regions_list_item">아프리카</a>
                                        </li>
                                        <li>
                                            <a href="#" data-tab="to_china" class="regions_list_item">중국</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div>
                                <div class="cities tab-content" id="to_korea">
                                    <div class="cities_list">
                                        <ul class="to_local_item">
                                            <c:forEach var="korea" items="${korea}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="">
                                                        <span class="to_local_code">${korea.cityCode}</span><span
                                                            class="to_local_airport">${korea.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 대한민국  -->
                                <div class="cities tab-content regions_list_item" id="to_japan">
                                    <div class="cities_list">
                                        <ul class="to_local_item">
                                            <c:forEach var="japan" items="${japan}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="">
                                                        <span class="to_local_code">${japan.cityCode}</span><span
                                                            class="to_local_airport">${japan.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 일본 -->
                                <div class="cities tab-content regions_list_item" id="to_asia">
                                    <div class="cities_list">
                                        <ul class="to_local_item">
                                            <c:forEach var="asia" items="${asia}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="">
                                                        <span class="to_local_code">${asia.cityCode}</span><span
                                                            class="to_local_airport">${asia.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 아시아 -->
                                <div class="cities tab-content regions_list_item" id="to_americas">
                                    <div class="cities_list">
                                        <ul class="to_local_item">
                                            <c:forEach var="america" items="${america}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName">
                                                        <span class="to_local_code">${america.cityCode}</span><span
                                                            class="to_local_airport">${america.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 미주 -->
                                <div class="cities tab-content regions_list_item" id="to_europe">
                                    <div class="cities_list">
                                        <ul class="to_local_item">
                                            <c:forEach var="europe" items="${europe}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="">
                                                        <span class="to_local_code">${europe.cityCode}</span><span
                                                            class="to_local_airport">${europe.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 유럽 -->
                                <div class="cities tab-content regions_list_item" id="to_oceania_guam">
                                    <div class="cities_list">
                                        <ul class="to_local_item">
                                            <c:forEach var="oceania" items="${oceania}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="">
                                                        <span class="to_local_code">${oceania.cityCode}</span><span
                                                            class="to_local_airport">${oceania.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 대양주/괌 -->
                                <div class="cities tab-content regions_list_item" id="to_middle_east">
                                    <div class="cities_list">
                                        <ul class="to_local_item">
                                            <c:forEach var="middleEast" items="${middleEast}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="">
                                                        <span class="to_local_code">${middleEast.cityCode}</span><span
                                                            class="to_local_airport">${middleEast.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 중동 -->
                                <div class="cities tab-content regions_list_item" id="to_latin_america">
                                    <div class="cities_list">
                                        <ul class="to_local_item">
                                            <c:forEach var="southAmerica" items="${southAmerica}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="">
                                                        <span class="to_local_code">${southAmerica.cityCode}</span><span
                                                            class="to_local_airport">${southAmerica.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 중남미 -->
                                <div class="cities tab-content regions_list_item" id="to_africa">
                                    <div class="cities_list">
                                        <ul class="to_local_item">
                                            <c:forEach var="africa" items="${africa}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="">
                                                        <span class="to_local_code">${africa.cityCode}</span><span
                                                            class="to_local_airport">${africa.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 아프리카 -->
                                <div class="cities tab-content regions_list_item" id="to_china">
                                    <div class="cities_list">
                                        <ul class="to_local_item">
                                            <c:forEach var="china" items="${china}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" name="cityName"
                                                            value="">
                                                        <span class="to_local_code">${china.cityCode}</span><span
                                                            class="to_local_airport">${china.cityName}</span>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 중국 -->
                            </div>
                        </div>
                        <button class="btn btn-primary check_btn" type="button">선택하기</button>
                    </form>
                </div>
            </div>
            <!-- 탑승객 & 좌석 모달 -->
            <div class="common_modal passenger_seat_modal" id="passenger_seat_modal">
                <form action="">
                            <span class="modal_close">
                                <img src="/images/icons/close.png" alt="닫기"/>
                            </span>
                    <div class="modal_title">
                        <h4>인원 선택</h4>
                    </div>
                    <div class="passenger_box">
                        <div class="passenger_item">
                            <div class="common_sub_tit">
                                <h5>성인</h5>
                            </div>
                            <div class="passenger_count_btn">
                                <button type="button" class="minus"><img class="minus_img"
                                                                         src="/images/icons/minus_icon.svg" alt="빼기">
                                </button>
                                <span class="passenger_count count_num">${req.adults}</span>
                                <button type="button" class="plus"><img class="plus_img"
                                                                        src="/images/icons/plus_icon.svg" alt="더하기">
                                </button>
                            </div>
                        </div>
                        <div class="passenger_item">
                            <div class="common_sub_tit">
                                <h5>소아</h5>
                            </div>
                            <div class="passenger_count_btn">
                                <button type="button" class="minus"><img class="minus_img"
                                                                         src="/images/icons/minus_icon.svg" alt="빼기">
                                </button>
                                <span class="passenger_count count_num">${req.children}</span>
                                <button type="button" class="plus"><img class="plus_img"
                                                                        src="/images/icons/plus_icon.svg" alt="더하기">
                                </button>
                            </div>
                        </div>
                        <div class="passenger_item">
                            <div class="common_sub_tit">
                                <h5>유아</h5>
                            </div>
                            <div class="passenger_count_btn">
                                <button type="button" class="minus"><img class="minus_img"
                                                                         src="/images/icons/minus_icon.svg" alt="빼기">
                                </button>
                                <span class="passenger_count count_num">${req.infants}</span>
                                <button type="button" class="plus"><img class="plus_img"
                                                                        src="/images/icons/plus_icon.svg" alt="더하기">
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="modal_title">
                        <h4>좌석 등급 선택</h4>
                    </div>
                    <ul class="radio_btn seat_radio">
                        <li class="seat_group">
                            <input type="radio" id="economy_class" name="3" value="일반석">
                            <label for="economy_class">일반석</label>
                        </li>
                        <li class="seat_group">
                            <input type="radio" id="business_class" name="3" value="비즈니스석">
                            <label for="business_class">비즈니스석</label>
                        </li>
                        <li class="seat_group">
                            <input type="radio" id="first_class" name="3" value="일등석">
                            <label for="first_class">일등석</label>
                        </li>
                    </ul>
                    <button class="btn btn-primary check_btn" type="button">선택하기</button>
                </form>
            </div>
        </div>

    </section>
    <div class="container">
        <div class="flight_search_cont">
            <section class="flight_search_left">
                <form class="from_to_form" action="/ticket/flight-search/option/${isRound}" method="post">
                    <input type="hidden" name="airlineOption" id="airlineOption" value=""/>
                    <input type="hidden" name="onewayDepTimeOption" id="onewayDepTimeOption" value=""/>
                    <input type="hidden" name="roundDepTimeOption" id="roundDepTimeOption" value=""/>
                    <input type="hidden" name="onewayArrTimeOption" id="onewayArrTimeOption" value=""/>
                    <input type="hidden" name="roundArrTimeOption" id="roundArrTimeOption" value=""/>

                    <input type="hidden" name="originLocationCode" id="origin" value="${req.originLocationCode}"/>
                    <input type="hidden" name="destinationLocationCode" id="destination"
                           value="${req.destinationLocationCode}"/>
                    <input type="hidden" name="adults" id="adults" value="${req.adults}"/>
                    <input type="hidden" name="children" id="children" value="${req.children}"/>
                    <input type="hidden" name="infants" id="infants" value="${req.infants}">
                    <input type="hidden" name="travelClass" id="travelClass" value="${req.seatType()}"/>
                    <div class="flight_detail_wrap departure_time">
                        <div class="flight_detail_box active departure_time">출발시간
                            <a class="detail_arrow" href="#"><img src="/images/icons/icon_down.svg" alt="내리기"></a>
                        </div>
                        <div class="detail_more">
                            <ul class="filter_item">
                                <li>
                                    <p class="filter_tit">가는 날</p>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="onewayDepOption" value="00~06">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>새벽 00:00 ~ 06:00</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="onewayDepOption" value="06~12">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>오전 06:00 ~ 12:00</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="onewayDepOption" value="12~18">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>오후 12:00 ~ 18:00</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="onewayDepOption" value="18~24">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>야간 18:00 ~ 24:00</span>
                                </li>
                            </ul>
                            <c:choose>
                                <c:when test="${isRound == 2}">
                                    <ul class="filter_item">
                                        <li>
                                            <p class="filter_tit">오는 날</p>
                                        </li>
                                        <li>
                                            <label class="check_box">
                                                <input type="checkbox" name="roundDepOption" value="00~06">
                                                <span class="check_box_icon"></span>
                                            </label>
                                            <span>새벽 00:00 ~ 06:00</span>
                                        </li>
                                        <li>
                                            <label class="check_box">
                                                <input type="checkbox" name="roundDepOption" value="06~12">
                                                <span class="check_box_icon"></span>
                                            </label>
                                            <span>오전 06:00 ~ 12:00</span>
                                        </li>
                                        <li>
                                            <label class="check_box">
                                                <input type="checkbox" name="roundDepOption" value="12~18">
                                                <span class="check_box_icon"></span>
                                            </label>
                                            <span>오후 12:00 ~ 18:00</span>
                                        </li>
                                        <li>
                                            <label class="check_box">
                                                <input type="checkbox" name="roundDepOption" value="18~24">
                                                <span class="check_box_icon"></span>
                                            </label>
                                            <span>야간 18:00 ~ 24:00</span>
                                        </li>
                                    </ul>
                                </c:when>
                            </c:choose>

                        </div>
                        <div class="flight_detail_box active departure_time">도착시간
                            <a class="detail_arrow" href="#"><img src="/images/icons/icon_down.svg" alt="내리기"></a>
                        </div>
                        <div class="detail_more">
                            <ul class="filter_item">
                                <li>
                                    <p class="filter_tit">가는 날</p>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="onewayArrOption" value="00~06">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>새벽 00:00 ~ 06:00</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="onewayArrOption" value="06~12">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>오전 06:00 ~ 12:00</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="onewayArrOption" value="12~18">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>오후 12:00 ~ 18:00</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="onewayArrOption" value="18~24">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>야간 18:00 ~ 24:00</span>
                                </li>
                            </ul>
                            <c:choose>
                                <c:when test="${isRound == 2}">
                                    <ul class="filter_item">
                                        <li>
                                            <p class="filter_tit">오는 날</p>
                                        </li>
                                        <li>
                                            <label class="check_box">
                                                <input type="checkbox" name="roundArrOption" value="00~06">
                                                <span class="check_box_icon"></span>
                                            </label>
                                            <span>새벽 00:00 ~ 06:00</span>
                                        </li>
                                        <li>
                                            <label class="check_box">
                                                <input type="checkbox" name="roundArrOption" value="06~12">
                                                <span class="check_box_icon"></span>
                                            </label>
                                            <span>오전 06:00 ~ 12:00</span>
                                        </li>
                                        <li>
                                            <label class="check_box">
                                                <input type="checkbox" name="roundArrOption" value="12~18">
                                                <span class="check_box_icon"></span>
                                            </label>
                                            <span>오후 12:00 ~ 18:00</span>
                                        </li>
                                        <li>
                                            <label class="check_box">
                                                <input type="checkbox" name="roundArrOption" value="18~24">
                                                <span class="check_box_icon"></span>
                                            </label>
                                            <span>야간 18:00 ~ 24:00</span>
                                        </li>
                                    </ul>
                                </c:when>
                            </c:choose>
                        </div>
                        <div class="flight_detail_box active departure_time">항공사
                            <a class="detail_arrow" href="#"><img src="/images/icons/icon_down.svg" alt="내리기"></a>
                        </div>
                        <div class="detail_more">
                            <ul class="filter_item">
                                <li>
                                    <p class="filter_tit">항공사</p>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" value="대한항공" name="option">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>대한항공</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="option" value="아시아나">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>아시아나</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="option" value="제주항공">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>제주항공</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="option" value="티웨이항공">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>티웨이항공</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="option" value="중국남방항공">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>중국남방항공</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="option" value="싱가폴항공">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>싱가폴항공</span>
                                </li>
                                <li>
                                    <label class="check_box">
                                        <input type="checkbox" name="option" value="말레이시아 항공">
                                        <span class="check_box_icon"></span>
                                    </label>
                                    <span>말레이시아 항공</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit">옵션 검색</button>
                </form>
            </section>
            <section class="flight_search_right">
                <ul class="count_and_filter">
                    <li>
                        검색결과 총 <span>${count}</span>개
                    </li>
                </ul>
                <c:forEach var="ticket" items="${ticketList}" varStatus="status">
                    <c:choose>
                        <c:when test="${isRound == 1}">
                            <div class="flight_detail_wrap">
                                <div class="flight_detail_area">
                                    <c:forEach var="itinerary" items="${ticket.itineraries}">
                                        <div class="flight_detail_cont">
                                            <div class="flight_search_result active">
                                                <c:forEach var="segment" items="${itinerary.segments}">
                                                    <ul class="flight_result_top">
                                                        <li class="airline_icon">
                                                            <span class="airline_icon_img"><img
                                                                    src="/images/airline_images/${segment.carrierCode}.png"></span>
                                                            <span>${segment.airlineName}</span>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <span class="airline_time">${segment.departure.time()}</span>
                                                                <span class="airline_arrow_icon">
                                                        <img src="/images/icons/my_trip_arrow.svg" alt="화살표">
                                                        </span>
                                                                <span class="airline_time">${segment.arrival.time()}</span>
                                                            </div>
                                                            <div class="airline_txt">
                                                                <span>${segment.departure.iataCode}</span>
                                                                <span class="airline_time_taken">${itinerary.duration}</span>
                                                                <span>${segment.arrival.iataCode}</span>
                                                            </div>
                                                        </li>
                                                        <c:choose>
                                                            <c:when test="${segment.stops == null}">
                                                                <li>
                                                                    <div>직항</div>
                                                                    <div class="airline_txt">${itinerary.duration}</div>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li>
                                                                    <div>경유</div>
                                                                    <div class="airline_txt">${itinerary.duration}</div>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </ul>
                                                </c:forEach>
                                                <div class="detail_more_btn">
                                                    <span>상세보기</span>
                                                    <div class="detail_arrow"><img src="/images/icons/icon_down.svg">
                                                    </div>
                                                </div>
                                            </div>
                                            <ul class="flight_detail_price">
                                                <li>
                                                    <span class="remaining_seats">${ticket.numberOfBookableSeats}석 남음</span>
                                                </li>
                                                <li>
                                                    <a href="/ticket/preview/${ticket.id}"
                                                       class="reservation_price">${ticket.price.grandTotal}원
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </c:forEach>
                                    <ul class="detail_more">
                                        <li class="detail_more_area">
                                            <c:forEach var="itinerary" items="${ticket.itineraries}">
                                                <c:forEach var="segment" items="${itinerary.segments}">
                                                    <div class="flight_detail_info">
                                                        <div class="detail_more_tit">
                                                            <div>
                                                                <span class="go_label">가는 편</span>
                                                                <span class="">${segment.departure.cityName} (${segment.departure.iataCode})</span>
                                                                <span class="">ㅡ></span>
                                                                <span class="">${segment.arrival.cityName} (${segment.arrival.iataCode})</span>
                                                            </div>
                                                            <span class="total_time"></span>
                                                        </div>
                                                        <span class="total_time"></span>
                                                        <ul class="detail_more_cont">
                                                            <li class="detail_distance">
                                                                <div class="detail_country_name">
                                                                    <span>${segment.airlineName}</span>
                                                                </div>
                                                                <ul>
                                                                    <li class="detail_trip_date">
                                                                        <span>${segment.departure.date()}</span>
                                                                    </li>
                                                                    <li class="detail_trip_cont">
                                                                        <p class="airline_time">${segment.departure.time()}
                                                                            <span>${segment.departure.cityName} ${segment.departure.iataCode}</span>
                                                                        </p>
                                                                        <p>${itinerary.duration}</p>
                                                                        <p class="airline_time">${segment.arrival.time()}
                                                                            <span>${segment.arrival.cityName} ${segment.arrival.iataCode}</span>
                                                                        </p>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </c:forEach>
                                            </c:forEach>
                                        </li>
                                        <div class="common_table detail_fee">
                                            <h5 class="detail_fee_tit">상세요금</h5>
                                            <table class="table table-bordered">
                                                <thead>
                                                <th>항목</th>
                                                <th>항공요금</th>
                                                <th>유류할증료</th>
                                                <th>제세공과금</th>
                                                <th>발권수수료</th>
                                                <th>인원</th>
                                                <th>총요금</th>
                                                </thead>
                                                <c:forEach var="traveler" items="${ticket.newTraveler()}">
                                                    <tbody>
                                                    <tr>
                                                        <td>${traveler.key}</td>
                                                        <td>${traveler.value.base} 원</td>
                                                        <td>${traveler.value.oilPrice} 원</td>
                                                        <td>${traveler.value.tax} 원</td>
                                                        <td>${traveler.value.fee} 원</td>
                                                        <td>${traveler.value.peopleCount} 명</td>
                                                        <td>${traveler.value.grandTotal} 원</td>
                                                    </tr>
                                                    </tbody>
                                                </c:forEach>
                                            </table>
                                        </div>
                                        <ul class="detail_total_fee">
                                            <li>
                                                <h4 class="detail_fee_tit">총 예상요금</h4>
                                            </li>
                                            <li>${ticket.price.grandTotal}원</li>
                                        </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="flight_detail_wrap">
                                <div class="flight_detail_area">
                                    <div class="flight_detail_cont">
                                        <div class="flight_search_result active">
                                            <c:forEach var="itinerary" items="${ticket.roundTrip()}" varStatus="status">
                                                <c:forEach var="segment" items="${itinerary.value.segments()}">
                                                    <ul class="flight_result_top">
                                                        <li class="airline_icon">
                                                <span class="airline_icon_img"><img
                                                        src="/images/airline_images/${segment.carrierCode}.png"
                                                        alt="에어프랑스"></span>
                                                            <span>${segment.airlineName}</span>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <span class="airline_time">${segment.departure.time()}</span>
                                                                <span class="airline_arrow_icon">
                                                        <img src="/images/icons/my_trip_arrow.svg" alt="화살표">
                                                    </span>
                                                                <span class="airline_time">${segment.arrival.time()}</span>
                                                            </div>
                                                            <div class="airline_txt">
                                                                <span>${segment.departure.iataCode}</span>
                                                                <span class="airline_time_taken">${itinerary.value.duration}</span>
                                                                <span>${segment.arrival.iataCode}</span>
                                                            </div>
                                                        </li>
                                                        <c:choose>
                                                            <c:when test="${segment.stops == null}">
                                                                <li>
                                                                    <div style="width: 75px;">직항</div>
                                                                    <div class="airline_txt">${itinerary.value.duration}</div>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li>
                                                                    <div>경유</div>
                                                                    <div class="airline_txt">${itinerary.value.duration}</div>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </ul>
                                                </c:forEach>
                                            </c:forEach>
                                            <div class="detail_more_btn">
                                                <span>상세보기</span>
                                                <div class="detail_arrow"><img src="/images/icons/icon_down.svg">
                                                </div>
                                            </div>
                                        </div>

                                        <ul class="flight_detail_price">
                                            <li>
                                                <span class="remaining_seats">${ticket.numberOfBookableSeats}석 남음</span>
                                            </li>
                                            <li>
                                                <a href="/ticket/preview/${ticket.id}"
                                                   class="reservation_price">${ticket.price.grandTotal}원
                                                    <!-- <img src="/images/icons/detail_arrow.svg" alt="예약 상세보기">/ -->
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <ul class="detail_more">
                                    <div class="detail_more_area">
                                        <c:forEach var="round" items="${ticket.roundTrip()}">
                                            <c:forEach var="segment" items="${round.value.segments()}">
                                                <div class="flight_detail_info">
                                                    <div class="detail_more_tit">
                                                        <div>
                                                            <span class="go_label">${round.key}</span>
                                                            <span class="">${segment.departure.cityName} (${segment.departure.iataCode})</span>
                                                            <span class="">ㅡ></span>
                                                            <span class="">${segment.arrival.cityName} (${segment.arrival.iataCode})</span>
                                                        </div>
                                                        <span class="total_time"></span>
                                                    </div>
                                                    <span class="total_time"></span>
                                                    <ul class="detail_more_cont">
                                                        <li class="detail_distance">
                                                            <div class="detail_country_name">
                                                                <span>${segment.airlineName}</span>
                                                            </div>
                                                            <ul>
                                                                <li class="detail_trip_date">
                                                                    <span>${segment.departure.date()}</span>
                                                                </li>
                                                                <li class="detail_trip_cont">
                                                                    <p class="airline_time">${segment.departure.time()}
                                                                        <span>${segment.departure.cityName} ${segment.departure.iataCode}</span>
                                                                    </p>
                                                                    <p>${round.value.duration}</p>
                                                                    <p class="airline_time">${segment.arrival.time()}
                                                                        <span>${segment.arrival.cityName} ${segment.arrival.iataCode}</span>
                                                                    </p>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </c:forEach>
                                        </c:forEach>
                                        <div class="common_table detail_fee">
                                            <h5 class="detail_fee_tit">상세요금</h5>
                                            <table class="table table-bordered">
                                                <thead>
                                                <th>항목</th>
                                                <th>항공요금</th>
                                                <th>유류할증료</th>
                                                <th>제세공과금</th>
                                                <th>발권수수료</th>
                                                <th>인원</th>
                                                <th>총요금</th>
                                                </thead>
                                                <c:forEach var="traveler" items="${ticket.newTraveler()}">
                                                    <tbody>
                                                    <tr>
                                                        <td>${traveler.key}</td>
                                                        <td>${traveler.value.base} 원</td>
                                                        <td>${traveler.value.oilPrice} 원</td>
                                                        <td>${traveler.value.tax} 원</td>
                                                        <td>${traveler.value.fee} 원</td>
                                                        <td>${traveler.value.peopleCount} 명</td>
                                                        <td>${traveler.value.grandTotal} 원</td>
                                                    </tr>
                                                    </tbody>
                                                </c:forEach>
                                            </table>
                                        </div>
                                        <ul class="detail_total_fee">
                                            <li>
                                                <h4 class="detail_fee_tit">총 예상요금</h4>
                                            </li>
                                            <li>${ticket.price.grandTotal}원</li>
                                        </ul>
                                    </div>
                                </ul>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </section>
        </div>
    </div>
</main>
<script>


    let flgithDetailBox = document.getElementsByClassName("flight_detail_box");
    let i;

    if (flgithDetailBox) {
        for (i = 0; i < flgithDetailBox.length; i++) {
            flgithDetailBox[i].addEventListener("click", function () {
                this.classList.toggle("active");
                let more = this.nextElementSibling;
                if (more.style.maxHeight) {
                    more.style.maxHeight = null;
                } else {
                    more.style.maxHeight = more.scrollHeight + "px";
                }
            });
        }
    }
    // 체크박스 슬라이드

    let flightSearchResults = document.getElementsByClassName("flight_search_result");

    if (flightSearchResults) {
        for (let i = 0; i < flightSearchResults.length; i++) {
            flightSearchResults[i].addEventListener("click", function () {
                this.classList.toggle("active");

                let flightDetailBox = this.closest('.flight_detail_wrap');
                console.log(flightDetailBox);
                if (flightDetailBox) {
                    let detailMore = flightDetailBox.querySelector('.detail_more');
                    console.log(detailMore + " detailMore");
                    if (detailMore) {
                        if (detailMore.style.maxHeight) {
                            detailMore.style.maxHeight = null;
                        } else {
                            detailMore.style.maxHeight = detailMore.scrollHeight + "px";
                        }
                    }
                }
            });
        }
    }
    // 상세 슬라이드


    const oneWay = document.querySelector(".one_way");
    const datepicker = document.getElementById("datepicker");
    const datepicker2 = document.getElementById("datepicker2");
    const startDateInput = document.getElementById("startDate");
    const endDateInput = document.getElementById("endDate");

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
            function (date) {
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
        dateFormat: "YYYY-MM-DD", // 날짜 형식 설정 (예: 2023-09-12)
        enableTime: false,   // 시간 선택 비활성화
        minDate: 'today',    // 오늘 이전 날짜 선택 비활성화
        // defaultDate: new Date(), // 초기 날짜 설정 (현재 날짜로 설정)
        locale: "ko", // 한국어로 지역화
        altFormat: "Y-m-d", // 추가 입력란의 날짜 및 시간 형식
    });
    // 날짜 라이브러리


</script>
<script src="/js/javascript.js"></script>
<script src="/js/option_search.js"></script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>
