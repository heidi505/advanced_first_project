<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/adminHeader.jsp" %>


<!-- TODO 여기서부터 main영역 -->
<main id="banner_list_page">
    <div class="section">
        <div class="container">
            <h3 class="admin_common_tit">공지사항 목록</h3>
            <div class="admin_common_btn"><a href="/admin/notice-save" class="btn btn-primary">공지 등록</a></div>
            <table class="common_table">
                <thead>
                <tr>
                    <th>순번</th>
                    <th>제목</th>
                    <th>날짜</th>
                </tr>
                </thead>
                <c:forEach var="notice" items="${noticeList}">
                <tbody class="common_list_cont">

                <tr>
                    <td>${notice.id}</td>
                    <td><a href="/admin/notice-detail/${notice.id}">${notice.title}</a></td>
                    <td>${notice.time()}</td>
                </tr>

                </tbody>
                </c:forEach>
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