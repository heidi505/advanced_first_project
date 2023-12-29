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
                            <li>
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
                                            <span class="from_code_value">SEL</span>
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
                                    <input type="text" class="form-control" id="datepicker" placeholder="출발일 및 도착일 선택"
                                           name="startDate" value="" data-input/>
                                </div>
                                <div class="trip_one_way">
                                    <label for="datepicker2">출발일</label>
                                    <input type="text" class="form-control" id="datepicker2" placeholder="출발일 선택"
                                           name="startDate" value="" data-input/>
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
                <img src="/images/icons/close.png" alt="닫기"/>
              </span>
                    <div class="modal_title">
                        <h4>주요 도시 바로 선택</h4>
                    </div>
                    <div class="modal-content">
                        <div class="from_to_search">
                            <form class="d-flex">
                                <input class="search_city_input from_modal form-control me-2" type="text"
                                       placeholder="검색어를 입력해주세요"/>
                                <button class="search_city_button from_modal btn btn-primary" type="button">검색</button>
                            </form>
                        </div>
                        <div class="city_search_box from_modal my-2 border">
                            <table class="city_search_table from_modal">
                                <thead>
                                <tr>
                                    <td class="p-2">IATA 코드</td>
                                    <td class="p-2">도시</td>
                                    <td class="p-2">국가</td>
                                </tr>
                                </thead>
                                <tbody class="city_search_result">
                                <!-- 검색 결과 창 -->
                                </tbody>
                            </table>
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
                                                        <button type="button" aria-disabled="false" id="originReal"
                                                                name="origin" value="${korea.cityCode}">
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
                                                <c:forEach var="sAme" items="${southAmerica}">
                                                    <li class="local_item">
                                                        <button type="button" aria-disabled="false" name="cityName"
                                                                value="${sAme.cityCode}">
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
                                <input class="search_city_input to_modal form-control me-2" type="text"
                                       placeholder="검색어를 입력해주세요"/>
                                <button class="search_city_button to_modal btn btn-primary" type="button">검색</button>
                            </form>
                        </div>
                        <div class="city_search_box to_modal my-2 border">
                            <table class="city_search_table to_modal">
                                <thead>
                                <tr>
                                    <td class="p-2">IATA 코드</td>
                                    <td class="p-2">도시</td>
                                    <td class="p-2">국가</td>
                                </tr>
                                </thead>
                                <tbody class="city_search_result">
                                <!-- 검색 결과 창 -->
                                </tbody>
                            </table>
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
                                                        <button type="button" aria-disabled="false" name="cityName"
                                                                value="${korea.cityCode}">
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
                                                                value="${japan.cityCode}">
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
                                                                value="${asia.cityCode}">
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
                                                        <button type="button" aria-disabled="false" name="cityName"
                                                                value="${america.cityCode}">
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
                                                                value="${europe.cityCode}">
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
                                                                value="${oceania.cityCode}">
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
                                                                value="${middleEast.cityCode}">
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
                                                                value="${southAmerica.cityCode}">
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
                                                                value="${africa.cityCode}">
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
                                                                value="${china.cityCode}">
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
                            <div class="passenger_item">
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
                                <input type="radio" id="economy_class" name="3" value="일반석" checked>
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
                <!-- 여기부터 -->
                <c:forEach var="list" items="${searchedList}">
                    <div class="flight_search_box">
                        <a class="flight_search_a"
                           href="/ticket/flight-recent-search?originLocationCode=${list.departureCity}&destinationLocationCode=${list.arrivalCity}&startDate=${list.startDate}&endDate=${list.endDate}&adults=${list.adults}&children=${list.children}&infants=${list.infants}&travelClass=${list.travelClass}"></a>
                        <input type="hidden" value="${list.id}">
                        <span class="flight_search_close">
                <img src="images/icons/close.png" alt="닫기"/>
              </span>
                        <ul class="flight_search_list">
                            <li>
                            <span class="transfer_label">
                            <c:choose>
                                <c:when test="${list.oneWayBoolean eq true }">
                                    편도
                                </c:when>
                                <c:otherwise>
                                    왕복
                                </c:otherwise>
                            </c:choose>
                            </span>
                            </li>
                            <li class="flight_search_sub_tit">
                                <span class="from_search_txt">${list.koreanDepartureCity}(${list.departureCity})</span>
                                <span class="flight_search_icon"><img src="/images/icons/transform_small_icon.svg"
                                                                      alt=""></span>
                                <span class="to_search_txt">${list.koreanArrivalCity}(${list.arrivalCity})</span>
                            </li>
                            <li class="flight_search_sub_txt">
                                <span class="flight_search_date">${list.departureTime} ~ ${list.arrivalTime}</span>
                                <span class="flight_search_item">
                            <c:set value="0" var="count"></c:set>    
                            <c:if test="${list.adults > 0 }">
                                어른 
                                <c:set value="${list.adults}" var="count"></c:set>
                            </c:if>
                            <c:if test="${list.children > 0 }">
                                <c:set value="${count + list.children}" var="count"></c:set>
                            </c:if>
                            <c:if test="${list.infants > 0 }">
                            	<c:set value="${count + list.infants}" var="count"></c:set>
                            </c:if>
							<c:if test="${list.children > 0 or list.infants > 0}"> 외 </c:if><c:out value="${count}"></c:out>명 - ${list.travelClass}</span>
                            </li>
                        </ul>
                    </div>
                </c:forEach>
                <!-- 여기까지 -->
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
                    <a href="#" class="bbanner-link">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_img_01.jpg" alt="항공 이미지_01"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">방콕</h5>
                                <div class="from_to_txt">서울 → 방콕</div>
                                <div class="flight_data_txt">
                                    <span class="startDate">2월 6일</span>
                                    ~
                                    2월 10일
                                </div>
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
                                <div class="flight_data_txt">
                                    <span class="startDate">2월 6일</span>
                                    ~
                                    2월 9일
                                </div>
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
                                <div class="flight_data_txt">
                                    <span class="startDate">2월 6일</span>
                                    ~
                                    2월 10일
                                </div>
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
                                <div class="flight_data_txt">
                                    <span class="startDate">2월 5일</span>
                                    ~
                                    2월 8일
                                </div>
                                <div class="price_transfer">
                                    <p class="flight_price">460,000원~</p>
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
                    <a href="#" class="bbanner-link">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_sale_img_01.jpg" alt="항공 이미지_01"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">제주</h5>
                                <div class="from_to_txt">서울 → 제주</div>
                                <div class="flight_data_txt"><span class="startDate">1월 9일</span>
                                    ~
                                    1월 9일
                                </div>
                                <div class="price_transfer">
                                    <p class="flight_price">25,900원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#" class="bbanner-link">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_sale_img_02.jpg" alt="항공 이미지_02"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">제주</h5>
                                <div class="from_to_txt">서울 → 제주</div>
                                <div class="flight_data_txt"><span class="startDate">1월 16일</span>
                                    ~
                                    1월 16일
                                </div>
                                <div class="price_transfer">
                                    <p class="flight_price">23,720원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#" class="bbanner-link">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_sale_img_03.jpg" alt="항공 이미지_03"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">제주</h5>
                                <div class="from_to_txt">서울 → 제주</div>
                                <div class="flight_data_txt"><span class="startDate">1월 23일
                                    ~
                                    1월 23일</span></div>
                                <div class="price_transfer">
                                    <p class="flight_price">23,720원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#" class="bbanner-link">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_sale_img_04.jpg" alt="항공 이미지_04"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">제주</h5>
                                <div class="from_to_txt">서울 → 제주</div>
                                <div class="flight_data_txt">
                                    <span class="startDate">1월 30일</span>
                                    ~
                                    1월 30일
                                </div>
                                <div class="price_transfer">
                                    <p class="flight_price">23,720원~</p>
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
                    <a href="#" class="bbanner-link">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_special_img_01.jpg" alt="항공 이미지_01"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">베트남</h5>
                                <div class="from_to_txt">서울 → 베트남</div>
                                <div class="flight_data_txt"><span class="startDate">12월 12일</span>
                                    ~
                                    12월 15일
                                </div>
                                <div class="price_transfer">
                                    <p class="flight_price">445,200원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#" class="bbanner-link">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_special_img_02.jpg" alt="항공 이미지_02"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">베트남</h5>
                                <div class="from_to_txt">서울 → 베트남</div>
                                <div class="flight_data_txt"><span class="startDate">12월 12일</span>
                                    ~
                                    12월 15일
                                </div>
                                <div class="price_transfer">
                                    <p class="flight_price">354,000원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#" class="bbanner-link">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_special_img_03.jpg" alt="항공 이미지_03"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">베트남</h5>
                                <div class="from_to_txt">서울 → 베트남</div>
                                <div class="flight_data_txt"><<span class="startDate">12월 12일</span>
                                    ~
                                    12월 15일
                                </div>
                                <div class="price_transfer">
                                    <p class="flight_price">345,700원~</p>
                                    <span>직항,경유 포함</span>
                                </div>
                            </li>
                        </ul>
                    </a>
                    <a href="#" class="bbanner-link">
                        <ul class="w3-white">
                            <li><img src="/images/flight_images/flight_special_img_04.jpg" alt="항공 이미지_04"></li>
                            <li class="flight_content">
                                <h5 class="flight_content_tit">베트남</h5>
                                <div class="from_to_txt">서울 → 베트남</div>
                                <div class="flight_data_txt">
                                    <span class="startDate">12월 12일</span>
                                    ~
                                    12월 15일
                                </div>
                                <div class="price_transfer">
                                    <p class="flight_price">345,700원~</p>
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
                    <c:forEach var="notice" items="${noticeList}">
                    <tbody>
                    <tr>
                        <td>
                            <span>${notice.title}</span>
                            <span>${notice.time()}</span>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>

                </table>

            </div>
        </div>
    </section>
    <!-- flight_banner -->
    <%-- 로딩페이지--%>
    <div class="loading">
        <div class="loading_bg">
            <div class="loading_form">
                <div class="loading_title">
                    <span class="loading_city" id="loadingOrigin1">서울</span>에서
                    <span class="loading_city" id="loadingDestination1">나리타</span>까지
                    <br><span id="roundOrOneway"></span>항공권을 찾고 있습니다.
                </div>
                <div style="border-top: 1px solid var(--basic_wh); border-bottom: 1px solid var(--basic_wh); margin-top: 2em;">
                    <div class="k1_fromto_wrap"
                         style="padding: 2em; display: flex; justify-content: space-between; font-size: x-large; width: auto;">
                        <div class="dep-arr dep" style="text-align: center; flex: 1;">
                            <p class="loading_city" id="loadingOrigin2">SEL</p>
                            <p class="city" id="loadingOrigin3">서울</p>
                            <p class="date"><h4 id="loadingDepartureDate">2023년 12월 12일</h4></p>
                        </div>
                        <div class="dep-arr"
                             style="flex: 1; display: flex; justify-content: center; align-items: center;">
                            <img src="../images/ico_from_to2.png" alt="이미지 설명" class="overlay-image">
                        </div>
                        <div class="dep-arr arr" style="text-align: center; flex: 1;">
                            <p class="loading_city" id="loadingDestination2">NRT</p>
                            <p class="city" id="loadingDestination3">나리타</p>
                            <p class="date"><h4 id="loadingArrivalDate">2023년 12월 15일</h4></p>
                        </div>
                    </div>
                </div>
                <div class="loading_ani">
                    <img src="../images/logo2.svg" class="animated-svg overlay-image" alt="이미지 설명">
                </div>
            </div>
        </div>
    </div>
