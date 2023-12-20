<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>

<!-- TODO 여기서부터 main영역 -->
<main id="reservation_preview_page">
    <section class="reservation_preview_box">
        <div class="container">
            <!-- 기본 메세지 -->
            <section>
                <div class="p-1 border">
                    <span><a href="">👈검색 결과로 돌아가기</a></span>
                    <h3 class="preview_header"></h3>
                </div>
                <div class="p-3 text-white preview_title">
                <span>
                    <h2>훌륭한 선택을 하셨습니다! 지금 이 가격을 놓치지 마세요!</h2>
                </span>
                </div>
            </section>

            <!-- 왼쪽 항공편 정보 -->
            <section>
                <div class="preview_form">
                    <div class="preview_left_form">
                        <div>
                            <div class="preview_form_box">
                                <!-- 가는편 -->

                                <div class="preview_form_margint">
                                    <div>
                                        <div class="preview_form_marginb">
                                            <h4>
                                                <span class="btn-primary preview_btn_to_form">가는편</span>
                                                <strong>${ticket.itineraries[0].segments[0].departure.cityName}
                                                    (${ticket.itineraries[0].segments[0].departure.iataCode})</strong>
                                                <span class="preview_form_padding"> ✈ </span>
                                                <strong>${ticket.itineraries[0].segments[0].arrival.cityName}
                                                    (${ticket.itineraries[0].segments[0].arrival.iataCode})</strong>
                                                <span>${ticket.itineraries[0].segments[0].departure.date()}</span>
                                            </h4>
                                        </div>
                                        <ul>
                                            <li>
                                                <div class="preview_li_box">
                                                    <div>
                                                        <div class=" preview_li_box_top">
                                                        <span>
                                                            <img src="/images/airline_images/${ticket.itineraries[0].segments[0].carrierCode}.png"
                                                                 class="preview_airport_img">
                                                        </span>
                                                            <span>${ticket.itineraries[0].segments[0].airlineName} →</span>
                                                            <span>
                                                            <span>${ticket.itineraries[0].segments[0].departure.time()}<span>${ticket.itineraries[0].segments[0].departure.iataCode}</span></span>
                                                                <span>${ticket.itineraries[0].duration}</span>
                                                                <span>${ticket.itineraries[0].segments[0].arrival.time()}<span>${ticket.itineraries[0].segments[0].arrival.iataCode}</span></span>
                                                        </span>
                                                            <span>직항</span>
                                                        </div>
                                                    </div>
                                                    <!-- 수하물 정보 -->
                                                    <div>
                                                        <!-- 내용담길 박스 -->
                                                        <div class="preview_baggage">
                                                            <!-- 왼쪽 화면 -->
                                                            <div class="preview_baggage_left">
                                                                <div>
                                                                    <p>
                                                                        <span>에어라인 넘버</span>
                                                                    </p>
                                                                </div>
                                                                <div class="preview_form_margint">
                                                                    <p class="preview_baggage_bottom">
                                                                        <span>🧳</span>
                                                                        <span>무료수화물 첵백추스</span>
                                                                    </p>
                                                                    <p>
                                                                        <span>🪑</span>
                                                                        <span>카빈</span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <!-- 오른쪽 화면 -->
                                                            <div class="prview_baggage_right">
                                                                <span>도착날짜</span>
                                                            </div>
                                                            <div>
                                                        <span class="preview_baggage_line">
                                                            <p>여</p>
                                                            <p>.</p>
                                                            <p>.</p>
                                                            <p>정</p>
                                                        </span>
                                                            </div>
                                                            <div>
                                                                <p class="prview_baggage_rightm">
                                                                    <span class="">도착시간<span>도착도시 도시코드</span> T도착터미널</span>
                                                                </p>
                                                                <p class="prview_baggage_rightm">
                                                            <span>
                                                                <span>듀레이션</span>
                                                            </span>
                                                                </p>
                                                                <p>
                                                                    <span>출발시간<span>출발도시 도시코드</span>  T터미널</span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="preview_form_margint">
                                    <div>
                                        <div class="preview_form_marginb">
                                            <h4>
                                                <span class="btn-primary preview_btn_to_form">${round.key}</span>
                                                <strong>${segment.departure.cityName}
                                                    (${segment.departure.iataCode})</strong>
                                                <span class="preview_form_padding"> ✈ </span>
                                                <strong>${segment.arrival.cityName}(${segment.arrival.iataCode})</strong>
                                                <span>${segment.departure.date()}</span>
                                            </h4>
                                        </div>
                                        <ul>
                                            <li>
                                                <div class="preview_li_box" style="align-items: center">
                                                    <div class=" preview_li_box_top">
                                                        <div style="display: flex; align-items: center; margin-right: 50px;">
                                                            <span>
                                                                <img src="/images/airline_images/${segment.carrierCode}.png"
                                                                     class="preview_airport_img">
                                                            </span>
                                                            <span>제주항공</span>
                                                        </div>
                                                        <div style="display: inline-block; margin-right: 50px;">
                                                            <span style="display: block; text-align: center">21:10</span>
                                                            <span style="display: block; text-align: center">ICN</span>
                                                        </div>
                                                        <div style="display: inline-block; margin-right: 50px;">
                                                            <span style="display: block; text-align: center"><img src="/images/ico_via_01.png"></span>
                                                            <span style="display: block; text-align: center">6시간 15분</span>
                                                        </div>
                                                        <div style="display: inline-block; margin-right: 50px;">
                                                            <span style="display: block; text-align: center">01:25</span>
                                                            <span style="display: block; text-align: center">BKK</span>
                                                        </div>
                                                        <div style="display: inline-block; margin-right: 50px;">
                                                            <span style="display: block; text-align: center">직항</span>
                                                        </div>
                                                    </div>
                                                    <!-- 수하물 정보 -->
                                                    <div>
                                                        <!-- 내용담길 박스 -->
                                                        <div class="preview_baggage">
                                                            <!-- 왼쪽 화면 -->
                                                            <div class="preview_baggage_left">
                                                                <div>
                                                                    <p>
                                                                        <span>${segment.airlineName} ${segment.number}</span>
                                                                    </p>
                                                                </div>
                                                                <div class="preview_form_margint">
                                                                    <p class="preview_baggage_bottom">
                                                                        <span>🧳</span>
                                                                        <span>무료수화물 ${ticket.travelerPricings[0].fareDetailsBySegment[0].includedCheckedBags.choose()}</span>
                                                                    </p>
                                                                    <p>
                                                                        <span>🪑</span>
                                                                        <span>${ticket.travelerPricings[0].fareDetailsBySegment[0].cabin}</span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <!-- 오른쪽 화면 -->
                                                            <div class="prview_baggage_right">
                                                                <span>${segment.departure.date()}</span>
                                                            </div>
                                                            <div>
                                                        <span class="preview_baggage_line">
                                                            <p>여</p>
                                                            <p>.</p>
                                                            <p>.</p>
                                                            <p>정</p>
                                                        </span>
                                                            </div>
                                                            <div>
                                                                <p class="prview_baggage_rightm">
                                                                    <span class="">${segment.departure.time()}<span>${segment.departure.cityName} ${segment.departure.iataCode}</span> T${segment.departure.terminal}</span>

                                                                </p>
                                                                <p class="prview_baggage_rightm">
                                                            <span>
                                                                <span>${round.value.duration}</span>
                                                            </span>
                                                                </p>
                                                                <p>
                                                                    <span>${segment.arrival.time()}<span>${segment.arrival.cityName} ${segment.arrival.iataCode}</span>  T${segment.arrival.terminal}</span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- 오른쪽 금액 정보 -->
                    <div class="preview_price_form">
                        <!-- 예약 가격 확인 -->
                        <div>
                            <div>
                                <div class="preview_price_detail">
                                <span>${ticket.itineraries[0].segments[0].departure.cityName}
                                    <img src="../images/ico_from_to_02.png"
                                         class="preview_price_img">${ticket.itineraries[0].segments[0].arrival.cityName}
                                </span>
                                </div>
                                <div class="preview_price_line">${ticket.itineraries[0].segments[0].departure.date()}
                                    - ${ticket.itineraries[0].segments[0].arrival.date()} ·
                                    승객 ${ticket.travelerPricings.size()}명
                                </div>
                                <div>
                                    <!-- 요금표 -->

                                    <div>
                                        <h2 class="preview_price_line">
                                            <a>
                                                <string>${ticket.adultAnd()}</string>
                                            </a>
                                        </h2>
                                        <div class="preview_price_line">
                                            <table>
                                                <colgroup>
                                                    <col style="width: 40%;">
                                                    <col style="width: 30%;">
                                                    <col style="width: 30%;">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <td>항공요금</td>
                                                    <td>${ticket.travelerPricings.size()}</td>
                                                    <td>${ticket.price.base}</td>
                                                </tr>
                                                <tr>
                                                    <td>유류할증료</td>
                                                    <td>${ticket.travelerPricings.size()}</td>
                                                    <td>${ticket.price.oilPrice}</td>
                                                </tr>
                                                <tr>
                                                    <td>제세공과금</td>
                                                    <td>${ticket.travelerPricings.size()}</td>
                                                    <td>${ticket.price.oilPrice}</td>
                                                </tr>
                                                <tr>
                                                    <td>발권수수료</td>
                                                    <td>${ticket.travelerPricings.size()}</td>
                                                    <td>${ticket.price.fee}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="preview_price_line">
                                            <table>
                                                <colgroup>
                                                    <col style="width: 40%;">
                                                    <col style="width: 30%;">
                                                    <col style="width: 30%;">
                                                </colgroup>
                                                <tfoot>
                                                <tr>
                                                    <td>성인 총 요금</td>
                                                    <td></td>
                                                    <td>${ticket.price.grandTotal}</td>
                                                </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- 성인요금 -->
                                    <div class="preview_price_total">
                                        <div>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <h2 class="preview_price_total2">총 요금</h2>
                                                <td></td>
                                                <td></td>
                                                </td>
                                                <td>
                                                <td><span class="preview_price_tax">세금 및 수수료 포함</span>
                                                </td>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </div>
                                        <div>
                                            <b class="preview_price_marginr">${ticket.price.grandTotal}<span>원</span></b>
                                        </div>
                                    </div>
                                    <div class="preview_price_btn">
                                        <div class="btn btn-primary preview_price_btnw">
                                            항공권 예약하기
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </section>

</main>

</div>
</div>
</div>
<script src="js/javascript.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>