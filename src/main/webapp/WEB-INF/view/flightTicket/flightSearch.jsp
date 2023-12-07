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
                <form class="from_to_form">
                    <div class="form_to_area">
                        <div class="from_to_box">
                            <div class="from_to_select">
                                <div class="from_select">
                                    <button type="button" id="from_select_btn"
                                            class="common_modal_btn from_to_modal_btn" data-target="from_modal">
                                        <span class="from_code_value">GMP</span>
                                        <span class="from_airport_value">서울 김포</span>
                                    </button>
                                </div>
                                <button type="button" class="from_to_icon">
                                    <img src="/images/icons/transform_icon.svg" alt="전환" />
                                </button>
                                <div class="to_select">
                                    <button type="button" id="to_select_btn"
                                            class="common_modal_btn from_to_modal_btn" data-target="to_modal">
                                        <span class="to_code_value">BUS</span>
                                        <span class="to_airport_value">부산</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="ticket_date_field">
                            <label for="datepicker">출발지 & 도착지</label>
                            <input type="text" id="datepicker" placeholder="날짜 및 시간 선택" />
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
                </form>
            </div>
            <!-- 출발지 모달 -->
            <div class="common_modal from_to_modal" id="from_modal">
                        <span class="modal_close">
                            <img src="/images/icons/close.png" alt="닫기" />
                        </span>
                <div class="modal_title">
                    <h4>주요 도시 바로 선택</h4>
                </div>
                <div class="modal-content">
                    <div class="from_to_search">
                        <form class="d-flex">
                            <input class="form-control me-2" type="text" placeholder="검색어를 입력해주세요" />
                            <button class="btn btn-primary" type="submit">검색</button>
                        </form>
                    </div>
                    <form action="">
                        <div class="regions_cities_box">
                            <div>
                                <div class="regions">
                                    <ul class="regions_menu tab_menu">
                                        <li>
                                            <a href="#" data-tab="from_korea tab_active">대한민국</a>
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
                            <img src="/images/icons/close.png" alt="닫기" />
                        </span>
                <div class="modal_title">
                    <h4>주요 도시 바로 선택</h4>
                </div>
                <div class="modal-content">
                    <div class="from_to_search">
                        <form class="d-flex">
                            <input class="form-control me-2" type="text" placeholder="검색어를 입력해주세요" />
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
                                <img src="/images/icons/close.png" alt="닫기" />
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
                                                                         src="/images/icons/minus_icon.svg" alt="빼기"></button>
                                <span class="passenger_count count_num">2</span>
                                <button type="button" class="plus"><img class="plus_img"
                                                                        src="/images/icons/plus_icon.svg" alt="더하기"></button>
                            </div>
                        </div>
                        <div class="passenger_item">
                            <div class="common_sub_tit">
                                <h5>소아</h5>
                            </div>
                            <div class="passenger_count_btn">
                                <button type="button" class="minus"><img class="minus_img"
                                                                         src="/images/icons/minus_icon.svg" alt="빼기"></button>
                                <span class="passenger_count count_num">0</span>
                                <button type="button" class="plus"><img class="plus_img"
                                                                        src="/images/icons/plus_icon.svg" alt="더하기"></button>
                            </div>
                        </div>
                        <div class="passenger_item">
                            <div class="common_sub_tit">
                                <h5>유아</h5>
                            </div>
                            <div class="passenger_count_btn">
                                <button type="button" class="minus"><img class="minus_img"
                                                                         src="/images/icons/minus_icon.svg" alt="빼기"></button>
                                <span class="passenger_count count_num">0</span>
                                <button type="button" class="plus"><img class="plus_img"
                                                                        src="/images/icons/plus_icon.svg" alt="더하기"></button>
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
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>새벽 00:00 ~ 06:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>오전 06:00 ~ 12:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>오후 12:00 ~ 18:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>야간 18:00 ~ 24:00</span>
                            </li>
                        </ul>
                        <ul class="filter_item">
                            <li>
                                <p class="filter_tit">오는 날</p>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>새벽 00:00 ~ 06:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>오전 06:00 ~ 12:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>오후 12:00 ~ 18:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>야간 18:00 ~ 24:00</span>
                            </li>
                        </ul>
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
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>새벽 00:00 ~ 06:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>오전 06:00 ~ 12:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>오후 12:00 ~ 18:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>야간 18:00 ~ 24:00</span>
                            </li>
                        </ul>
                        <ul class="filter_item">
                            <li>
                                <p class="filter_tit">오는 날</p>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>새벽 00:00 ~ 06:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>오전 06:00 ~ 12:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>오후 12:00 ~ 18:00</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>야간 18:00 ~ 24:00</span>
                            </li>
                        </ul>
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
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>대한항공</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>네덜란드항공</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>에티하드 항공</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>핀에어</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>터키항공</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>폴란드항공</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>에어프랑스</span>
                            </li>
                        </ul>
                    </div>
                    <div class="flight_detail_box active departure_time">탑승객 조건
                        <a class="detail_arrow" href="#"><img src="/images/icons/icon_down.svg" alt="내리기"></a>
                    </div>
                    <div class="detail_more">
                        <ul class="filter_item">
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>성인</span>
                            </li>
                            <li>
                                <label class="check_box">
                                    <input type="checkbox">
                                    <span class="check_box_icon"></span>
                                </label>
                                <span>학생</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <section class="flight_search_right">
                <div class="flight_detail_wrap">
                    <div class="flight_detail_area">
                        <div class="flight_detail_cont">
                            <div class="flight_search_result active">
                                <ul class="flight_result_top">
                                    <li class="airline_icon">
                                                <span class="airline_icon_img"><img
                                                        src="/images/icons/airline_icon_05.png" alt="에어프랑스"></span>
                                        <span>에어프랑스</span>
                                    </li>
                                    <li>
                                        <div>
                                            <span class="airline_time">11:45</span>
                                            <span class="airline_arrow_icon">
                                                        <img src="/images/icons/my_trip_arrow.svg" alt="화살표">
                                                    </span>
                                            <span class="airline_time">22:25</span>
                                        </div>
                                        <div class="airline_txt">
                                            <span>ICN</span>
                                            <span class="airline_time_taken">19시간 10분</span>
                                            <span>BCN</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>1번 경유</div>
                                        <div class="airline_txt">02시간 40분 CDG</div>
                                    </li>
                                </ul>
                                <ul class="flight_result_btm">
                                    <li class="airline_icon">
                                                <span class="airline_icon_img"><img
                                                        src="/images/icons/airline_icon_05.png" alt="에어프랑스"></span>
                                        <span>에어프랑스</span>
                                    </li>
                                    <li>
                                        <div>
                                            <span class="airline_time">11:45</span>
                                            <span class="airline_arrow_icon">
                                                        <img src="/images/icons/my_trip_arrow.svg" alt="화살표">
                                                    </span>
                                            <span class="airline_time">22:25</span>
                                        </div>
                                        <div class="airline_txt">
                                            <span>ICN</span>
                                            <span class="airline_time_taken">19시간 10분</span>
                                            <span>BCN</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>1번 경유</div>
                                        <div class="airline_txt">02시간 40분 CDG</div>
                                    </li>
                                </ul>
                                <div class="detail_more_btn">
                                    <span>상세보기</span>
                                    <div class="detail_arrow"><img src="/images/icons/icon_down.svg">
                                    </div>
                                </div>
                            </div>
                            <ul class="flight_detail_price">
                                <li>
                                    <span class="remaining_seats">9석 남음</span>
                                </li>
                                <li>
                                    <a href="http://www.naver.com" class="reservation_price">1,001,200원
                                        <!-- <img src="/images/icons/detail_arrow.svg" alt="예약 상세보기">/ -->
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <ul class="detail_more">
                        <div class="detail_more_area">
                            <div class="detail_more_tit">
                                <div>
                                    <span class="go_label">가는 편</span>
                                    <span class="">서울 (ICN)</span>
                                    <span class="">ㅡ></span>
                                    <span class="">바르셀로나 (BCN)</span>
                                </div>
                                <span class="total_time"></span>
                            </div>
                            <ul class="detail_more_cont">
                                <li class="detail_distance">
                                    <div class="detail_country_name">
                                        <span>에어프랑스 0267</span>
                                    </div>
                                    <ul>
                                        <li class="detail_trip_date">
                                            <span>2월 13일</span>
                                        </li>
                                        <li class="detail_trip_cont">
                                            <p class="airline_time">11:45 <span>서울 ICN</span></p>
                                            <p>14시간 40분</p>
                                            <p>일반석 / 무료수하물 0개</p>
                                            <p class="airline_time">18:25 <span>파리 CDG</span></p>
                                        </li>
                                    </ul>
                                </li>
                                <li class="trip_waiting_time">
                                    ㅡ 23시간 40분 대기 브로츠와프 WRO ㅡ
                                </li>
                                <li class="detail_distance">
                                    <div class="detail_country_name">
                                        <span>에어프랑스 0267</span>
                                    </div>
                                    <ul>
                                        <li class="detail_trip_date">
                                            <span>2월 13일</span>
                                        </li>
                                        <li class="detail_trip_cont">
                                            <p class="airline_time">11:45 <span>서울 ICN</span></p>
                                            <p>14시간 40분</p>
                                            <p>일반석 / 무료수하물 0개</p>
                                            <p class="airline_time">18:25 <span>파리 CDG</span></p>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
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
                                    <tbody>
                                    <tr>
                                        <td>성인</td>
                                        <td>670,200원</td>
                                        <td>73,800원</td>
                                        <td>48,900원</td>
                                        <td>10,000원</td>
                                        <td>1명</td>
                                        <td>802,900원</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <ul class="detail_total_fee">
                                <li>
                                    <h4 class="detail_fee_tit">총 예상요금</h4>
                                </li>
                                <li>802,900원</li>
                            </ul>
                        </div>
                    </ul>
                </div>
                <div class="flight_detail_wrap">
                    <div class="flight_detail_area">
                        <div class="flight_detail_cont">
                            <div class="flight_search_result active">
                                <ul class="flight_result_top">
                                    <li class="airline_icon">
                                                <span class="airline_icon_img"><img
                                                        src="/images/icons/airline_icon_05.png" alt="에어프랑스"></span>
                                        <span>에어프랑스</span>
                                    </li>
                                    <li>
                                        <div>
                                            <span class="airline_time">11:45</span>
                                            <span class="airline_arrow_icon">
                                                        <img src="/images/icons/my_trip_arrow.svg" alt="화살표">
                                                    </span>
                                            <span class="airline_time">22:25</span>
                                        </div>
                                        <div class="airline_txt">
                                            <span>ICN</span>
                                            <span class="airline_time_taken">19시간 10분</span>
                                            <span>BCN</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>1번 경유</div>
                                        <div class="airline_txt">02시간 40분 CDG</div>
                                    </li>
                                </ul>
                                <ul class="flight_result_btm">
                                    <li class="airline_icon">
                                                <span class="airline_icon_img"><img
                                                        src="/images/icons/airline_icon_05.png" alt="에어프랑스"></span>
                                        <span>에어프랑스</span>
                                    </li>
                                    <li>
                                        <div>
                                            <span class="airline_time">11:45</span>
                                            <span class="airline_arrow_icon">
                                                        <img src="/images/icons/my_trip_arrow.svg" alt="화살표">
                                                    </span>
                                            <span class="airline_time">22:25</span>
                                        </div>
                                        <div class="airline_txt">
                                            <span>ICN</span>
                                            <span class="airline_time_taken">19시간 10분</span>
                                            <span>BCN</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>1번 경유</div>
                                        <div class="airline_txt">02시간 40분 CDG</div>
                                    </li>
                                </ul>
                                <div class="detail_more_btn">
                                    <span>상세보기</span>
                                    <div class="detail_arrow"><img src="/images/icons/icon_down.svg">
                                    </div>
                                </div>
                            </div>
                            <ul class="flight_detail_price">
                                <li>
                                    <span class="remaining_seats">9석 남음</span>
                                </li>
                                <li>
                                    <a href="http://www.naver.com" class="reservation_price">1,001,200원
                                        <!-- <img src="/images/icons/detail_arrow.svg" alt="예약 상세보기">/ -->
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <ul class="detail_more">
                        <div class="detail_more_area">
                            <div class="detail_more_tit">
                                <div>
                                    <span class="go_label">가는 편</span>
                                    <span class="">서울 (ICN)</span>
                                    <span class="">ㅡ></span>
                                    <span class="">바르셀로나 (BCN)</span>
                                </div>
                                <span class="total_time"></span>
                            </div>
                            <ul class="detail_more_cont">
                                <li class="detail_distance">
                                    <div class="detail_country_name">
                                        <span>에어프랑스 0267</span>
                                    </div>
                                    <ul>
                                        <li class="detail_trip_date">
                                            <span>2월 13일</span>
                                        </li>
                                        <li class="detail_trip_cont">
                                            <p class="airline_time">11:45 <span>서울 ICN</span></p>
                                            <p>14시간 40분</p>
                                            <p>일반석 / 무료수하물 0개</p>
                                            <p class="airline_time">18:25 <span>파리 CDG</span></p>
                                        </li>
                                    </ul>
                                </li>
                                <li class="trip_waiting_time">
                                    ㅡ 23시간 40분 대기 브로츠와프 WRO ㅡ
                                </li>
                                <li class="detail_distance">
                                    <div class="detail_country_name">
                                        <span>에어프랑스 0267</span>
                                    </div>
                                    <ul>
                                        <li class="detail_trip_date">
                                            <span>2월 13일</span>
                                        </li>
                                        <li class="detail_trip_cont">
                                            <p class="airline_time">11:45 <span>서울 ICN</span></p>
                                            <p>14시간 40분</p>
                                            <p>일반석 / 무료수하물 0개</p>
                                            <p class="airline_time">18:25 <span>파리 CDG</span></p>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
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
                                    <tbody>
                                    <tr>
                                        <td>성인</td>
                                        <td>670,200원</td>
                                        <td>73,800원</td>
                                        <td>48,900원</td>
                                        <td>10,000원</td>
                                        <td>1명</td>
                                        <td>802,900원</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <ul class="detail_total_fee">
                                <li>
                                    <h4 class="detail_fee_tit">총 예상요금</h4>
                                </li>
                                <li>802,900원</li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </section>
        </div>
    </div>
