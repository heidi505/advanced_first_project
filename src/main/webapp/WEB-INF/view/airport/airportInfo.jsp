<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>


<!-- TODO 여기서부터 main영역 -->
<main class="airport_info_page">
    <div class="container">
        <div style="display: none">
            <h1>Parking Status Response</h1>
            <c:if test="${not empty parkingStatusResponse}">
                <c:forEach var="item" items="${parkingStatusResponse.response.body.items}">
                    <p>
                            <%-- 주차장 구분 --%>
                        Floor: ${item.floor}<br>
                            <%-- 주차 구역 총 주차면 수 --%>
                        Parking Area: ${item.parkingarea}<br>
                            <%-- 주차 구역 총 주차수 --%>
                        Parking: ${item.parking}<br>
                            <%-- 주차장 현황 시간 --%>
                        Date Time: ${item.datetm}<br>
                            <%-- 주차 상태 평가 --%>
                        <c:set var="parkingRatio" value="${(item.parking * 100.0) / item.parkingarea}"/>

                        <c:choose>
                            <c:when test="${parkingRatio < 85}">
                                Parking Status: 원활<br>
                            </c:when>
                            <c:when test="${parkingRatio >= 85 and parkingRatio < 90}">
                                Parking Status: 보통<br>
                            </c:when>
                            <c:when test="${parkingRatio >= 90 and parkingRatio < 95}">
                                Parking Status: 혼잡<br>
                            </c:when>
                            <c:when test="${parkingRatio >= 95}">
                                Parking Status: 매우 혼잡<br>
                            </c:when>
                        </c:choose>
                    </p>
                </c:forEach>

                <%-- 각 층의 총 주차면 수 및 총 주차 수 계산 --%>
                <c:set var="totalParkingAreaT1" value="0"/>
                <c:set var="totalParkingT1" value="0"/>
                <c:set var="totalParkingAreaT2" value="0"/>
                <c:set var="totalParkingT2" value="0"/>

                <c:forEach var="item" items="${parkingStatusResponse.response.body.items}">
                    <c:choose>
                        <c:when test="${item.floor.startsWith('T1')}">
                            <c:set var="totalParkingAreaT1" value="${totalParkingAreaT1 + item.parkingarea}"/>
                            <c:set var="totalParkingT1" value="${totalParkingT1 + item.parking}"/>
                        </c:when>
                        <c:when test="${item.floor.startsWith('T2')}">
                            <c:set var="totalParkingAreaT2" value="${totalParkingAreaT2 + item.parkingarea}"/>
                            <c:set var="totalParkingT2" value="${totalParkingT2 + item.parking}"/>
                        </c:when>
                    </c:choose>
                </c:forEach>

                <%-- T1 주차 상태 평가 --%>
                <c:set var="parkingRatioT1" value="${(totalParkingT1 * 100.0) / totalParkingAreaT1}"/>
                <c:set var="avableT1" value="${totalParkingAreaT1 - totalParkingT1}"/>
                <c:set var="statusTT1">
                    <c:choose>
                        <c:when test="${parkingRatioT1 < 85}">
                            원활
                        </c:when>
                        <c:when test="${parkingRatioT1 >= 85 and parkingRatioT1 < 90}">
                            보통
                        </c:when>
                        <c:when test="${parkingRatioT1 >= 90 and parkingRatioT1 < 95}">
                            혼잡
                        </c:when>
                        <c:when test="${parkingRatioT1 >= 95}">
                            매우 혼잡
                        </c:when>
                    </c:choose>
                </c:set>
                <p>
                    Total Parking Area T1: ${totalParkingAreaT1}<br>
                    Total Parking T1: ${totalParkingT1}<br>
                    Total Parking available T1: ${avableT1}<br>
                    Parking Status T1: ${statusTT1}<br>
                </p>
                <%-- T2 주차 상태 평가 --%>
                <c:set var="parkingRatioT2" value="${(totalParkingT2 * 100.0) / totalParkingAreaT2}"/>
                <c:set var="avableT2" value="${totalParkingAreaT2-totalParkingT2}"/>
                <c:set var="statusTT2">
                    <c:choose>
                        <c:when test="${parkingRatioT2 < 85}">
                            원활<br>
                        </c:when>
                        <c:when test="${parkingRatioT2 >= 85 and parkingRatioT2 < 90}">
                            보통<br>
                        </c:when>
                        <c:when test="${parkingRatioT2 >= 90 and parkingRatioT2 < 95}">
                            혼잡<br>
                        </c:when>
                        <c:when test="${parkingRatioT2 >= 95}">
                            매우 혼잡<br>
                        </c:when>
                    </c:choose>
                </c:set>
                <p>
                    Total Parking Area T2: ${totalParkingAreaT2}<br>
                    Total Parking T2: ${totalParkingT2}<br>
                    Total Parking available T2 : ${avableT2}<br>
                    Parking Status T2: ${statusTT2}<br>
                </p>
            </c:if>
        </div>
        <div class="section">
            <div class="pt-5">
                <h2>
                    <b>나의 공항정보 - <span class="color_primary02">${airPortName}</span></b>
                    <span
                            class="fs-6 float-end me-3">
						<span class="color_green">원활</span>
						<span class="color_cancle">혼잡</span>
					</span>
                </h2>
                <div class="p-5 mx-auto text-center">
                    <p class="color_primary02">BOARDING PROCESS TIME</p>
                    <p class="fs-1 my-2"><b>국내선 탑승수속 소요시간 안내</b></p>
                    <p class="mt-3"><b>셀프 체크인부터 항공기 탑승까지 평균 체류시간</b></p>
                    <div class="mt-4 congestion_status_item">
						<span class="p-2">
							<b class="color_primary02 duration_of_time">${onePersonTime}<span class="ms-2 fs-2 airline_minute">분 ㅡ </span> </b>
						</span>
                        <c:set var="congestion" value="원활"></c:set>
                        <c:if test="${airportItems[0].congestYn eq 'N'}">
                            <span class="smooth_status">${congestion}</span>
                        </c:if>
                        <c:if test="${airportItems[0].congestYn eq 'Y'}">
                            <span class="confusion_status">${congestion}</span>
                        </c:if>
                    </div>
                </div>
                <hr>
            </div>
            <!-- 상단 페이지 끝-->
            <h2 class="mb-3 mt-5"><b>주차장 안내</b></h2>
            <div class="airport_parking_nav_bar mt-5 w-100 mx-auto">
                <div class="btn-group w-100" role="group" aria-label="Basic example">
                    <a href="#parking-area" class="parking_btn btn border btn-primary" id="1_button">주차장</a>
                    <a href="#parking-current" class="parking_btn btn border" id="2_button">주차현황</a>
                    <a href="#parking-fee" class="parking_btn btn border" id="3_button">주차요금</a>
                </div>
            </div>
            <!-- nav 끝 -->
            <!-- parking_area 시작 -->
            <div class="parking_menu w-85 mt-5 mx-auto" id="1">
                <h1 class="mb-4"><b>주차장 안내</b></h1>
                <div class="w-100">
                    김해국제공항은 P1여객주차장 2,345여 대, P2 여객주차장 2,123여 대의 여객청사 주차장,P3 여객(화물)주차장 984여 대, 1,506대의 월정주차장 등
                    총 7,118여 대를 동시에 주차할 수 있는 넓은 유료주차장이 마련되어 있습니다.
                </div>
                <div class="image_box">
                    <img class="my-5 w-100" src="/images/parking_gimhae.png" alt="">
                    <img class="my-5 w-100" src="/images/parking_gimhae.png" alt="">
                </div>
            </div>
            <!-- parking_area 끝 -->
            <!-- parking_menu 시작 -->
            <div class="parking_menu w-85 mt-5 mb-2 mx-auto" id="2">
                <div style="display: none">주차가능 : ${avableT1} 대 Parking Status T1:
                    <span id="statusTT1">${statusTT1}</span>
                </div>
                <h3><b class="color_primary02">제 1여객터미널 (T1)</b></h3>
                <div class="row border align-items-start mt-3">
                    <div class="parking_status col border py-3 px-5 text-center"><b class="b_pointer">원활</b>
                    </div>
                    <div class="parking_status col border py-3 px-5 text-center"><b class="b_pointer">보통</b>
                    </div>
                    <div class="parking_status col border py-3 px-5 text-center"><b class="b_pointer">혼잡</b>
                    </div>
                    <div class="parking_status col border py-3 px-5 text-center"><b class="b_pointer">매우 혼잡</b>
                    </div>
                </div>
                <div style="display: none">주차가능 : ${avableT2}대 Parking Status T2:
                    <span id="statusTT2">${statusTT2}</span>
                </div>
                <h3 class="mt-5"><b class="color_primary02">제 2여객터미널 (T2) <br></b></h3>
                <div class="row border align-items-start mt-3">
                    <div class="parking_status_2nd col border py-3 px-5 text-center">원활
                    </div>
                    <div class="parking_status_2nd col border py-3 px-5 text-center">보통
                    </div>
                    <div class="parking_status_2nd col border py-3 px-5 text-center">혼잡
                    </div>
                    <div class="parking_status_2nd col border py-3 px-5 text-center"> 매우 혼잡
                    </div>
                </div>
            </div>
            <!-- parking_menu 끝 -->
        </div>
    </div>
</main>
</div>
</div>
<script src="/js/airport_info_javascript.js"></script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>