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
                <form class="from_to_form">
                    <div class="from_to_form_box">
                        <ul class="round_trip_one_way">
                            <li>
                                <button type="button" class="distance_form_btn">왕복</button>
                            </li>
                            <li>
                                <button type="button">편도</button>
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
                                    <button type="button" class="from_to_icon">
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
                                <label for="datepicker">출발지 & 도착지</label>
                                <input type="text" id="datepicker" placeholder="날짜 및 시간 선택"/>
                            </div>
                            <div class="passenger_seat_field">
                                <span class="passenger_seat_title">탑승객 & 좌석</span>
                                <div>
                                    <button type="button" class="common_modal_btn passenger_seat_btn"
                                            data-target="passenger_seat_modal">
                                        <span>승객1명</span>
                                        <span>일반석</span>
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
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="from_local_code">SEL</span><span
                                                            class="from_local_airport">서울</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="from_local_code">GMP</span><span
                                                            class="from_local_airport">김포</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="from_local_code">CJU</span><span
                                                            class="from_local_airport">제주</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="from_local_code">KWJ</span><span
                                                            class="from_local_airport">광주</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="from_local_code">TAE</span><span
                                                            class="from_local_airport">대구</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="from_local_code">CJJ</span><span
                                                            class="from_local_airport">청주</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="from_local_code">RSU</span><span
                                                            class="from_local_airport">여수</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 대한민국  -->
                                    <div class="cities tab-content regions_list_item" id="from_japan">
                                        <div class="cities_list">
                                            <ul class="from_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="TYO">
                                                        <span class="from_local_code">TYO</span><span
                                                            class="from_local_airport">도쿄</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="OSA">
                                                        <span class="from_local_code">OSA</span><span
                                                            class="from_local_airport">오사카</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="FUK">
                                                        <span class="from_local_code">FUK</span><span
                                                            class="from_local_airport">후쿠오카</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SPK">
                                                        <span class="from_local_code">SPK</span><span
                                                            class="from_local_airport">삿포로</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="OKA">
                                                        <span class="from_local_code">OKA</span><span
                                                            class="from_local_airport">오키나와</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="NGO">
                                                        <span class="from_local_code">NGO</span><span
                                                            class="from_local_airport">나고야</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="KMJ">
                                                        <span class="from_local_code">KMJ</span><span
                                                            class="from_local_airport">구마모토</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="KKJ">
                                                        <span class="from_local_code">KKJ</span><span
                                                            class="from_local_airport">기타큐슈</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 일본 -->
                                    <div class="cities tab-content regions_list_item" id="from_asia">
                                        <div class="cities_list">
                                            <ul class="from_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="BKK">
                                                        <span class="from_local_code">BKK</span><span
                                                            class="from_local_airport">방콕/수완나품</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="DAD">
                                                        <span class="from_local_code">DAD</span><span
                                                            class="from_local_airport">다낭</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SGN">
                                                        <span class="from_local_code">SGN</span><span
                                                            class="from_local_airport">호치민</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="MNL">
                                                        <span class="from_local_code">MNL</span><span
                                                            class="from_local_airport">마닐라</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CXR">
                                                        <span class="from_local_code">CXR</span><span
                                                            class="from_local_airport">나트랑</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CEB">
                                                        <span class="from_local_code">CEB</span><span
                                                            class="from_local_airport">세부</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SIN">
                                                        <span class="from_local_code">SIN</span><span
                                                            class="from_local_airport">싱가포르</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CNX">
                                                        <span class="from_local_code">CNX</span><span
                                                            class="from_local_airport">치앙마이</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="BKI">
                                                        <span class="from_local_code">BKI</span><span
                                                            class="from_local_airport">코타키나발루</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="HKT">
                                                        <span class="from_local_code">HKT</span><span
                                                            class="from_local_airport">푸껫</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="HAN">
                                                        <span class="from_local_code">HAN</span><span
                                                            class="from_local_airport">하노이</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 아시아 -->
                                    <div class="cities tab-content regions_list_item" id="from_americas">
                                        <div class="cities_list">
                                            <ul class="from_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="NYC">
                                                        <span class="from_local_code">NYC</span><span
                                                            class="from_local_airport">뉴욕</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="DFW">
                                                        <span class="from_local_code">DFW</span><span
                                                            class="from_local_airport">댈러스</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="LAS">
                                                        <span class="from_local_code">LAS</span><span
                                                            class="from_local_airport">라스베이거스</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="LAX">
                                                        <span class="from_local_code">LAX</span><span
                                                            class="from_local_airport">로스엔젤레스</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="YVR">
                                                        <span class="from_local_code">YVR</span><span
                                                            class="from_local_airport">밴쿠버</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SFO">
                                                        <span class="from_local_code">SFO</span><span
                                                            class="from_local_airport">샌프란시스코</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="YTO">
                                                        <span class="from_local_code">YTO</span><span
                                                            class="from_local_airport">토론토</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="HNL">
                                                        <span class="from_local_code">HNL</span><span
                                                            class="from_local_airport">호놀룰루(하와이)</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 미주 -->
                                    <div class="cities tab-content regions_list_item" id="from_europe">
                                        <div class="cities_list">
                                            <ul class="from_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="LON">
                                                        <span class="from_local_code">LON</span><span
                                                            class="from_local_airport">런던</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="ROM">
                                                        <span class="from_local_code">ROM</span><span
                                                            class="from_local_airport">로마</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="BCN">
                                                        <span class="from_local_code">BCN</span><span
                                                            class="from_local_airport">바르셀로나</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="AMS">
                                                        <span class="from_local_code">AMS</span><span
                                                            class="from_local_airport">암스테르담</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="BUD">
                                                        <span class="from_local_code">BUD</span><span
                                                            class="from_local_airport">부다페스트</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="IST">
                                                        <span class="from_local_code">IST</span><span
                                                            class="from_local_airport">이스탄불</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="PAR">
                                                        <span class="from_local_code">PAR</span><span
                                                            class="from_local_airport">파리</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="PRG">
                                                        <span class="from_local_code">PRG</span><span
                                                            class="from_local_airport">프라하</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 유럽 -->
                                    <div class="cities tab-content regions_list_item" id="from_oceania_guam">
                                        <div class="cities_list">
                                            <ul class="from_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="GUM">
                                                        <span class="from_local_code">GUM</span><span
                                                            class="from_local_airport">괌</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="MEL">
                                                        <span class="from_local_code">MEL</span><span
                                                            class="from_local_airport">멜버른</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SYD">
                                                        <span class="from_local_code">SYD</span><span
                                                            class="from_local_airport">시드니</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SPN">
                                                        <span class="from_local_code">SPN</span><span
                                                            class="from_local_airport">사이판</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 대양주/괌 -->
                                    <div class="cities tab-content regions_list_item" id="from_middle_east">
                                        <div class="cities_list">
                                            <ul class="from_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="AUH">
                                                        <span class="from_local_code">AUH</span><span
                                                            class="from_local_airport">아부다비</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="TLV">
                                                        <span class="from_local_code">TLV</span><span
                                                            class="from_local_airport">텔아비브</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="DOH">
                                                        <span class="from_local_code">DOH</span><span
                                                            class="from_local_airport">도하</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="DXB">
                                                        <span class="from_local_code">DXB</span><span
                                                            class="from_local_airport">두바이</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 중동 -->
                                    <div class="cities tab-content regions_list_item" id="from_latin_america">
                                        <div class="cities_list">
                                            <ul class="from_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SAO">
                                                        <span class="from_local_code">SAO</span><span
                                                            class="from_local_airport">상파울로</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CUN">
                                                        <span class="from_local_code">CUN</span><span
                                                            class="from_local_airport">칸쿤</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SCL">
                                                        <span class="from_local_code">SCL</span><span
                                                            class="from_local_airport">산티아고</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="HAV">
                                                        <span class="from_local_code">HAV</span><span
                                                            class="from_local_airport">하바나</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 중남미 -->
                                    <div class="cities tab-content regions_list_item" id="from_africa">
                                        <div class="cities_list">
                                            <ul class="from_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="NBO">
                                                        <span class="from_local_code">NBO</span><span
                                                            class="from_local_airport">나이로비</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CPT">
                                                        <span class="from_local_code">CPT</span><span
                                                            class="from_local_airport">케이프타운</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CAI">
                                                        <span class="from_local_code">CAI</span><span
                                                            class="from_local_airport">카이로</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="MRU">
                                                        <span class="from_local_code">MRU</span><span
                                                            class="from_local_airport">모리셔스</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 아프리카 -->
                                    <div class="cities tab-content regions_list_item" id="from_china">
                                        <div class="cities_list">
                                            <ul class="from_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="BJS">
                                                        <span class="from_local_code">BJS</span><span
                                                            class="from_local_airport">북경</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="PVG">
                                                        <span class="from_local_code">PVG</span><span
                                                            class="from_local_airport">상해/푸동</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="TAO">
                                                        <span class="from_local_code">TAO</span><span
                                                            class="from_local_airport">청도</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CTU">
                                                        <span class="from_local_code">CTU</span><span
                                                            class="from_local_airport">성도/솽류</span>
                                                    </button>
                                                </li>
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
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="to_local_code">SEL</span><span
                                                            class="to_local_airport">서울</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="to_local_code">GMP</span><span
                                                            class="to_local_airport">김포</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="to_local_code">CJU</span><span
                                                            class="to_local_airport">제주</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="to_local_code">KWJ</span><span
                                                            class="to_local_airport">광주</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="to_local_code">TAE</span><span
                                                            class="to_local_airport">대구</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="to_local_code">CJJ</span><span
                                                            class="to_local_airport">청주</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false">
                                                        <span class="to_local_code">RSU</span><span
                                                            class="to_local_airport">여수</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 대한민국  -->
                                    <div class="cities tab-content regions_list_item" id="to_japan">
                                        <div class="cities_list">
                                            <ul class="to_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="TYO">
                                                        <span class="to_local_code">TYO</span><span
                                                            class="to_local_airport">도쿄</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="OSA">
                                                        <span class="to_local_code">OSA</span><span
                                                            class="to_local_airport">오사카</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="FUK">
                                                        <span class="to_local_code">FUK</span><span
                                                            class="to_local_airport">후쿠오카</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SPK">
                                                        <span class="to_local_code">SPK</span><span
                                                            class="to_local_airport">삿포로</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="OKA">
                                                        <span class="to_local_code">OKA</span><span
                                                            class="to_local_airport">오키나와</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="NGO">
                                                        <span class="to_local_code">NGO</span><span
                                                            class="to_local_airport">나고야</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="KMJ">
                                                        <span class="to_local_code">KMJ</span><span
                                                            class="to_local_airport">구마모토</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="KKJ">
                                                        <span class="to_local_code">KKJ</span><span
                                                            class="to_local_airport">기타큐슈</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 일본 -->
                                    <div class="cities tab-content regions_list_item" id="to_asia">
                                        <div class="cities_list">
                                            <ul class="to_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="BKK">
                                                        <span class="to_local_code">BKK</span><span
                                                            class="to_local_airport">방콕/수완나품</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="DAD">
                                                        <span class="to_local_code">DAD</span><span
                                                            class="to_local_airport">다낭</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SGN">
                                                        <span class="to_local_code">SGN</span><span
                                                            class="to_local_airport">호치민</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="MNL">
                                                        <span class="to_local_code">MNL</span><span
                                                            class="to_local_airport">마닐라</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CXR">
                                                        <span class="to_local_code">CXR</span><span
                                                            class="to_local_airport">나트랑</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CEB">
                                                        <span class="to_local_code">CEB</span><span
                                                            class="to_local_airport">세부</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SIN">
                                                        <span class="to_local_code">SIN</span><span
                                                            class="to_local_airport">싱가포르</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CNX">
                                                        <span class="to_local_code">CNX</span><span
                                                            class="to_local_airport">치앙마이</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="BKI">
                                                        <span class="to_local_code">BKI</span><span
                                                            class="to_local_airport">코타키나발루</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="HKT">
                                                        <span class="to_local_code">HKT</span><span
                                                            class="to_local_airport">푸껫</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="HAN">
                                                        <span class="to_local_code">HAN</span><span
                                                            class="to_local_airport">하노이</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 아시아 -->
                                    <div class="cities tab-content regions_list_item" id="to_americas">
                                        <div class="cities_list">
                                            <ul class="to_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="NYC">
                                                        <span class="to_local_code">NYC</span><span
                                                            class="to_local_airport">뉴욕</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="DFW">
                                                        <span class="to_local_code">DFW</span><span
                                                            class="to_local_airport">댈러스</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="LAS">
                                                        <span class="to_local_code">LAS</span><span
                                                            class="to_local_airport">라스베이거스</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="LAX">
                                                        <span class="to_local_code">LAX</span><span
                                                            class="to_local_airport">로스엔젤레스</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="YVR">
                                                        <span class="to_local_code">YVR</span><span
                                                            class="to_local_airport">밴쿠버</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SFO">
                                                        <span class="to_local_code">SFO</span><span
                                                            class="to_local_airport">샌프란시스코</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="YTO">
                                                        <span class="to_local_code">YTO</span><span
                                                            class="to_local_airport">토론토</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="HNL">
                                                        <span class="to_local_code">HNL</span><span
                                                            class="to_local_airport">호놀룰루(하와이)</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 미주 -->
                                    <div class="cities tab-content regions_list_item" id="to_europe">
                                        <div class="cities_list">
                                            <ul class="to_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="LON">
                                                        <span class="to_local_code">LON</span><span
                                                            class="to_local_airport">런던</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="ROM">
                                                        <span class="to_local_code">ROM</span><span
                                                            class="to_local_airport">로마</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="BCN">
                                                        <span class="to_local_code">BCN</span><span
                                                            class="to_local_airport">바르셀로나</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="AMS">
                                                        <span class="to_local_code">AMS</span><span
                                                            class="to_local_airport">암스테르담</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="BUD">
                                                        <span class="to_local_code">BUD</span><span
                                                            class="to_local_airport">부다페스트</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="IST">
                                                        <span class="to_local_code">IST</span><span
                                                            class="to_local_airport">이스탄불</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="PAR">
                                                        <span class="to_local_code">PAR</span><span
                                                            class="to_local_airport">파리</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="PRG">
                                                        <span class="to_local_code">PRG</span><span
                                                            class="to_local_airport">프라하</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 유럽 -->
                                    <div class="cities tab-content regions_list_item" id="to_oceania_guam">
                                        <div class="cities_list">
                                            <ul class="to_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="GUM">
                                                        <span class="to_local_code">GUM</span><span
                                                            class="to_local_airport">괌</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="MEL">
                                                        <span class="to_local_code">MEL</span><span
                                                            class="to_local_airport">멜버른</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SYD">
                                                        <span class="to_local_code">SYD</span><span
                                                            class="to_local_airport">시드니</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SPN">
                                                        <span class="to_local_code">SPN</span><span
                                                            class="to_local_airport">사이판</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 대양주/괌 -->
                                    <div class="cities tab-content regions_list_item" id="to_middle_east">
                                        <div class="cities_list">
                                            <ul class="to_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="AUH">
                                                        <span class="to_local_code">AUH</span><span
                                                            class="to_local_airport">아부다비</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="TLV">
                                                        <span class="to_local_code">TLV</span><span
                                                            class="to_local_airport">텔아비브</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="DOH">
                                                        <span class="to_local_code">DOH</span><span
                                                            class="to_local_airport">도하</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="DXB">
                                                        <span class="to_local_code">DXB</span><span
                                                            class="to_local_airport">두바이</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 중동 -->
                                    <div class="cities tab-content regions_list_item" id="to_latin_america">
                                        <div class="cities_list">
                                            <ul class="to_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SAO">
                                                        <span class="to_local_code">SAO</span><span
                                                            class="to_local_airport">상파울로</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CUN">
                                                        <span class="to_local_code">CUN</span><span
                                                            class="to_local_airport">칸쿤</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="SCL">
                                                        <span class="to_local_code">SCL</span><span
                                                            class="to_local_airport">산티아고</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="HAV">
                                                        <span class="to_local_code">HAV</span><span
                                                            class="to_local_airport">하바나</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 중남미 -->
                                    <div class="cities tab-content regions_list_item" id="to_africa">
                                        <div class="cities_list">
                                            <ul class="to_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="NBO">
                                                        <span class="to_local_code">NBO</span><span
                                                            class="to_local_airport">나이로비</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CPT">
                                                        <span class="to_local_code">CPT</span><span
                                                            class="to_local_airport">케이프타운</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CAI">
                                                        <span class="to_local_code">CAI</span><span
                                                            class="to_local_airport">카이로</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="MRU">
                                                        <span class="to_local_code">MRU</span><span
                                                            class="to_local_airport">모리셔스</span>
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 아프리카 -->
                                    <div class="cities tab-content regions_list_item" id="to_china">
                                        <div class="cities_list">
                                            <ul class="to_local_item">
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="BJS">
                                                        <span class="to_local_code">BJS</span><span
                                                            class="to_local_airport">북경</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="PVG">
                                                        <span class="to_local_code">PVG</span><span
                                                            class="to_local_airport">상해/푸동</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="TAO">
                                                        <span class="to_local_code">TAO</span><span
                                                            class="to_local_airport">청도</span>
                                                    </button>
                                                </li>
                                                <li class="local_item">
                                                    <button type="button" aria-disabled="false" value="CTU">
                                                        <span class="to_local_code">CTU</span><span
                                                            class="to_local_airport">성도/솽류</span>
                                                    </button>
                                                </li>
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
                                    <span class="passenger_count count_num">2</span>
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
                                    <span class="passenger_count count_num">0</span>
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
                                    <span class="passenger_count count_num">0</span>
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
    const datepicker = document.getElementById("datepicker");
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
<script src="/js/javascript.js"></script>
<!-- header.jsp -->
<%@ include file="layout/footer.jsp" %>