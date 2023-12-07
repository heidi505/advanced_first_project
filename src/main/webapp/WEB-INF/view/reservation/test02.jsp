<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp" %>

<!-- TODO 여기서부터 main영역 -->
<div class="loading">
    <div class="loading_bg">
        <div class="form">
            <div class="loading_title">
                <span class="dep_city">서울</span>에서
                <span class="arr_city">나리타</span>까지
                <br>왕복 항공권을 찾고 있습니다.
            </div>
            <div style="border-top: 1px solid var(--basic_wh); border-bottom: 1px solid var(--basic_wh); margin-top: 2em;">
                <div class="k1_fromto_wrap" style="padding: 2em;">
                    <div class="dep-arr dep" style="">
                        <p>SEL</p>
                        <p class="city">서울</p>
                        <p class="date">2023년 12월 12일</p>
                    </div>
                    <div>
                    <span class="image-container">
                        <img src="../images/ico_from_to2.png" alt="이미지 설명" class="overlay-image">
                    </span>
                    </div>
                    <div class="dep-arr arr" style="">
                        <p>NRT</p>
                        <p class="city">나리타</p>
                        <p class="date">2023년 12월 15일</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="loading_title2">
            <span class="image-container">
                <img src="../images/ico_from_to2.png" alt="이미지 설명" class="overlay-image">
            </span>
        </div>
        <div class="bottom_wrap">
            <div class="loading_ani"><span></span></div>
        </div>
    </div>
</div>
<div id="reservation_preview_page">
    <div class="container">
        <!-- 기본 메세지 -->
        <section>
            <div class="p-1 border">
                <sapn><a href="">👈검색 결과로 돌아가기</a></sapn>
                <h3 class="preview_header">선택한 항공권</h3>
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
                                            <strong>서울 (ICN)</strong>
                                            <span class="preview_form_padding"> ✈ </span>
                                            <strong>도쿄 (NRT)</strong>
                                            <span>12월 12일</span>
                                        </h4>
                                    </div>
                                    <ul>
                                        <li>
                                            <div class="preview_li_box">
                                                <div>
                                                    <div class=" preview_li_box_top">
                                                        <span>
                                                            <img src="../images/RS.png" class="preview_airport_img">
                                                        </span>
                                                        <span>에어서울 →</span>
                                                        <span>
                                                            <span>16:40<span>ICN</span></span>
                                                                <span>02시간 20분</span>
                                                                <span>19:00<span>NRT</span></span>
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
                                                                    <span>진에어 0103</span>
                                                                </p>
                                                            </div>
                                                            <div class="preview_form_margint">
                                                                <p class="preview_baggage_bottom">
                                                                    <span>🧳</span>
                                                                    <span>무료수화물 15kg</span>
                                                                </p>
                                                                <p>
                                                                    <span>🪑</span>
                                                                    <span>일반석</span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <!-- 오른쪽 화면 -->
                                                        <div class="prview_baggage_right">
                                                            <span>1월 4일</span>
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
                                                                <span class="">18:00<span>서울 ICN</span> T2</span>
                                                            </p>
                                                            <p class="prview_baggage_rightm">
                                                            <span>
                                                                <span>05시간 30분</span>
                                                            </span>
                                                            </p>
                                                            <p>
                                                                <span>22:30<span>코타키나발루 BKI</span>T1</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- 오는편 -->
                            <div class="preview_form_margint">
                                <div>
                                    <div class="preview_form_marginb">
                                        <h4>
                                            <span class="btn-primary preview_btn_to_form">오는편</span>
                                            <strong>도쿄 (NRT)</strong>
                                            <span class="preview_form_padding">✈</span>
                                            <strong>서울 (ICN)</strong>
                                            <span>12월 15일</span>
                                        </h4>
                                    </div>
                                    <ul>
                                        <li>
                                            <div class="preview_li_box">
                                                <div>
                                                    <div class="preview_li_box_top">
                                                            <span>
                                                                <img src="../images/RS.png" class="preview_airport_img">
                                                            </span>
                                                        <span>에어서울</span>
                                                        <span>
                                                            <span>13:10
                                                                <span>NRT </span>
                                                            </span>
                                                            <span>02시간 35분</span>
                                                            <span>15:45
                                                                <span>ICN</span>
                                                            </span>
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
                                                                    <span>에어서울 0103</span>
                                                                </p>
                                                            </div>
                                                            <div class="preview_form_margint">
                                                                <p class="preview_baggage_bottom">
                                                                    <span>🧳</span>
                                                                    <span>무료수화물 15kg</span>
                                                                </p>
                                                                <p>
                                                                    <span>🪑</span>
                                                                    <span>일반석</span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <!-- 오른쪽 화면 -->
                                                        <div class="prview_baggage_right">
                                                            <span>12월 1일</span>
                                                        </div>
                                                        <div>
                                                            <span class="preview_baggage_line">
                                                                <p>여</p>
                                                                <p>정</p>
                                                            </span>
                                                        </div>
                                                        <div>
                                                            <p class="prview_baggage_rightm">
                                                                <span>18:00<span>코타키나발루 BKI</span> T1</span>
                                                            </p>
                                                            <p class="prview_baggage_rightm">
                                                                <span>
                                                                    <span>05시간 30분</span>
                                                                </span>
                                                            </p>
                                                            <p>
                                                                <span>22:30<span>서울 ICN</span> T2</span>
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
                                <span>서울
                                    <img src="../images/ico_from_to_02.png" class="preview_price_img">도쿄
                                </span>
                            </div>
                            <div class="preview_price_line">12월 12일 - 12월 15일 · 승객 1명</div>
                            <div>
                                <!-- 요금표 -->
                                <div>
                                    <h2 class="preview_price_line">
                                        <a>성인
                                            <string>1명</string>
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
                                                <td>1명</td>
                                                <td>231,600원</td>
                                            </tr>
                                            <tr>
                                                <td>유류할증료</td>
                                                <td>1명</td>
                                                <td>62,400원</td>
                                            </tr>
                                            <tr>
                                                <td>제세공과금</td>
                                                <td>1명</td>
                                                <td>63,400원</td>
                                            </tr>
                                            <tr>
                                                <td>발권수수료</td>
                                                <td>1명</td>
                                                <td>10,000원</td>
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
                                                <td>367,400원</td>
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
                                        <b class="preview_price_marginr">367,400<span>원</span></b>
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


