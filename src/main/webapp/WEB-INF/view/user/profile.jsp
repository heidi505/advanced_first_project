<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>


<!-- TODO 여기서부터 main영역 -->

<main class="profile_page">
    <section class="profile_box_area">
        <div class="container">
            <h1 class="w-100 mt-4 mb-4 ms-4"><b>프로필 관리</b></h1>
            <div class="left_profile float-start w-25">
                <div class="picture text-center mb-4 mx-4 border">
                    <div class="profile_image"></div>
                    <p class="my-4 fs-5">${principal.username}</p>
                </div>
                <div class="coupon_profile col ">
                    <div class="coupon_count border mx-auto m-2 p-4 w-85 ">
                        내 쿠폰<a class="color_primary02 float-end me-2" href="/user/coupon">${couponNum}
                        ></a>
                    </div>
                </div>
                <!-- 쿠폰 창 끝 -->
            </div>
            <!-- 여기까지 left-profile -->

            <div class="profile_box float-end d-flex flex-column border p-5 w-75">
                <div>
                    <button class="go_management border rounded px-4 py-2 float-end me-5"><a
                            href="/user/profile-management">편집</a></button>
                </div>
                <div class="picture text-center w-100">
                    <div class="position-relative">
                        <div class="position-relative">
                            <div class="mb-3 input_profile_image">
                                <img class="profile_image_item" src="/images/basic_img.svg" alt="기본이미지" id="preview">
                            </div>
                        </div>
                    </div>
                    <div class="my-4">${principal.username}</div>
                </div>
                <!-- 프로필 사진 창 끝 -->
                <div class="profile_info row row-cols-2 w-100 mx-auto">
                    <div class="type_name form-group col p-3">
                        <p for="realName">이름</p>
                    </div>
                    <div class="form-group col w-75 mb-3 p-3 ms-2">
                        <span class="realName">${principal.username}</span>
                    </div>
                    <div class="type_name form-group col p-3">
                        <p for="userName">아이디</p>
                    </div>
                    <div class="form-group col w-75 mb-3 p-3 ms-2">
                        <span class="userName">${principal.username}</span>
                    </div>
                    <div class="type_name form-group col p-3">
                        <p class="userTel">연락처</p>
                    </div>
                    <div class="form-group col w-75 mb-3 p-3 ms-2">
                        <span class="userTel">${principal.phoneNumber}</span>
                    </div>
                    <div class="type_name form-group col p-3">
                        <p class="email">이메일</p>
                    </div>
                    <div class="form-group col w-75 mb-3 p-3 ms-2">
                        <span class="email">${principal.email}</span>
                    </div>
                    <div class="type_name col p-3">
                        <p class="snsLink" class="me-5">SNS 연동</p>
                    </div>
                    <div class="form-group col  form-check form-switch w-75 mb-3 p-3 ms-2">
                        <label for="kakaoLink" class="me-5"><img
                                src="https://dffoxz5he03rp.cloudfront.net/icons/kakaotalk-logo.svg"/> 카카오 연동</label>
                        <input type="checkbox" id="kakaoLink" class=" form-check-input sns_link float-end"
                               role="switch"/>
                    </div>
                    <div class="type_name form-group col p-3">
                        <p for="password" class="me-5">비밀번호</p>
                    </div>
                    <div class="form-group col w-75 mb-5 p-3 ms-2">
                        <span>*******</span>
                    </div>
                </div>
            </div>
            <!-- 프로필 상세 창 끝 -->
            <!-- 우측 프로필 창 끝 -->
        </div>
        <!-- 프로필 관리 창 끝 -->
    </section>
</main>
</div>
</div>

<script src="/js/profile.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>