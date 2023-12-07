<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/adminHeader.jsp" %>


<!-- TODO 여기서부터 main영역 -->
<main id="banner_list_page">
    <div class="section">
        <div class="container">
            <h3 class="admin_common_tit">배너 요소 목록</h3>
            <div class="admin_common_btn"><a href="/admin/banner-save" class="btn btn-primary">등록하기</a></div>
            <table class="common_table">
                <thead>
                <tr>
                    <th>순번</th>
                    <th>나라명</th>
                    <th>출발지 & 도착지</th>
                    <th>출발일 & 도착일</th>
                    <th>가격</th>
                </tr>
                </thead>
                <tbody class="common_list_cont">
                    <tr>
                        <td>1</td>
                        <td><a href="/admin/banner-detail">방콕</a></td>
                        <td><a href="/admin/banner-detail">서울<span><img class="admin_arrow_icon" src="/images/icons/my_trip_arrow.svg" alt="방향"></span>방콕</a></td>
                        <td><a href="/admin/banner-detail">12월 12월 ~ 12월 15일</a></td>
                        <td><a href="/admin/banner-detail">445,200원~</a></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="/admin/banner-detail">방콕</a></td>
                        <td><a href="/admin/banner-detail">서울 <span><img class="admin_arrow_icon" src="/images/icons/my_trip_arrow.svg" alt="방향"></span>방콕</a></td>
                        <td><a href="/admin/banner-detail">12월 12월 ~ 12월 15일</a></td>
                        <td><a href="/admin/banner-detail">445,200원~</a></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="/banner/detail">방콕</a></td>
                        <td><a href="/banner/detail">서울 <span><img class="admin_arrow_icon" src="/images/icons/my_trip_arrow.svg" alt="방향"></span>방콕</a></td>
                        <td><a href="/banner/detail">12월 12월 ~ 12월 15일</a></td>
                        <td><a href="/banner/detail">445,200원~</a></td>
                    </tr>
                </tbody>
            </table>
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