<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>


<!-- TODO 여기서부터 main영역 -->

<main id="my_travel_page">
    <section class="my_travel">
        <div class="nav_container">
            <article>
                <div class="my_travel_box">
                    <div class="my_travel_tab">
                        <h2><b>내 여행</b></h2>
                        <ul class="my_travel_menu tab_menu">
                            <li>
                                <a href="#" data-tab="planned_trip" class="tab_active ">예정된 여행</a>
                            </li>
                            <li>
                                <a href="#" data-tab="last_trip" class="">지난 여행</a>
                            </li>
                            <li>
                                <a href="#" data-tab="canceled_trip" class="">취소된 여행</a>
                            </li>
                        </ul>
                    </div>
                    <div class="my_travel_tab_content">
                        <div class="tab-content" id="planned_trip">
                            <div class="my_trip_count_label">
                                전체 <span class="my_trip_num">2</span>
                            </div>
                            <div class="trip_year">2023년</div>
                            <div class="my_trip_list">
                            <c:forEach var="list" items="${tripList}">
                                <div class="my_trip_box">
                                    <span class="trip_day">12월 05일 ( 화 )</span>
                                    <ul class="my_trip_item">
                                        <li class="my_trip_content">
                                            <ul class="my_trip_content_top">
                                                <li><span class="before_payment_label">
                                                <c:choose>
                                                <c:when test="${list.isPayed eq true}">
                                                결제됨
                                                </c:when>
                                                <c:otherwise>
                                                결제전
                                                </c:otherwise>
                                                </c:choose>
                                                </span></li>
                                                <li><a href="#">예약 상세 보기 <img src="/images/icons/detail_arrow.svg"
                                                                              alt="예약 상세보기"> </a>
                                                </li>
                                            </ul>
                                            <ul class="my_trip_content_mid">
                                                <li class="my_trip_content_tit">
                                                    <div class="airline_icon_img">
                                                        <img src="/images/icons/airline_icon_02.png" alt="제주항공">
                                                    </div>
                                                    <div>
                                                        <p> [제주항공] 부산 - 도쿄/나리타</p>
                                                        <p>예약번호 ${list.reservationNum}</p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="my_trip_ticket_img">
                                                        <div class="my_trip_ticket_bg">
                                                            <span class="trip_left">PUS</span>
                                                            <span class="trip_right">NRT</span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="my_trip_content_btm">
                                                <li>
                                                    <p>제주항공</p>
                                                    <p>7C1154</p>
                                                </li>
                                                <li>
                                                    <p>11:05</p>
                                                    <p>PUS</p>
                                                </li>
                                                <li>
                                                    <img src="/images/icons/my_trip_arrow.svg" alt="화살표">
                                                </li>
                                                <li>
                                                    <p>13:10</p>
                                                    <p>NRT</p>
                                                </li>
                                            </ul>

                                        </li>
                                        <li class="reservation_cancle">
                                            <a href="#">예약 취소하기</a>
                                        </li>
                                    </ul>
                                </div>
                                </c:forEach>
                                <!-- forEach 끝 -->
                                <div>
                                    <span class="trip_day">12월 08일 ( 화 )</span>
                                    <ul class="my_trip_item">
                                        <li class="my_trip_content">
                                            <ul class="my_trip_content_top">
                                                <li><span class="before_payment_label">결제전</span></li>
                                                <li><a href="#">예약 상세 보기 <img src="/images/icons/detail_arrow.svg"
                                                                              alt="예약 상세보기"> </a>
                                                </li>
                                            </ul>
                                            <ul class="my_trip_content_mid">
                                                <li class="my_trip_content_tit">
                                                    <div class="airline_icon_img">
                                                        <img src="/images/icons/airline_icon_02.png" alt="제주항공">
                                                    </div>
                                                    <div>
                                                        <p> [제주항공] 도쿄/나리타 - 부산 </p>
                                                        <p>예약번호 3018-4609</p>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="my_trip_content_btm">
                                                <li>
                                                    <p>제주항공</p>
                                                    <p>7C1154</p>
                                                </li>
                                                <li>
                                                    <p>11:05</p>
                                                    <p>PUS</p>
                                                </li>
                                                <li>
                                                    <img src="/images/icons/my_trip_arrow.svg" alt="화살표">
                                                </li>
                                                <li>
                                                    <p>13:10</p>
                                                    <p>NRT</p>
                                                </li>
                                            </ul>

                                        </li>
                                        <li class="reservation_cancle">
                                            <a href="#">예약 취소하기</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="cities tab-content regions_list_item" id="last_trip">
                            <div class="my_trip_count_label">
                                전체 <span class="my_trip_num">2</span>
                            </div>
                            <div class="trip_year">2023년</div>
                            <div class="my_trip_list">
                                <div class="my_trip_box">
                                    <span class="trip_day">12월 05일 ( 화 )</span>
                                    <ul class="my_trip_item">
                                        <li class="my_trip_content">
                                            <ul class="my_trip_content_top">
                                                <li><span class="complete_label">결제완료</span></li>
                                                <li><a href="#">예약 상세 보기 <img src="/images/icons/detail_arrow.svg"
                                                                              alt="예약 상세보기"> </a>
                                                </li>
                                            </ul>
                                            <ul class="my_trip_content_mid">
                                                <li class="my_trip_content_tit">
                                                    <div class="trip_icon_img">
                                                        <img src="/images/trip_img_01.jpg" alt="제주항공">
                                                    </div>
                                                    <div>
                                                        <p> [필리핀 항공] 부산 - 베트남( 다낭 )</p>
                                                        <p>예약번호 3018-4609</p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content regions_list_item" id="canceled_trip">
                            <div class="my_trip_count_label">
                                전체 <span class="my_trip_num">2</span>
                            </div>
                            <div class="trip_year">2023년</div>
                            <div class="my_trip_list">
                                <div class="my_trip_box">
                                    <span class="trip_day">12월 05일 ( 화 )</span>
                                    <ul class="my_trip_item">
                                        <li class="my_trip_content">
                                            <ul class="my_trip_content_top">
                                                <li><span class="cancle_payment_label">예약취소</span></li>
                                                <li><a href="#">예약 상세 보기 <img src="/images/icons/detail_arrow.svg"
                                                                              alt="예약 상세보기"> </a>
                                                </li>
                                            </ul>
                                            <ul class="my_trip_content_mid">
                                                <li class="my_trip_content_tit">
                                                    <div class="airline_icon_img">
                                                        <img src="/images/icons/airline_icon_01.png" alt="제주항공">
                                                    </div>
                                                    <div>
                                                        <p> [진에어] 부산 - 도쿄/나리타</p>
                                                        <p>예약번호 3018-4609</p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="my_trip_ticket_img">
                                                        <div class="my_trip_ticket_bg">
                                                            <span class="trip_left">PUS</span>
                                                            <span class="trip_right">NRT</span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="my_trip_content_btm">
                                                <li>
                                                    <p>제주항공</p>
                                                    <p>7C1154</p>
                                                </li>
                                                <li>
                                                    <p>11:05</p>
                                                    <p>PUS</p>
                                                </li>
                                                <li>
                                                    <img src="/images/icons/my_trip_arrow.svg" alt="화살표">
                                                </li>
                                                <li>
                                                    <p>13:10</p>
                                                    <p>NRT</p>
                                                </li>
                                            </ul>

                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <span class="trip_day">12월 08일 ( 화 )</span>
                                    <ul class="my_trip_item">
                                        <li class="my_trip_content">
                                            <ul class="my_trip_content_top">
                                                <li><span class="cancle_payment_label">예약취소</span></li>
                                                <li><a href="#">예약 상세 보기 <img src="/images/icons/detail_arrow.svg"
                                                                              alt="예약 상세보기"> </a>
                                                </li>
                                            </ul>
                                            <ul class="my_trip_content_mid">
                                                <li class="my_trip_content_tit">
                                                    <div class="airline_icon_img">
                                                        <img src="/images/icons/airline_icon_01.png" alt="제주항공">
                                                    </div>
                                                    <div>
                                                        <p> [진에어] 도쿄/나리타 - 부산</p>
                                                        <p>예약번호 3018-4609</p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="my_trip_ticket_img">
                                                        <div class="my_trip_ticket_bg">
                                                            <span class="trip_left">PUS</span>
                                                            <span class="trip_right">NRT</span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="my_trip_content_btm">
                                                <li>
                                                    <p>제주항공</p>
                                                    <p>7C1154</p>
                                                </li>
                                                <li>
                                                    <p>11:05</p>
                                                    <p>PUS</p>
                                                </li>
                                                <li>
                                                    <img src="/images/icons/my_trip_arrow.svg" alt="화살표">
                                                </li>
                                                <li>
                                                    <p>13:10</p>
                                                    <p>NRT</p>
                                                </li>
                                            </ul>

                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </section>
</main>

</div>
</div>
</div>
<script>

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
            
            //데이터를 가져와 출력하는 함수
            getMyTravel(tabId);

            button.classList.add("tab_active");
        });
    });
</script>
<script src="/js/my_travel.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>