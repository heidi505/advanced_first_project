<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header.jsp -->
<%@ include file="layout/header.jsp" %>

<!-- TODO 여기서부터 main영역 -->
<main id="flight_ticket_page">
    <section class="nav_bg">
        <div class="nav_container">
            <div class="flight_ticket_box">
                <div class="flight_ticket_title">
                    <h4>항공권 예매</h4>
                </div>
                <form class="from_to_form" action="/ticket/flight-search" method="post">

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
                                            <span class="from_airport_value">서울 김포</span>
                                        </button>
                                    </div>
                                    <button type="button" class="from_to_icon transform_btn">
                                        <img src="images/icons/transform_icon.svg" alt="전환"/>
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
                <!-- 출발지 모달 -->
                <div class="common_modal from_to_modal" id="from_modal">
              <span class="modal_close">
                <img src="images/icons/close.png" alt="닫기"/>
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
                                                <a href="#" data-tab="from_korea"  class="tab_active">대한민국</a>
                                            </li>
                                            <li>
                                                <a href="#" data-tab="from_japan" class="regions_list_item">일본</a>
                                            </li>
                                            <li>
                                                <a href="#" data-tab="from_asia" class="regions_list_item">아시아</a>
                                            </li>
                                            <li><a href="#" data-tab="from_americas" class="regions_list_item">미주</a>
                                            </li>
                                            <li><a href="#" data-tab="from_europe" class="regions_list_item">유럽</a></li>
                                            <li>
                                                <a href="#" data-tab="from_oceania_guam"
                                                   class="regions_list_item">대양주/괌</a>
                                            </li>
                                            <li>
                                                <a href="#" data-tab="from_middle_east" class="regions_list_item">중동</a>
                                            </li>
                                            <li>
                                                <a href="#" data-tab="from_latin_america"
                                                   class="regions_list_item">중남미</a>
                                            </li>
                                            <li>
                                                <a href="#" data-tab="from_africa" class="regions_list_item">아프리카</a>
                                            </li>
                                            <li>
                                                <a href="#" data-tab="from_china" class="regions_list_item">중국</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div>
                                    <div class="cities tab-content tab_active" id="from_korea">
                                        <div class="cities_list">
                                            <ul class="from_local_item">
                                                <c:forEach var="korea" items="${korea}">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" id="originReal" name="origin" value="${korea.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${japan.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${asia.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${america.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${europe.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${oceania.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${middleEast.cityCode}">
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
                                                <c:forEach var="sAme" items="${southAmerica}">
                                                    <li class="local_item">
                                                        <button type="button" aria-disabled="false" name="cityName" value="${sAme.cityCode}">
                                                            <span class="from_local_code">${sAme.cityCode}</span><span
                                                                class="from_local_airport">${sAme.cityName}</span>
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${africa.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${china.cityCode}">
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
                <img src="images/icons/close.png" alt="닫기"/>
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
                                            <li><a href="#" data-tab="to_americas" class="regions_list_item">미주</a></li>
                                            <li><a href="#" data-tab="to_europe" class="regions_list_item">유럽</a></li>
                                            <li>
                                                <a href="#" data-tab="to_oceania_guam"
                                                   class="regions_list_item">대양주/괌</a>
                                            </li>
                                            <li>
                                                <a href="#" data-tab="to_middle_east" class="regions_list_item">중동</a>
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${korea.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${japan.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${asia.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${america.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${europe.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${oceania.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${middleEast.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${southAmerica.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${africa.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName" value="${china.cityCode}">
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
                          <img src="images/icons/close.png" alt="닫기"/>
                        </span>
                        <div class="modal_title">
                            <h4>인원 선택</h4>
                        </div>
                        <div class="passenger_box">
                            <div class="passenger_item" >
                                <div class="common_sub_tit">
                                    <h5>성인</h5>
                                </div>
                                <div class="passenger_count_btn">
                                    <button type="button" class="minus"><img class="minus_img"
                                                                             src="/images/icons/minus_icon.svg"
                                                                             alt="빼기"></button>
                                    <span class="passenger_count count_num" id="adultNum">0</span>
                                    <button type="button" class="plus"><img class="plus_img"
                                                                            src="/images/icons/plus_icon.svg"
                                                                            alt="더하기"></button>
                                </div>
                            </div>
                            <div class="passenger_item">
                                <div class="common_sub_tit">
                                    <h5>소아</h5>
                                </div>
                                <div class="passenger_count_btn">
                                    <button type="button" class="minus"><img class="minus_img"
                                                                             src="/images/icons/minus_icon.svg"
                                                                             alt="빼기"></button>
                                    <span class="passenger_count count_num" id="childrenNum">0</span>
                                    <button type="button" class="plus"><img class="plus_img"
                                                                            src="/images/icons/plus_icon.svg"
                                                                            alt="더하기"></button>
                                </div>
                            </div>
                            <div class="passenger_item">
                                <div class="common_sub_tit">
                                    <h5>유아</h5>
                                </div>
                                <div class="passenger_count_btn">
                                    <button type="button" class="minus"><img class="minus_img"
                                                                             src="/images/icons/minus_icon.svg"
                                                                             alt="빼기"></button>
                                    <span class="passenger_count count_num" id="infantNum">0</span>
                                    <button type="button" class="plus"><img class="plus_img"
                                                                            src="/images/icons/plus_icon.svg"
                                                                            alt="더하기"></button>
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
        </div>
    </section>
    <!-- nav banner -->
    <section class="flight_search_bg">
        <div class="container">
            <div class="flight_search_tit">
                <h5>최근 검색한 항공권</h5>
                <div class="flight_search_box">
              <span class="flight_search_close">
                <img src="images/icons/close.png" alt="닫기"/>
              </span>
                    <ul class="flight_search_list">
                        <li>
                            <span class="transfer_label">왕복</span>
                        </li>
                        <li class="flight_search_sub_tit">
                            <span class="from_search_txt">부산(PUS)</span>
                            <span class="flight_search_icon"><img src="/images/icons/transform_small_icon.svg"
                                                                  alt=""></span>
                            <span class="to_search_txt">도쿄(TYO)</span>
                        </li>
                        <li class="flight_search_sub_txt">
                            <span class="flight_search_date">12월 5일 ~ 12월 7일</span>
                            <span class="flight_search_item">성인 1 - 일반석</span>
                        </li>
                    </ul>
                </div>
                <div class="flight_search_box">
              <span class="flight_search_close">
                <img src="images/icons/close.png" alt="닫기"/>
              </span>
                    <ul class="flight_search_list">
                        <li>
                            <span class="transfer_label">왕복</span>
                        </li>
                        <li class="flight_search_sub_tit">
                            <span class="from_search_txt">부산(PUS)</span>
                            <span class="flight_search_icon"><img src="/images/icons/transform_small_icon.svg"
                                                                  alt=""></span>
                            <span class="to_search_txt">도쿄(TYO)</span>
                        </li>
                        <li class="flight_search_sub_txt">
                            <span class="flight_search_date">12월 5일 ~ 12월 7일</span>
                            <span class="flight_search_item">성인 1 - 일반석</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <section class="flight_banner_box">
        <div class="container">
            <div class="flight_banner_item">
                <div class="flight_banner_tit">
                    <h3>검색이 가장 많은 도시</h3>
                </div>
                <div class="flight_banner_list">
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_img_01.jpg" alt="항공 이미지_01"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_img_02.jpg" alt="항공 이미지_02"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_img_03.jpg" alt="항공 이미지_03"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_img_04.jpg" alt="항공 이미지_04"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                </div>
            </div>
            <div class="flight_banner_item">
                <div class="flight_banner_tit">
                    <h3>초특가 상품으로 알뜰한 여행</h3>
                </div>
                <div class="flight_banner_list">
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_sale_img_01.jpg" alt="항공 이미지_01"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_sale_img_02.jpg" alt="항공 이미지_02"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_sale_img_03.jpg" alt="항공 이미지_03"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_sale_img_04.jpg" alt="항공 이미지_04"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                </div>
            </div>
            <div class="flight_banner_item">
                <div class="flight_banner_tit">
                    <h3>시간 임박! 땡처리 항공권</h3>
                </div>
                <div class="flight_banner_list">
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_special_img_01.jpg" alt="항공 이미지_01"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_special_img_02.jpg" alt="항공 이미지_02"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_special_img_03.jpg" alt="항공 이미지_03"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_special_img_04.jpg" alt="항공 이미지_04"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">12월 12일 ~ 12월 15일</div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                </div>
            </div>
            <div class="common_table flight_notice">
                <h4 class="flight_notice_tit">항공권 공지사항</h4>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td>
                            <span>[공지] 2023년 12월 1일 부 유류할증료 안내</span>
                            <span>2023-11-28</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>[공지] 2023년 12월 1일 부 유류할증료 안내</span>
                            <span>2023-11-28</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>[공지] 2023년 12월 1일 부 유류할증료 안내</span>
                            <span>2023-11-28</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <!-- flight_banner -->
</main>
</div>
</div>
<script>
    // 도시 값 넣기

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
        mode: "range",
        // minDate: "today",
        dateFormat: "Y-m-d",
        disable: [
            function (date) {
                // disable every multiple of 8
                return !(date.getDate() % 8);
            },
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
</script>
<script src="/js/javascript.js"></script>
<script src="/js/ticket_search.js"></script>
<!-- header.jsp -->
<%@ include file="layout/footer.jsp" %>