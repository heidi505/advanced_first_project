<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                                전체 <span class="my_trip_num">${tripCount.allTripCount}</span>
                            </div>
                            <div class="my_trip_count_label">
                                결제전 <span class="my_trip_num">${tripCount.notPayedTripCount}</span>
                            </div>
                            <div class="my_trip_count_label">
                                결제완료 <span class="my_trip_num">${tripCount.payedTripCount}</span>
                            </div>
                            <c:set var="i" value="${0}" />
                             <c:set var="lastYear" value="${0000}" />
                            <c:forEach var="list" items="${tripList}">
                            
                            <c:set var="departureTime" value="${list.departureTime}" />
							<c:set var="year" value="${fn:substring(departureTime, 0, 4)}" />
							<c:set var="month" value="${fn:substring(departureTime, 5, 7)}" />
							<c:set var="day" value="${fn:substring(departureTime, 8, 10)}" />
							<c:set var="time" value="${fn:substring(departureTime, 11, 16)}" />
							<fmt:formatDate value="${departureTime}" pattern="EE" var="week" />
							
							<c:set var="arrivalTime" value="${list.arrivalTime}" />
							<c:set var="aTime" value="${fn:substring(arrivalTime, 11, 16)}" />
							<!-- 딱 한번이라는 조건을 달아야 함 -->
							
                            <c:if test="${year ne lastYear}">
                            	<div class="trip_year">${year}년</div>
                            	<c:set var="lastYear" value="${year}" />
                            </c:if>
							<c:if test="${i eq 0}">
							<c:set var="i" value="${i+1}" />
                            <div class="my_trip_list">
                            </c:if>
                                <div class="my_trip_box">
                                    <span class="trip_day"> ${month}월 ${day}일 ( ${week} )</span>
                                    <ul class="my_trip_item">
                                        <li class="my_trip_content">
                                            <ul class="my_trip_content_top">
                                                <li><span class="before_payment_label">
                                                <c:choose>
                                                <c:when test="${list.isPayed eq true}">
                                                결제완료
                                                </c:when>
                                                <c:otherwise>
                                                결제전
                                                </c:otherwise>
                                                </c:choose>
                                                </span></li>
                                                <li><a href="/reservation/detail/${list.reservationNum}">예약 상세 보기 <img src="/images/icons/detail_arrow.svg"
                                                                              alt="예약 상세보기"> </a>
                                                </li>
                                            </ul>
                                            <ul class="my_trip_content_mid">
                                                <li class="my_trip_content_tit">
                                                    <div class="airline_icon_img">
                                                        <img src="/images/icons/airline_icon_02.png" alt="제주항공">
                                                    </div>
                                                    <div>
                                                    <!-- choose문 많이 필요 -->
                                                        <p> [제주항공] 부산 - 도쿄/나리타</p>
                                                        <p>예약번호 ${list.reservationNum}</p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="my_trip_ticket_img">
                                                        <div class="my_trip_ticket_bg">
                                                            <span class="trip_left">${list.departureCity}</span>
                                                            <span class="trip_right">${list.arrivalCity}</span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="my_trip_content_btm">
                                                <li>
                                                    <p>제주항공</p>
                                                    <p>${list.flightName}</p>
                                                </li>
                                                <li>
                                                    <p>${time}</p>
                                                    <p>${list.departureCity}</p>
                                                </li>
                                                <li>
                                                    <img src="/images/icons/my_trip_arrow.svg" alt="화살표">
                                                </li>
                                                <li>
                                                    <p>${aTime}</p>
                                                    <p>${list.arrivalCity}</p>
                                                </li>
                                            </ul>

                                        </li>
                                        <li class="reservation_cancle">
                                            <a href="/reservation/cancel-modal/${list.reservationNum}">예약 취소하기</a>
                                            <form action="/kakaoPay/cancel" method="post">
                                                <button type="submit">결제 취소하기</button>
                                            </form>

                                        </li>

                                    </ul>
                                </div>
                                </c:forEach>
                                <!-- forEach 끝 -->
                            </div>
                        </div>
                        <div class="tab-content regions_list_item" id="last_trip">
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
            getMyTravel(tabId , "전체");
            button.classList.add("tab_active");
        });
    });
    
    tabContents.forEach((button)=>{
    	button.addEventListener('click',(e)=>{
    		let tabId = button.id;
    		if(e.target.classList.contains('my_trip_count_label')||
    				e.target.classList.contains('my_trip_num')){
    			let sort = '';
    			if(e.target.classList.contains('my_trip_num')){
    				let myTripCountLabel = e.target.parentElement;
    				sort = myTripCountLabel.innerText.split(e.target.innerText)[0];
    			} else{
    				sort = e.target.innerText.split(e.target.childNodes[1].innerText)[0];
    			}
    			getMyTravel(tabId, sort);
    		}

    	})
    	
    	
    });
    
</script>
<script src="/js/my_travel.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>