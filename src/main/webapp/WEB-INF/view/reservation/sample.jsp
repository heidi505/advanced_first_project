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
                    <span><a class="back_button" href="">👈검색 결과로 돌아가기</a></span>
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
                                <c:choose>
                                    <c:when test="${isRound == 1}">
                                        <div class="preview_form_margint">
                                            <div>
                                                <div class="preview_form_marginb">
                                                    <h4>
                                                        <span class="btn-primary preview_btn_to_form m15">가는편</span>
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
                                                            <div class=" preview_li_box_top">
                                                                <div class="preview_li_box_form">
                                                                    <span>
                                                                        <img src="/images/airline_images/${ticket.itineraries[0].segments[0].carrierCode}.png"
                                                                             class="preview_airport_img">
                                                                    </span>
                                                                    <span>${ticket.itineraries[0].segments[0].airlineName}</span>
                                                                </div>
                                                                <div class="preview_li_box_div">
                                                                    <span class="preview_li_box_span">${ticket.itineraries[0].segments[0].departure.time()}</span>
                                                                    <span class="preview_li_box_span">${ticket.itineraries[0].segments[0].departure.iataCode}</span>
                                                                </div>
                                                                <div class="preview_li_box_div">
                                                                    <span class="preview_li_box_span"><img
                                                                            src="/images/ico_via_01.png"></span>
                                                                    <span class="preview_li_box_span">${ticket.itineraries[0].duration}</span>
                                                                </div>
                                                                <div class="preview_li_box_div">
                                                                    <span class="preview_li_box_span">${ticket.itineraries[0].segments[0].arrival.time()}</span>
                                                                    <span class="preview_li_box_span">${ticket.itineraries[0].segments[0].arrival.iataCode}</span>
                                                                </div>
                                                                <div class="preview_li_box_div">
                                                                    <span class="preview_li_box_span">직항</span>
                                                                </div>
                                                            </div>

                                                            <!-- 수하물 정보 -->
                                                            <div>
                                                                <!-- 내용담길 박스 -->
                                                                <div class="preview_baggage">
                                                                    <!-- 왼쪽 화면 -->
                                                                    <div class="preview_baggage_left preview_baggage_set">
                                                                        <p>
                                                                            <span>${ticket.itineraries[0].segments[0].airlineName} ${ticket.itineraries[0].segments[0].number}</span>
                                                                        </p>
                                                                        <p class="preview_baggage_bottom">
                                                                            <span>🧳</span>
                                                                            <span>무료수화물 ${ticket.travelerPricings[0].fareDetailsBySegment[0].includedCheckedBags.choose()}</span>
                                                                        </p>
                                                                        <p>
                                                                            <span>🪑</span>
                                                                            <span>${ticket.travelerPricings[0].fareDetailsBySegment[0].cabin}</span>
                                                                        </p>
                                                                    </div>
                                                                    <!-- 오른쪽 화면 -->
                                                                    <div class="prview_baggage_right">
                                                                        <span>${ticket.itineraries[0].segments[0].departure.date()}</span>
                                                                    </div>
                                                                    <div>
                                                                        <span class="preview_baggage_line">
                                                                            <p>여</p>
                                                                            <p>.</p>
                                                                            <p>.</p>
                                                                            <p>정</p>
                                                                        </span>
                                                                    </div>
                                                                    <div class="preview_baggage_set">
                                                                        <p class="prview_baggage_rightm">
                                                                            <span class="preview_baggage_bold">${ticket.itineraries[0].segments[0].departure.time()}</span>
                                                                            <span>${ticket.itineraries[0].segments[0].departure.cityName} ${ticket.itineraries[0].segments[0].departure.iataCode}</span>
                                                                            <span class="preview_baggage_bold">T${ticket.itineraries[0].segments[0].departure.terminal}</span>
                                                                        </p>
                                                                        <p class="prview_baggage_rightm">
                                                                            <span class="preview_baggage_du">${ticket.itineraries[0].duration}</span>
                                                                        </p>
                                                                        <p>
                                                                            <span class="preview_baggage_bold">${ticket.itineraries[0].segments[0].arrival.time()}</span>
                                                                            <span>${ticket.itineraries[0].segments[0].arrival.cityName} ${ticket.itineraries[0].segments[0].arrival.iataCode}</span>
                                                                            <span class="preview_baggage_bold">T${ticket.itineraries[0].segments[0].arrival.terminal}</span>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="round" items="${ticket.roundTrip()}" varStatus="status">
                                            <c:forEach var="segment" items="${round.value.segments()}">
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
                                                                <div class="preview_li_box">
                                                                    <div class=" preview_li_box_top">
                                                                        <div class="preview_li_box_form">
                                                                            <span>
                                                                                <img src="/images/airline_images/${segment.carrierCode}.png"
                                                                                     class="preview_airport_img">
                                                                            </span>
                                                                            <span>${segment.airlineName} →</span>
                                                                        </div>
                                                                        <div class="preview_li_box_div">
                                                                            <span class="preview_li_box_span">${segment.departure.time()}</span>
                                                                            <span class="preview_li_box_span">${segment.departure.iataCode}</span>
                                                                        </div>
                                                                        <div class="preview_li_box_div">
                                                                            <span class="preview_li_box_span"><img
                                                                                    src="/images/ico_via_01.png"></span>
                                                                            <span class="preview_li_box_span">${round.value.duration}</span>
                                                                        </div>
                                                                        <div class="preview_li_box_div">
                                                                            <span class="preview_li_box_span">${segment.arrival.time()}</span>
                                                                            <span class="preview_li_box_span">${segment.arrival.iataCode}</span>
                                                                        </div>
                                                                        <span>직항</span>
                                                                    </div>
                                                                    <!-- 수하물 정보 -->
                                                                    <div>
                                                                        <!-- 내용담길 박스 -->
                                                                        <div class="preview_baggage">
                                                                            <!-- 왼쪽 화면 -->
                                                                            <div class="preview_baggage_left preview_baggage_set">
                                                                                <p>
                                                                                    <span>${segment.airlineName} ${segment.number}</span>
                                                                                </p>
                                                                                <p class="preview_baggage_bottom">
                                                                                    <span>🧳</span>
                                                                                    <span>무료수화물 ${ticket.travelerPricings[0].fareDetailsBySegment[0].includedCheckedBags.choose()}</span>
                                                                                </p>
                                                                                <p>
                                                                                    <span>🪑</span>
                                                                                    <span>${ticket.travelerPricings[0].fareDetailsBySegment[0].cabin}</span>
                                                                                </p>
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
                                                                            <div class="preview_baggage_set">
                                                                                <p class="prview_baggage_rightm">
                                                                                    <span class="preview_baggage_bold">${segment.departure.time()}</span>
                                                                                    <span>${segment.departure.cityName} ${segment.departure.iataCode}</span>
                                                                                    <span class="preview_baggage_bold">T${segment.departure.terminal}</span>
                                                                                </p>
                                                                                <p class="prview_baggage_rightm">
                                                                                    <span class="preview_baggage_du">${round.value.duration}</span>
                                                                                </p>
                                                                                <p>
                                                                                    <span class="preview_baggage_bold">${segment.arrival.time()}</span>
                                                                                    <span>${segment.arrival.cityName} ${segment.arrival.iataCode}</span>
                                                                                    <span class="preview_baggage_bold">T${segment.arrival.terminal}</span>
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:otherwise>

                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <!-- 오른쪽 금액 정보 -->
                    <div class="preview_price_form">
                        <!-- 예약 가격 확인 -->
                        <div>
                            <div>
                                <div class="preview_price_detail">
                                    <span class="preview_price_detailm">${ticket.itineraries[0].segments[0].departure.cityName}</span>
                                    <span class="preview_price_detailm">
                                    <img src="/images/ico_from_to_02.png"
                                         class="preview_price_img">
                                    </span>
                                    <span class="preview_price_detailm">${ticket.itineraries[0].segments[0].arrival.cityName} </span>
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
                                        <form method="GET" action="/detail/${ticket.id}">
                                            <button type="submit" class="btn btn-primary preview_price_btnw">항공권 예약하기</button>
                                        </form>
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
<script>
    const backButton = document.getElementsByClassName('back_button')[0];
    backButton.addEventListener('click',(e)=>{
        e.preventDefault();
        console.log('back');
        history.go(-1);
    });


</script>
<script src="js/javascript.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>