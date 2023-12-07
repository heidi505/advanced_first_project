<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/adminHeader.jsp" %>


<!-- TODO 여기서부터 main영역 -->
<main id="banner_list_page">
    <div class="section">
        <div class="container">
            <h3 class="admin_common_tit">
                <button type="button" onclick="history.back()"><img src="/images/icons/admin_arrow.svg" alt="뒤로가기"></button>
                배너 수정
            </h3>
            <div class="admin_common_form">
                <form>
                    <div class="admin_form_box">
                        <div class="admin_form_tit">
                            <h5>항공권 배너 수정</h5>
                        </div>
                        <div class="admin_form_area">
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="countryName" class="form-label">나라명</label>
                                    <input type="text" id="countryName" class="form-control" value="방콕" name="countryName">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="flightPrice" class="form-label">가격</label>
                                    <input type="number" id="flightPrice" class="form-control" value="230000" name="flightPrice">
                                </li>
                            </ul>
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="startingPoint" class="form-label">출발지</label>
                                    <input type="text" id="startingPoint" class="form-control" value="서울" name="startingPoint">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="destination" class="form-label">도착지</label>
                                    <input type="text" id="destination" class="form-control" value="방콕" name="destination">
                                </li>
                            </ul>
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="departureDate" class="form-label">출발일</label>
                                    <input type="text" id="departureDate" class="form-control" value="12월 05일 ( 화 )" name="departureDate">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="arrivalDate" class="form-label">도착일</label>
                                    <input type="text" id="arrivalDate" class="form-control" value="12월 10일 ( 수 ) " name="arrivalDate">
                                </li>
                            </ul>
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <p>항공권 사진</p>
                                    <img class="admin_img" src="/images/flight_images/flight_img_01.jpg" alt="배너이미지">
                                </li>
                            </ul>
                        </div>
                        <div class="admin_common_btn">
                            <a href="#" class="btn btn-outline-primary">삭제</a>
                            <a href="/admin/banner-list" class="btn btn-primary">수정 완료</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</main>

</div>
</div>

<script src="js/javascript.js"></script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>