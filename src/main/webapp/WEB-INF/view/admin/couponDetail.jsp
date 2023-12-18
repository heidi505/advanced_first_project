<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<!-- header.jsp -->--%>
<%--<%@ include file="../layout/adminHeader.jsp" %>--%>


<%--<!-- TODO 여기서부터 main영역 -->--%>
<%--<main id="banner_list_page">--%>
<%--    <div class="section">--%>
<%--        <div class="container">--%>
<%--            <h3 class="admin_common_tit">--%>
<%--                <button type="button" onclick="history.back()"><img src="/images/icons/admin_arrow.svg" alt="뒤로가기">--%>
<%--                </button>--%>
<%--                쿠폰 상세</h3>--%>
<%--            <div class="admin_common_form">--%>
<%--                <form action="/admin/coupon-detail/{1}">--%>
<%--                    <div class="admin_form_box">--%>
<%--                        <div class="admin_form_tit">--%>
<%--                            <h5>쿠폰 상세 </h5>--%>
<%--                        </div>--%>
<%--                        <div class="admin_form_area">--%>
<%--                            <ul class="admin_form_detail">--%>
<%--                                <li class="admin_form_textfield">--%>
<%--                                    <label for="couponName" class="form-label">쿠폰 이름</label>--%>
<%--                                    <input type="text" id="couponName" class="form-control" value="${couponDetailList.couponName}" name="couponName" disabled>--%>
<%--                                </li>--%>
<%--                                <li class="admin_form_textfield">--%>
<%--                                    <label for="couponPrice" class="form-label">쿠폰 금액</label>--%>
<%--                                    <input type="number" id="couponPrice" class="form-control" value="${couponDetailList.discountingPrice}" name="discountingPrice" disabled>--%>
<%--                                </li>--%>
<%--                                <li class="admin_form_textfield">--%>
<%--                                    <label for="issueDate" class="form-label">발급일</label>--%>
<%--                                    <input type="text" id="issueDate" class="form-control" value="${couponDetailList.createdAt}" name="createdAt" disabled>--%>
<%--                                </li>--%>
<%--                                <li class="admin_form_textfield">--%>
<%--                                    <label for="expirationDate" class="form-label">만료일</label>--%>
<%--                                    <input type="text" id="expirationDate" class="form-control" value="${couponDetailList.expiredAt}" name="expiredAt" disabled>--%>
<%--                                </li>--%>
<%--                                <li class="admin_form_textfield">--%>
<%--                                    <label for="expires" class="form-label">쿠폰 만료 여부</label>--%>
<%--                                    <input type="text" id="expires" class="form-control" value="${couponDetailList.isUsed}" name="isUsed" disabled>--%>
<%--                                    <c:if test="${couponDetailList.isUsed == true}">--%>
<%--                                        <td><a href="/admin/coupon-detail">${couponDetailList.createdValue}</a></td>--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${couponDetailList.isUsed == false}">--%>
<%--                                        <td><a href="/admin/coupon-detail">${couponDetailList.expiredValue}</a></td>--%>
<%--                                    </c:if>--%>
<%--                                </li>--%>
<%--                                <li class="admin_form_textfield">--%>
<%--                                    <label for="couponCont" class="form-label">쿠폰 내용</label>--%>
<%--                                    <textarea cols="30" rows="5" id="couponCont" class="form-control" name="couponContent" disabled>${couponDetailList.couponContent}</textarea>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                            <div class="admin_common_btn">--%>
<%--                                <a href="#" class="btn btn-outline-primary">삭제</a>--%>
<%--                                <a href="/admin/coupon-list" class="btn btn-primary">확인</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</main>--%>

<%--</div>--%>
<%--</div>--%>

<%--<!-- header.jsp -->--%>
<%--<%@ include file="../layout/footer.jsp" %>--%>