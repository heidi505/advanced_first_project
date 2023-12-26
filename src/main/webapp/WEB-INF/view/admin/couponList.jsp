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
                        <tbody class="common_list_cont" id="couponExpiredList">
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
            <div class="list_pagination">
                <ul class="pagination" id="pagination-expired">
                    <c:choose>
                        <c:when test="${pageVO.lastPage <= 3}">
                            <c:forEach begin="1" end="${pageVO.lastPage}" var="pageNumber">
                                <li class="page-item ${pageVO.currentPage eq pageNumber ? 'active' : ''}">
                                    <a class="page-link"
                                       href="/admin/coupon-expired-list?page=${pageNumber}">
                                            ${pageNumber}
                                    </a>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:set var="startPage" value="${pageVO.currentPage - 1}"/>
                            <c:choose>
                                <c:when test="${startPage lt 1}">
                                    <c:set var="startPage" value="1"/>
                                </c:when>
                                <c:when test="${startPage gt pageVO.lastPage - 2}">
                                    <c:set var="startPage" value="${pageVO.lastPage - 2}"/>
                                </c:when>
                            </c:choose>

                            <c:forEach begin="${startPage}" end="${startPage + 2}" var="pageNumber">
                                <li class="page-item ${pageVO.currentPage eq pageNumber ? 'active' : ''}">
                                    <a class="page-link"
                                       href="/admin/coupon-expired-list?page=${pageNumber}">
                                            ${pageNumber}
                                    </a>
                                </li>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <div class="coupon_list_area mt-5">
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
                        <tbody class="common_list_cont" id="couponCurrentList">
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
                            <input type="hidden" name="couponName" id="couponName" value="${coupons.couponName}">
                            <input type="hidden" name="couponNumber" id="couponNumber" value="${coupons.couponNumber}">
                            <input type="hidden" name="discountingPrice" id="discountingPrice"
                                   value="${coupons.discountingPrice}">
                            <input type="hidden" name="expiredAt" id="expiredAt" value="${coupons.expiredAt}">
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="list_pagination">
                <ul class="pagination" id="pagination-current">
                    <c:choose>
                        <c:when test="${pageVO.lastPage <= 3}">
                            <c:forEach begin="1" end="${pageVO.lastPage}" var="pageNumber">
                                <li class="page-item ${pageVO.currentPage eq pageNumber ? 'active' : ''}">
                                    <a class="page-link"
                                       href="/admin/coupon-list?page=${pageNumber}">
                                            ${pageNumber}
                                    </a>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:set var="startPage" value="${pageVO.currentPage - 1}"/>
                            <c:choose>
                                <c:when test="${startPage lt 1}">
                                    <c:set var="startPage" value="1"/>
                                </c:when>
                                <c:when test="${startPage gt pageVO.lastPage - 2}">
                                    <c:set var="startPage" value="${pageVO.lastPage - 2}"/>
                                </c:when>
                            </c:choose>

                            <c:forEach begin="${startPage}" end="${startPage + 2}" var="pageNumber">
                                <li class="page-item ${pageVO.currentPage eq pageNumber ? 'active' : ''}">
                                    <a class="page-link"
                                       href="/admin/coupon-list?page=${pageNumber}">
                                            ${pageNumber}
                                    </a>
                                </li>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
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
                alert("문자 발송이 완료되었습니다.");
                return result;
            })
            .catch(error => {
                alert("문자 발송이 실패하였습니다.");
                return error;
            });
    });
    // 쿠폰 문자 발송

    const paginationExpired = document.getElementById("pagination-expired");
    paginationExpired.addEventListener("click", function (event) {
        if (event.target.tagName === "A") {
            event.preventDefault(); // 기본 동작 취소 (페이지 이동 방지)

            let pageNumber = parseInt(event.target.textContent, 10); // 클릭한 페이지 번호 추출
            console.log(pageNumber);
            CouponExpiredData(pageNumber); // 클릭한 페이지 번호로 데이터 가져오기
        }
    });


    async function CouponExpiredData(pageNumber) {
        await fetch("/api/admin/coupon-expired-list?page=" + pageNumber)
            .then(response => response.json())
            .then(response => {
                expiredMainLayout(response.data);
                console.log(response);
                console.log(response.data);
            })
            .catch(error => {
                console.error("데이터를 가져오는 동안 오류 발생:", error);
            });
    }

    function expiredMainLayout(data) {

        console.log("이 함수가 실행되길")
        let couponExpiredData = document.querySelector("#couponExpiredList");
        let htmlData = "";
        couponExpiredData.innerHTML = "";
        // 이 부분에서 data의 구조에 따라 적절한 처리를 해주어야 합니다.
        if (Array.isArray(data)) {
            // 배열인 경우
            data.forEach(coupon => {
                htmlData += '<tr>' +
                    '<td><a href="/admin/coupon-expired-detail/' + coupon.id + '">' + coupon.id + '</a></td>' +
                    '<td><a href="/admin/coupon-expired-detail/' + coupon.id + '">' + coupon.couponName + '</a></td>' +
                    '<td><a href="/admin/coupon-expired-detail/' + coupon.id + '">' + coupon.couponNumber + '</a></td>' +
                    '<td><a href="/admin/coupon-expired-detail/' + coupon.id + '">' + coupon.createdAt + ' ~ ' + coupon.expiredAt + '</a></td>' +
                    '<td><a href="/admin/coupon-expired-detail/' + coupon.id + '">' + coupon.discountingPrice + '</a></td>';

                if (coupon.isUsed) {
                    htmlData += '<td><a href="/admin/coupon-expired-detail/' + coupon.id + '">' + coupon.createdValue + '</a></td>';
                } else {
                    htmlData += '<td><a href="/admin/coupon-expired-detail/' + coupon.id + '">' + coupon.expiredValue + '</a></td>';
                }

                htmlData += '</tr>';

                couponExpiredData.innerHTML = htmlData;
            });
        } else {
            console.error("API 응답이 예상과 다릅니다.", data);
        }
    }

    // 만료된 쿠폰 ajax

    const paginationCurrent = document.getElementById("pagination-current");
    paginationCurrent.addEventListener("click", function (event) {
        if (event.target.tagName === "A") {
            event.preventDefault();

            let pageNumber = parseInt(event.target.textContent, 10);
            console.log(pageNumber);
            CouponData(pageNumber);
        }
    });


    async function CouponData(pageNumber) {
        await fetch("/api/admin/coupon-list?page=" + pageNumber)
            .then(response => response.json())
            .then(response => {
                currentMainLayout(response.data);
                console.log(response);
                console.log(response.data);
            })
            .catch(error => {
                console.error("데이터를 가져오는 동안 오류 발생:", error);
            });
    }

    function currentMainLayout(data) {

        console.log("이 함수가 실행되길")
        let couponCurrentList = document.querySelector("#couponCurrentList");
        let htmlData = "";
        couponCurrentList.innerHTML = "";
        if (Array.isArray(data)) {
            data.forEach(coupon => {
                htmlData += '<tr>' +
                    '<td><a href="/admin/coupon-detail/' + coupon.id + '">' + coupon.id + '</a></td>' +
                    '<td><a href="/admin/coupon-detail/' + coupon.id + '">' + coupon.username + '</a></td>' +
                    '<td><a href="/admin/coupon-detail/' + coupon.id + '">' + coupon.couponName + '</a></td>' +
                    '<td><a href="/admin/coupon-detail/' + coupon.id + '">' + coupon.couponNumber + '</a></td>' +
                    '<td><a href="/admin/coupon-detail/' + coupon.id + '">' + coupon.createdAt + ' ~ ' + coupon.expiredAt + '</a></td>' +
                    '<td><a href="/admin/coupon-detail/' + coupon.id + '">' + coupon.discountingPrice + '</a></td>' +
                    '<td><button class="btn btn-primary" type="button" id="couponSMSBtn">발송</button></td>' +
                    '</tr>'
                htmlData += '</tr>';

                couponCurrentList.innerHTML = htmlData;
            });
        } else {
            // 배열이 아닌 경우에 대한 처리
            console.error("API 응답이 예상과 다릅니다.", data);
        }
    }

</script>
<!-- header.jsp -->
<%@ include file="../layout/footer.jsp" %>