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
                배너 등록
            </h3>
            <div class="admin_common_form">
                <form>
                    <div class="admin_form_box">
                        <div class="admin_form_tit">
                            <h5>항공권 배너 등록 </h5>
                        </div>
                        <div class="admin_form_area">
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="countryName" class="form-label">나라명</label>
                                    <input type="text" id="countryName" class="form-control" placeholder="나라명을 입력해주세요" name="countryName">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="flightPrice" class="form-label">가격</label>
                                    <input type="number" id="flightPrice" class="form-control" placeholder="가격을 입력해주세요" name="flightPrice">
                                </li>
                            </ul>
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="startingPoint" class="form-label">출발지</label>
                                    <input type="text" id="startingPoint" class="form-control" placeholder="출발지를 입력해주세요" name="startingPoint">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="destination" class="form-label">도착지</label>
                                    <input type="text" id="destination" class="form-control" placeholder="도착지를 입력해주세요" name="destination">
                                </li>
                            </ul>
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="departureDate" class="form-label">출발일</label>
                                    <input type="text" id="departureDate" class="form-control" placeholder="12월 05일" name="departureDate">
                                </li>
                                <li class="admin_form_textfield">
                                    <label for="arrivalDate" class="form-label">도착일</label>
                                    <input type="text" id="arrivalDate" class="form-control" placeholder="12월 10일" name="arrivalDate">
                                </li>
                            </ul>
                            <ul class="admin_from_item">
                                <li class="admin_form_textfield">
                                    <label for="flightImg" class="form-label">배너 사진</label>
                                    <input type="file" id="flightImg" class="form-control">
                                </li>
                            </ul>
                        </div>
                        <div class="admin_common_btn"> <a href="#" class="btn btn-primary">등록하기</a></div>
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