</div>

</div>
</div>
</div>
<script src="js/javascript.js"></script>
<script>
    // 페이지 로드가 완료된 후 실행되는 함수
    var loadStartTime = new Date().getTime();

    window.onload = function () {
        var loadEndTime = new Date().getTime();
        var elapsedTime = loadEndTime - loadStartTime;
        var showLoadingTime = Math.max(2000, elapsedTime); // 최소 2초 보여지도록 설정

        // 최소 showLoadingTime 동안 로딩 화면 보이기
        setTimeout(function () {
            $(".loading").hide();
            $("#reservation_preview_page").show();
        }, showLoadingTime);
    };
    // // 페이지 로드가 완료된 후 실행되는 함수
    // $(document).ready(function () {
    //     // 최소 2초 동안 로딩 화면 보이기
    //     setTimeout(function () {
    //         $(".reservation_loading").hide();
    //         $("#reservation_preview_page").show();
    //     }, 2000);
    // });

</script>
<%--<script>--%>
<%--    // 로딩 화면을 보여주는 함수--%>
<%--    function showLoadingScreen() {--%>
<%--        $(".loading").fadeIn();--%>
<%--    }--%>

<%--    // 로딩 화면을 숨기는 함수--%>
<%--    function hideLoadingScreen() {--%>
<%--        $(".loading").fadeOut();--%>
<%--    }--%>

<%--    // 페이지 로드 시작 시에 로딩 화면 표시--%>
<%--    showLoadingScreen();--%>

<%--    // 페이지 로드 완료 후 최소 2초 동안 로딩 화면 표시--%>
<%--    $(window).on('load', function(){--%>
<%--        var loadTime = new Date().getTime() - performance.timing.navigationStart;--%>
<%--        var minLoadingTime = 2000;--%>

<%--        if (loadTime < minLoadingTime) {--%>
<%--            setTimeout(function(){--%>
<%--                hideLoadingScreen();--%>
<%--            }, minLoadingTime - loadTime);--%>
<%--        } else {--%>
<%--            hideLoadingScreen();--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
<!-- footer.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>