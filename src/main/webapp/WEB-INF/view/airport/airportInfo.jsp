<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>


<!-- TODO 여기서부터 main영역 -->
<main class="airport_info_page">
    <div class="container">
        <div></div>
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
							<b class="color_primary02 duration_of_time">${onePersonTime}<span
                                    class="ms-2 fs-2 airline_minute">분 ㅡ </span> </b>
						</span>
                        <c:set var="congestion"></c:set>
                        <c:if test="${airportItems[0].congestYn eq 'N'}">
                            <span class="smooth_status">원활</span>
                        </c:if>
                        <c:if test="${airportItems[0].congestYn eq 'Y'}">
                            <span class="confusion_status">혼잡</span>
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
                <div class="ICN">
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
                <div class="OTH">
                    <div style="display: none">
                        <c:if test="${not empty parkingStatusResponse2}">
                            <c:forEach var="parkingInfo" items="${parkingStatusResponse2.response.body.items.item}">
                                <p>공항(영문): ${parkingInfo.airportEng}</p>
                                <p>공항(한글): ${parkingInfo.airportKor}</p>
                                <p>주차장 위치: ${parkingInfo.parkingAirportCodeName}</p>
                                <p>혼잡도: ${parkingInfo.parkingCongestion}</p>
                                <c:choose>
                                    <c:when test="${parkingInfo.parkingCongestion eq '만차'}">
                                        <c:set var="congestionStatus" value="매우 혼잡"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="congestionStatus" value="${parkingInfo.parkingCongestion}"/>
                                    </c:otherwise>
                                </c:choose>
                                혼잡도 : ${congestionStatus}
                                <p>혼잡률: ${parkingInfo.parkingCongestionDegree}</p>
                                <p>입고 차량 수: ${parkingInfo.parkingOccupiedSpace}</p>
                                <p>전체 주차 공간: ${parkingInfo.parkingTotalSpace}</p>
                                <p>업데이트 일자: ${parkingInfo.sysGetdate}</p>
                                <p>업데이트 시간: ${parkingInfo.sysGettime}</p>
                            </c:forEach>
                        </c:if>
                        <c:if test="${not empty parkingStatusResponse2}">
                            <c:forEach var="parkingInfo" items="${parkingStatusResponse2.response.body.items.item}"
                                       varStatus="loop">
                                <c:choose>
                                    <c:when test="${loop.index == 0}">
                                        <c:set var="t1" value="${parkingInfo}"/>
                                    </c:when>
                                    <c:when test="${loop.index == 1}">
                                        <c:set var="t2" value="${parkingInfo}"/>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </c:if>
                        <c:if test="${not empty t1}">
                            <c:choose>
                                <c:when test="${t1.parkingCongestion eq '만차'}">
                                    <c:set var="congestionStatus1" value="매우 혼잡"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="congestionStatus1" value="${t1.parkingCongestion}"/>
                                </c:otherwise>
                            </c:choose>
                            혼잡도 : ${congestionStatus1}
                        </c:if>
                        <c:if test="${not empty t2}">
                            <c:choose>
                                <c:when test="${t2.parkingCongestion eq '만차'}">
                                    <c:set var="congestionStatus2" value="매우 혼잡"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="congestionStatus2" value="${t2.parkingCongestion}"/>
                                </c:otherwise>
                            </c:choose>
                            혼잡도 : ${congestionStatus2}
                        </c:if>
                    </div>
                    <div style="display: none">Parking Status T1:
                        <span id="statusTT3">${congestionStatus1}</span>
                    </div>
                    <h3><b class="color_primary02">제 1여객터미널 (T1)</b></h3>
                    <div class="row border align-items-start mt-3">
                        <div class="parking_status_3rd col border py-3 px-5 text-center"><b class="b_pointer">원활</b>
                        </div>
                        <div class="parking_status_3rd col border py-3 px-5 text-center"><b class="b_pointer">보통</b>
                        </div>
                        <div class="parking_status_3rd col border py-3 px-5 text-center"><b class="b_pointer">혼잡</b>
                        </div>
                        <div class="parking_status_3rd col border py-3 px-5 text-center"><b class="b_pointer">매우 혼잡</b>
                        </div>
                    </div>
                    <div style="display: none">Parking Status T2:
                        <span id="statusTT4">${congestionStatus2}</span>
                    </div>
                    <h3 class="mt-5"><b class="color_primary02">제 2여객터미널 (T2) <br></b></h3>
                    <div class="row border align-items-start mt-3">
                        <div class="parking_status_4th col border py-3 px-5 text-center">원활
                        </div>
                        <div class="parking_status_4th col border py-3 px-5 text-center">보통
                        </div>
                        <div class="parking_status_4th col border py-3 px-5 text-center">혼잡
                        </div>
                        <div class="parking_status_4th col border py-3 px-5 text-center"> 매우 혼잡
                        </div>
                    </div>
                </div>
            </div>
            <!-- parking_menu 끝 -->
            <!-- parking_fee 시작 -->
            <div class="parking_menu w-85 mx-auto mt-5" id="3">
                <h1 class="mb-4"><b>주차요금 체계</b></h1>
                <%-- parkingFee 반복문 부분 --%>
                <c:forEach var="fList" items="${list}">
                        <h3><b class="color_primary02">${fList.parkingParkingName} </b></h3>
                        <table class="parking_fee_table table w-100 mt-3">
                            <thead>
                            <tr>
                                <th rowspan="2" class="align-middle">구분</th>
                                <th colspan="2">평일</th>
                                <th colspan="2">주말</th>
                            </tr>
                            <tr>
                                <th>소형</th>
                                <th>대형</th>
                                <th>소형</th>
                                <th>대형</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="align-middle">1일(24시간)주차시
                                </td>
                                <td class="lh-lg py-5 pe-5 text-start">
                                    · 기본${fList.parkingBasicM}분 : ${fList.parkingBasicAccount }원<br>
                                    · 매 ${fList.parkingMinuteM}분 : ${fList.parkingMinuteAccount}원 추가<br>
                                    · 24시간 : ${fList.parkingMaxAccount}원<br>
                                    · 기본 ${fList.parkingFreeM}분 무료주차
                                </td>
                                <td class="lh-lg py-5 pe-5 text-start">
                                    · 기본${fList.parkingBasicMd}분 : ${fList.parkingBasicAccountd }원<br>
                                    · 매 ${fList.parkingMinuteMd}분 : ${fList.parkingMinuteAccountd}원 추가<br>
                                    · 24시간 : ${fList.parkingMaxAccountd}원<br>
                                    · 정산 후 ${fList.parkingCalTimeMd}분 무료주차
                                </td>
                                <td class="lh-lg py-5 pe-5 text-start">
                                    · 기본${fList.parkingHoliBasicM }분 : ${fList.parkingHoliBasicAccount }원<br>
                                    · 매 ${fList.parkingHoliMinuteM}분 : ${fList.parkingHoliMinuteAccount}원 추가<br>
                                    · 24시간 : ${fList.parkingHoliMaxAccount}원<br>
                                    · 기본 ${fList.parkingHoliBasicM}분 무료주차
                                </td>
                                <td class="lh-lg py-5 pe-5 text-start">
                                    · 기본${fList.parkingHoliBasicMd}분 : ${fList.parkingHoliBasicAccountd}원<br>
                                    · 매 ${fList.parkingHoliMinuteMd}분 : ${fList.parkingHoliMinuteAccountd}원 추가<br>
                                    · 24시간 : ${fList.parkingHoliMaxAccountd}원<br>
                                    · 기본 ${fList.parkingHoliBasicMd}분 무료주차<br>
                                </td>
                            </tr>
                            <tr>
                                <td class="py-3">정산 시</td>
                                <td colspan="4" class="py-3">정산 후 ${fList.parkingCalTimeM}분 무료주차</td>
                            </tr>
                            <tr>
                                <td class="py-3">1일 추가 주차시</td>
                                <td colspan="4" class="py-3">상기요금 반복적용</td>
                            </tr>
                            </tbody>
                        </table>
                </c:forEach>  
                <%-- parkingFee 반복문 부분 끝 --%>
                <!-- 주차장 요금 정보 테이블2 시작 -->
                <!-- 주차장 요금 정보 div 끝 -->
                <div class="lh-base">
                    <span class="color_primary02">·</span>
                    <span>상기 요금은 입차시간 기준이며, 24시간마다 상기 요금을 반복 적용합니다.
			<br>(문의전화:대표번호:1234-5678, 111-222-3333)</span>
                    <br><span class="color_primary02">· P3 여객(화물)주차장은 주말 및 성수기에는 이용객 과다로 만차가 될 수 있음을 미리 알려드리오며, 만차 시에는 P1,P2여객 주차장을 이용해 주시기를 부탁드립니다.
			</span>
                    <br>
                    <span>(P1,P2 여객 주차장 이용 시에는 일반 주차장 요금 적용)</span>
                    <br>
                    <span class="color_primary02">·</span>
                    <span>주차장 서비스 타임 시행:입차후 10분 이내 출차 시 주차요금 무료(P3여객(화물)주차장은 20분 이내 출차 시 주차요금 무료)</span>
                </div>
                <hr class="hr_margin">
                <h1 class="mb-4"><b>주차요금 할인안내</b></h1>
                <h3 class="mb-4"><b class="color_primary02">주차요금 할인안내</b></h3>
                <p class="mb-2"><b>할인율:50%(저공해 3종 20%)</b></p>
                <span class="lh-base">무인 신용카드 정산기를 이용하실 때 할일혜택 적용이 불가할 경우, 주차지원센터(012-345-6789)로 연락바랍니다.
			<br>※ 두 개 이상의 할인 사유에 해당하는 경우 이용자에게 유리한 1개의 할인 사유만 적용됩니다.
			</span>
                <h3 class="mt-5 mb-4"><b class="color_primary02">할인대상 및 조건</b></h3>
                <span class="lh-base">행정안전부 행정정보 공동이용 DB 자동화인이 안될 경우, 주차지원센터(012-345-6789)로 연락바랍니다.
			</span>
			<table class="parking_fee_table fee_target_table w-85">
			<thead>
			  <tr>
			    <th>할인대상</th>
			    <th>대상별 할인조건</th>
			    <th>할인율</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
			    <td class="lh-lg py-3 pe-5 align-middle discount_target">①경차</td>
			    <td class="lh-lg py-3 pe-5 ps-4 align-middle text-start">「자동차관리법 시행규칙」 제2조별표1에 따론 경형자동차<br>
			    ※필요서류:없음(행정정보 조회 후 실시간 할인)</td>
			    <td class="lh-lg px-4 align-middle">50%</td>
			  </tr>
			  <tr>
			    <td class="lh-lg py-3 pe-5 align-middle discount_target">②저공해 자동차</td>
			    <td class="lh-lg py-3 pe-5 ps-4 align-middle text-start">「수도권 대기 환경개선에 관한 특별법」 제2조 제6호 및
			     동법 시행령 제3조에 따른 저공해자동차로서 한국환경공단(친환경 자동차 종합 정보지원 시스템)
			     으로부터 저공해자동차임이 확인된 차량
			     <br>
			    ※ 필요서류:없음(행정정보 조회 후 실시간 할인)<br>
			    ※ 2020.04.03 부터 법개정으로 인하여 경유를 연료로 하는 자동차는 저공해차에서 제외 되었습니다.
			    </td>
			    <td class="lh-lg px-4 align-middle">50%</td>
			  </tr>
			  <tr>
			    <td class="lh-lg py-3 align-middle discount_target">①장해등급 판정을 받은 고엽제 후유의증 환자 등록차량<br>
			    ①장해등급 판정을 받은 고엽제 후유의증 환자 등록차량</td>
			    <td class="lh-lg py-3 ps-4 align-middle text-start">「자동차관리법 시행규칙」 제2조별표1에 따론 경형자동차<br>
			    ※필요서류:없음(행정정보 조회 후 실시간 할인)</td>
			    <td class="lh-lg px-4 align-middle">50%</td>
			  </tr>
			  <tr>
			    <td class="lh-lg py-3 pe-5 align-middle discount_target">①경차</td>
			    <td class="lh-lg py-3 pe-5 ps-4 align-middle text-start">「자동차관리법 시행규칙」 제2조별표1에 따론 경형자동차<br>
			    ※필요서류:없음(행정정보 조회 후 실시간 할인)</td>
			    <td class="lh-lg px-4 align-middle">50%</td>
			  </tr>
			  <tr>
			    <td class="lh-lg py-3 pe-5 align-middle discount_target">①경차</td>
			    <td class="lh-lg py-3 pe-5 ps-4 align-middle text-start">「자동차관리법 시행규칙」 제2조별표1에 따론 경형자동차<br>
			    ※필요서류:없음(행정정보 조회 후 실시간 할인)</td>
			    <td class="lh-lg px-4 align-middle">50%</td>
			  </tr>
			</tbody>
			</table>
			<!-- 주차요금할인안내 테이블 끝 -->
			<p class="my-3">*(다자녀가구 기준)2자녀 이상 막내나이가 만 15세 이하인 가구</p>
			<p>**(제출서류)주민등록등본 사본, 가족관계증명서 사본, 건강보험증 사본 중 택1</p>
			</div>
			<!-- parking_fee 끝 -->
        </div>
    </div>
</main>
</div>
</div>
<script src="/js/airport_info.js"></script>
<script>
    // airPortName 값을 여기에서 설정하거나 동적으로 가져와서 사용할 수 있습니다.
    var airPortName = "${airPortName}";

    // airPortName의 값에 따라 클래스를 토글하는 함수
    function toggleClasses() {
        if (airPortName === "인천공항") {
            $(".ICN").show();
            $(".OTH").hide();
        } else {
            $(".ICN").hide();
            $(".OTH").show();
        }
    }

    // 페이지 로드 시 초기 실행
    toggleClasses();
</script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>