</main>
<script>
    let commonModal = document.querySelectorAll(".common_modal");
    let commonModalBtn = document.querySelectorAll(".common_modal_btn");
    let closeBtn = document.querySelectorAll(".modal_close");
    let checkBtn = document.querySelectorAll(".check_btn");

    commonModalBtn.forEach(function (button) {
        button.addEventListener("click", function () {
            let targetModalId = button.getAttribute("data-target");
            openModal(targetModalId);
        });
    });
    function openModal(modalId) {
        let modal = document.getElementById(modalId);
        modal.style.display = "block";
    }

    closeBtn.forEach(function (closeBtn) {
        closeBtn.addEventListener("click", function () {
            let parentModal = closeBtn.closest(".common_modal");
            parentModal.style.display = "none";
        });
    });

    checkBtn.forEach(function (checkBtn) {
        checkBtn.addEventListener("click", function () {
            let parentModal = checkBtn.closest(".common_modal");
            parentModal.style.display = "none";
        });
    });

    //  공통 모달

    const tabButtons = document.querySelectorAll(".tab_menu li a");
    const tabContents = document.querySelectorAll(".tab-content");

    tabButtons.forEach((button) => {
        button.addEventListener("click", function (event) {
            event.preventDefault();

            tabContents.forEach((content) => {
                content.style.display = "none";
            });

            tabButtons.forEach((btn) => {
                btn.classList.remove("tab_active");
            });

            const tabId = button.getAttribute("data-tab");
            document.getElementById(tabId).style.display = "block";

            button.classList.add("tab_active");
        });
    });

    //   도시 탭버튼

    let fromButtonIcon = document.querySelectorAll(".from_local_item button");
    let toButtonIcon = document.querySelectorAll(".to_local_item button");


    function valuesForm(airportCode, airportName) {
        let fromSelectButtons = document.querySelector("#from_select_btn");
        console.log("fromselectButton" + fromSelectButtons + " 야");
        fromSelectButtons.querySelector(".from_code_value").innerText = airportCode;
        fromSelectButtons.querySelector(".from_airport_value").innerText = airportName;
    }

    function valuesTo(airportCode, airportName) {
        let toSelectButtons = document.querySelector("#to_select_btn");
        console.log("to" + toSelectButtons + " 호");
        toSelectButtons.querySelector(".to_code_value").innerText = airportCode;
        toSelectButtons.querySelector(".to_airport_value").innerText = airportName;
    }

    fromButtonIcon.forEach(function (button, index) {
        button.addEventListener("click", function (event) {
            let fromAirportCode = button.querySelector(".from_local_code").innerText;
            let fromAirportName = button.querySelector(".from_local_airport").innerText;

            console.log(`Button ${index + 1} clicked: Code - ${fromAirportCode}, Name - ${fromAirportName}`);
            valuesForm(fromAirportCode, fromAirportName);
        });
    });

    toButtonIcon.forEach(function (button, index) {
        button.addEventListener("click", function (event) {
            let toAirportCode = button.querySelector(".to_local_code").innerText;
            let toAirportName = button.querySelector(".to_local_airport").innerText;

            console.log(`Button ${index + 1} clicked: Code - ${toAirportCode}, Name - ${toAirportName}`);
            valuesTo(toAirportCode, toAirportName);
        });
    });


    let flightSearchBg = document.querySelector(".flight_search_bg");
    console.log(flightSearchBg);

    let flightSearchClose = document.querySelectorAll(".flight_search_close");
    let flightSearchBox = document.querySelectorAll(".flight_search_box");
    let flightSearchBoxNum = flightSearchBox.length;

    Array.from(flightSearchClose).forEach((closeButton) => {
        console.log(closeButton);
        closeButton.addEventListener("click", () => {
            if (flightSearchBoxNum > 0) {
                flightSearchBox[flightSearchBoxNum - 1].style.display = "none";

                if (flightSearchBoxNum === 1) {
                    flightSearchBg.style.display = "none";
                }

                flightSearchBoxNum--;
            }
        });
    });

    // 최근 검색어 항목 삭제

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
<%@ include file="../layout/footer.jsp" %>