</main>
</div>
</div>
<script>

    const oneWay = document.querySelector(".one_way");
    const datepicker = document.getElementById("datepicker");
    const datepicker2 = document.getElementById("datepicker2");
    const startDateInput = document.getElementById("startDate");
    const endDateInput = document.getElementById("endDate");

    function handleDateChange(selectedDates, dateStr, instance) {
        //로딩페이지 데이터 바인딩

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
            document.getElementById("roundOrOneway").textContent = "왕복 ";
            let originDate = document.getElementById("datepicker").value;
            let parsedDate = originDate.split(" ~ ");
            let depDate = parsedDate[0].split("-");
            let arrDate = parsedDate[1].split("-");

            document.getElementById("loadingDepartureDate").textContent = depDate[0] + '년 ' + depDate[1] + '월 ' + depDate[2] + '일';
            document.getElementById("loadingArrivalDate").textContent = arrDate[0] + '년 ' + arrDate[1] + '월 ' + arrDate[2] + '일';
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
        onChange: function (selectedDates, dateStr, instance) {
            document.getElementById("roundOrOneway").textContent = "편도 ";
            let originDate = document.getElementById("datepicker2").value;
            let parsedDate = originDate.split("-");
            document.getElementById("loadingDepartureDate").textContent = parsedDate[0] + '년 ' + parsedDate[1] + '월 ' + parsedDate[2] + '일';
            document.getElementById("loadingArrivalDate").textContent = parsedDate[0] + '년 ' + parsedDate[1] + '월 ' + parsedDate[2] + '일';
        },
    });
    // 날짜 라이브러리
    //
    let tripRound = document.querySelector(".round");
    let tripOneWay = document.querySelector(".one_way");
    let tripRoundDate = document.querySelector(".trip_round");
    let tripOneWayDate = document.querySelector(".trip_one_way");
    tripRound.addEventListener("click", () => {
        tripRoundDate.style.display = "block";
        tripRound.style.color = "var(--primary_02)";
        tripOneWayDate.style.display = "none";
        tripOneWay.style.color = "var(--basic_bl)";

    })
    tripOneWay.addEventListener("click", () => {
        tripOneWayDate.style.display = "block";
        tripRound.style.color = "var(--basic_bl)";
        tripRoundDate.style.display = "none";
        tripOneWay.style.color = "var(--primary_02)";
    })

    // 왕복 편도

    function getCities(event) {
    }

    // 로딩페이지 뒤로가기 눌리면 안됨ㅠㅠ
    $(document).ready(function () {
        // 초기에는 로딩 페이지를 숨깁니다.
        $(".loading").hide();

        // 폼이 제출될 때 로딩 페이지를 표시합니다.
        $("form").submit(function () {
            $(".loading").show();
        });

    });

    // 비동기 요청이 완료되면 로딩 페이지를 숨깁니다.
    $(document).ajaxStop(function () {
        $(".loading").hide();
    });

    document.addEventListener('DOMContentLoaded', function () {
        // a 태그를 찾아 클릭 이벤트를 추가
        var flightLinks = document.querySelectorAll('.bbanner-link');

        flightLinks.forEach(function (flightLink) {
            flightLink.addEventListener('click', function (event) {
                // 클릭 이벤트가 발생했을 때 실행될 코드
                event.preventDefault(); // 기본 동작 방지

                // 가져올 값들을 클릭된 a 태그에서 찾아옴
                var origin = 'ICN';
                var destinationName = flightLink.querySelector('.flight_content_tit');

                // 확인: destinationName이 null이 아닌지 체크
                if (destinationName) {
                    destinationName = destinationName.innerText;
                } else {
                    console.error('Destination name element not found.');
                    return;
                }

                if (destinationName === '방콕') {
                    destination = 'BKK';
                } else if (destinationName === '도쿄') {
                    destination = 'NRT';
                } else if (destinationName === '다낭') {
                    destination = 'DAD';
                } else if (destinationName === '대만') {
                    destination = 'TPE';
                } else if (destinationName === '제주') {
                    destination = 'CJU';
                } else if (destinationName === '베트남') {
                    destination = 'DAD';
                } else {
                    // 기본값 설정
                    destination = 'BKK';
                }

                console.log("목적지 : " + destination);

                var adults = '1';
                var children = '0';
                var infants = '0';
                var travelClass = '일반석';
                var nonStop = 'false';
                // 날짜 포맷 변경 함수
                // var datepicker = '2024-02-06';

                var startDateElement = flightLink.querySelector('.startDate');
                var datepicker = formatDate(startDateElement.innerText);

                function formatDate(dateString) {
                    // '2월 6일' 형식의 문자열을 '2024-02-06' 형식으로 변환
                    var match = dateString.match(/(\d{1,2})월 (\d{1,2})일/);

                    if (!match || match.length !== 3) {
                        console.error('Invalid date format:', dateString);
                        return null;
                    }

                    var month = match[1].padStart(2, '0');
                    var day = match[2].padStart(2, '0');

                    return '2024-' + month + '-' + day;
                }

                console.log('변환된 날짜:', datepicker);

                // form의 각 input에 값을 할당
                document.getElementById('origin').value = origin;
                document.getElementById('destination').value = destination;
                document.getElementById('adults').value = adults;
                document.getElementById('children').value = children;
                document.getElementById('infants').value = infants;
                document.getElementById('travelClass').value = travelClass;
                document.getElementById('nonStop').value = nonStop;
                document.getElementById('datepicker').value = datepicker;
                console.log("날짜 : " + datepicker);
                // form submit
                document.querySelector('.from_to_form').submit();
            });
        });
    });


</script>
<script src="/js/make_element.js"></script>
<script src="/js/main.js"></script>
<!-- header.jsp -->
<%@ include file="layout/footer.jsp" %>