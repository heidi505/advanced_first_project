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
                <button type="button" onclick="history.back()"><img src="/images/icons/admin_arrow.svg" alt="뒤로가기">
                </button>
                공지 등록
            </h3>
            <div class="admin_common_form">
                <form>
                    <div class="admin_form_box">
                        <div class="admin_form_tit">
                            <h5>공지사항</h5>
                        </div>
                        <ul class="admin_form_area">
                            <li class="admin_form_textfield">
                                <label for="noticeTitle" class="form-label">제목</label>
                                <input type="text" id="noticeTitle" class="form-control"
                                       value="${notice.title}" disabled
                                       name="noticeTitle">
                            </li>
                            <li class="admin_form_textfield">
                                <label for="noticeCont" class="form-label">내용</label>
                                <div><textarea class="form-control" name="noticeCont" id="noticeCont" cols="30"
                                               rows="10" disabled>${notice.content}</textarea>
                                </div>
                            </li>
                        </ul>
                        <div class="admin_common_btn">
                            <a href="/admin/notice-update/${notice.id}" class="btn btn-outline-primary">수정</a>
                            <a href="/admin/notice-list" class="btn btn-primary">확인</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</main>

</div>
</div>

<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>