<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/adminHeader.jsp" %>


<!-- TODO 여기서부터 main영역 -->
<main id="coupon_list_page">
    <div class="section">
        <div class="container">
            <h3 class="admin_common_tit">쿠폰 목록</h3>
            <div class="admin_common_btn"><a href="/admin/coupon-save" class="btn btn-primary">쿠폰 등록</a></div>
            <div class="coupon_list_area">
                <div class="coupon_list_tit">
                    <h5>만료 쿠폰 목록</h5>
                </div>
                <div class="coupon_list_cont">
                    <table class="common_table">
                    <thead>
                    <tr>
                        <th>순번</th>
                        <th>쿠폰 이름</th>
                        <th>쿠폰 발급 번호</th>
                        <th>쿠폰 발급일 & 만료일</th>
                        <th>쿠폰 금액</th>
                        <th>쿠폰 만료 여부</th>
                    </tr>
                    </thead>
                    <tbody class="common_list_cont">
                    <tr>
                        <td>1</td>
                        <td><a href="/admin/coupon-detail">가입 축하 쿠폰</a></td>
                        <td><a href="/admin/coupon-detail">1928303952357</a></td>
                        <td><a href="/admin/coupon-detail">12월 12월 ~ 12월 15일</a></td>
                        <td><a href="/admin/coupon-detail">2000원</a></td>
                        <td><a href="/admin/coupon-detail">만료됨</a></td>
                    </tr>
                    </tbody>
                </table>
                </div>
            </div>
            <div class="coupon_list_area">
                <div class="coupon_list_tit">
                    <h5>현재 쿠폰 목록</h5>
                </div>
                <div class="coupon_list_cont">
                    <table class="common_table">
                        <thead>
                        <tr>
                            <th>순번</th>
                            <th>쿠폰 이름</th>
                            <th>쿠폰 발급 번호</th>
                            <th>쿠폰 발급일 & 만료일</th>
                            <th>쿠폰 금액</th>
                        </tr>
                        </thead>
                        <tbody class="common_list_cont">
                        <tr>
                            <td>1</td>
                            <td><a href="/admin/coupon-detail">가입 축하 쿠폰</a></td>
                            <td><a href="/admin/coupon-detail">1928303952357</a></td>
                            <td><a href="/admin/coupon-detail">12월 12월 ~ 12월 15일</a></td>
                            <td><a href="/admin/coupon-detail">2000원</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="list_pagination">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">prev</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">next</a></li>
                </ul>
            </div>
        </div>

    </div>
</main>

</div>
</div>

<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>