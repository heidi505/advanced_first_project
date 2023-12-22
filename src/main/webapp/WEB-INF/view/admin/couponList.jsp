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
                        <c:forEach var="coupons" items="${couponExpiredList}">
                            <tr>
                                <td><a href="/admin/coupon-expired-detail/${coupons.id}">${coupons.id}</a></td>
                                <td><a href="/admin/coupon-expired-detail/${coupons.id}">${coupons.couponName}</a></td>
                                <td><a href="/admin/coupon-expired-detail/${coupons.id}">${coupons.couponNumber}</a>
                                </td>
                                <td><a href="/admin/coupon-expired-detail/${coupons.id}">${coupons.createdAt}
                                    ~ ${coupons.expiredAt}</a></td>
                                <td><a href="/admin/coupon-expired-detail/${coupons.id}">${coupons.discountingPrice}</a>
                                </td>
                                <c:if test="${coupons.isUsed == true}">
                                    <td><a href="/admin/coupon-expired-detail/${coupons.id}">${coupons.createdValue}</a>
                                    </td>
                                </c:if>
                                <c:if test="${coupons.isUsed == false}">
                                    <td><a href="/admin/coupon-expired-detail/${coupons.id}">${coupons.expiredValue}</a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
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
                            <th>사용자 이름</th>
                            <th>쿠폰 이름</th>
                            <th>쿠폰 발급 번호</th>
                            <th>쿠폰 발급일 & 만료일</th>
                            <th>쿠폰 금액</th>
                            <th>문자 발송</th>
                        </tr>
                        </thead>
                        <tbody class="common_list_cont">
                        <c:forEach var="coupons" items="${couponList}">
                            <tr>
                                <td><a href="/admin/coupon-detail/${coupons.id}">${coupons.id}</a></td>
                                <td><a href="/admin/coupon-detail/${coupons.id}">${coupons.username}</a></td>
                                <td><a href="/admin/coupon-detail/${coupons.id}">${coupons.couponName}</a></td>
                                <td><a href="/admin/coupon-detail/${coupons.id}">${coupons.couponNumber}</a></td>
                                <td><a href="/admin/coupon-detail/${coupons.id}">${coupons.createdAt}
                                    ~ ${coupons.expiredAt}</a></td>
                                <td><a href="/admin/coupon-detail/${coupons.id}">${coupons.discountingPrice}</a></td>
                                <td>
                                    <button class="btn btn-primary" type="button" id="couponSMSBtn">발송</button>
                                </td>
                            </tr>

                            <input type="hidden" name="userId" id="userId" value="${coupons.userId}">
                            <input type="hidden" name="username" id="username" value="${coupons.username}">
                            <input type="hidden" name="couponName" id="couponName"  value="${coupons.couponName}">
                            <input type="hidden" name="couponNumber" id="couponNumber"  value="${coupons.couponNumber}">
                            <input type="hidden" name="discountingPrice" id="discountingPrice"  value="${coupons.discountingPrice}">
                            <input type="hidden" name="expiredAt" id="expiredAt"  value="${coupons.expiredAt}">
                        </c:forEach>
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

<script>
    const couponSMSBtn = document.querySelector("#couponSMSBtn");

    const couponData = {
        couponName: document.querySelector("#couponName").value,
        userId: document.querySelector("#userId").value,
        couponNumber: document.querySelector("#couponNumber").value,
        username: document.querySelector("#username").value,
        discountingPrice: document.querySelector("#discountingPrice").value,
        expiredAt: document.querySelector("#expiredAt").value,
    };

    couponSMSBtn.addEventListener("click", () => {
        console.log(couponData.couponName);
        console.log(couponData.couponNumber);
        console.log(couponData.userId);
        console.log(couponData.username);
        console.log(couponData.discountingPrice);
        console.log(couponData.expiredAt);


        fetch("/api/admin/couponSMS", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(couponData),
        })
            .then(response => response.json())
            .then(result => {
                alert(result);
                return result;
            })
            .catch(error => {
                alert(error);
                return error;
            });
    });

</script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>