<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp" %>

<!-- TODO 여기서부터 main영역 -->

<%-- 로딩페이지 영역 --%>
<div class="loading">
    <div class="loading_bg">
        <div class="loading_form">
            <div class="loading_title">
                <span class="loading_city">서울</span>에서
                <span class="loading_city">나리타</span>까지
                <br>왕복 항공권을 찾고 있습니다.
            </div>
            <div style="border-top: 1px solid var(--basic_wh); border-bottom: 1px solid var(--basic_wh); margin-top: 2em;">
                <div class="k1_fromto_wrap"
                     style="padding: 2em; display: flex; justify-content: space-between; font-size: x-large; width: auto;">
                    <div class="dep-arr dep" style="text-align: center; flex: 1;">
                        <p class="loading_city">SEL</p>
                        <p class="city">서울</p>
                        <p class="date"><h4>2023년 12월 12일</h4></p>
                    </div>
                    <div class="dep-arr" style="flex: 1; display: flex; justify-content: center; align-items: center;">
                        <img src="../images/ico_from_to2.png" alt="이미지 설명" class="overlay-image">
                    </div>
                    <div class="dep-arr arr" style="text-align: center; flex: 1;">
                        <p class="loading_city">NRT</p>
                        <p class="city">나리타</p>
                        <p class="date"><h4>2023년 12월 15일</h4></p>
                    </div>
                </div>
            </div>
            <div class="loading_ani">
                <img src="../images/logo2.svg" class="animated-svg overlay-image" alt="이미지 설명">
            </div>
        </div>
    </div>
</div>
<%-- 로딩 끝 --%>


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
</script>

<!-- footer.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>