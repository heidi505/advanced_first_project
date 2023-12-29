<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>

<!-- TODO 여기서부터 main영역 -->

<div class="container">
    <main class="profile_management_page">
        <section class="profile_box_area">
            <h1 class="mt-4 mb-4 ms-4 w-100">
                <b>프로필 관리</b>
            </h1>
            <div class="left_profile float-start w-25">
                <div class="picture text-center mb-4 mx-4 border">
                    <div class="input_profile_image">
                        <c:choose>
                            <c:when test="${not empty principal and not empty principal.profileImage}">
                                <div class="mt-4">
                                    <img class="preview" src="<c:url value='/image/${principal.profileImage}'/>" alt="프로필 이미지">
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="mt-4">
                                    <img class="preview" src="<c:url value='/image/basic_img.svg'/>" alt="기본 이미지">
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <p class="my-4 principal_username">${principal.realName}</p>
                </div>
                <div class="coupon_profile col ">
                    <div class="coupon_count border mx-auto m-2 p-4 w-85 ">
                        내 쿠폰<a class="color_primary02 float-end me-2" href="/user/coupon">9
                        ></a>
                    </div>
                </div>
                <!-- 쿠폰 창 끝 -->
            </div>
            <!-- 여기까지 left-profile -->
            <form action="/user/profile-management" method="post" enctype="multipart/form-data">
                <div class="profile_box float-end d-flex flex-column border p-5 w-75">
                    <div class="picture text-center w-100 p-3">
                        <div class="mb-3 picture_box">
                            <c:choose>
                                <c:when test="${not empty principal and not empty principal.profileImage}">
                                    <div class="profile_image">
                                        <img class="preview" src="<c:url value='/image/${principal.profileImage}'/>" alt="프로필 이미지">
                                        <div class="profile_file_box">
                                            <label class="input_file_custom" for="inputFile"/>
                                            <input type="file" class="form-control picture_select" id="inputFile"
                                                   accept="image/*" name="profileImage">
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="profile_image">
                                        <img class="preview" src="<c:url value='/image/basic_img.svg'/>" alt="기본 이미지">
                                        <div class="profile_file_box">
                                            <label class="input_file_custom" for="inputFile"/>
                                            <input type="file" class="form-control picture_select" id="inputFile"
                                                   accept="image/*" name="profileImage">
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <p class="principal_username form-label my-4">${principal.realName}</p>
                    </div>
                    <!-- 프로필 사진 창 끝 -->
                    <div class="profile_info row row-cols-2 w-100 mx-auto">
                        <div class="type_name form-group col p-3">
                            <p class="realName">이름</p>
                        </div>
                        <div class="form-group col w-75 mb-3 p-3 ms-2">
                            <span class="realName">${principal.realName}</span>
                        </div>
                        <div class="type_name form-group col p-3">
                            <p class="userName">아이디</p>
                        </div>
                        <div class="form-group col w-75 mb-3 p-3 ms-2">
                            <span class="userName">${principal.username}</span>
                        </div>
                        <div class="type_name form-group col p-3">
                            <label for="userTel">연락처</label>
                        </div>
                        <div class="form-group col w-75 mb-3 ">
                            <input type="text" class="userTel form-control m-1 d-inline w-100" name="phoneNumber"
                                   id="userTel" value="${principal.phoneNumber}">
                        </div>
                        <div class="type_name form-group col p-3">
                            <label for="email">이메일</label>
                        </div>
                        <div class="form-group col w-75 mb-3 ">
                            <input type="text" class="email form-control m-1 d-inline w-100" name="email" id="email"
                                   value="${principal.email}">
                        </div>
                        <div class="type_name col p-3">
                            <p class="snsLink" class="me-5">SNS 연동</p>
                        </div>
                        <div
                                class="form-group col form-check form-switch w-75 mb-3 p-3 ms-2">
                            <label for="kakaoLink" class=""><img
                                    src="https://dffoxz5he03rp.cloudfront.net/icons/kakaotalk-logo.svg"/>
                                카카오 연동</label>
                            <c:choose>
                            <c:when test="${principal.isKaKao() == true}">
                            <input type="checkbox" id="kakaoLink"
                                                      class="form-check-input sns_link float-end" role="switch"
                                                      name="snsLink" checked readonly/>
                            </c:when>
                                <c:otherwise>
                                    <input type="checkbox" id="kakaoLink"
                                           class="form-check-input sns_link float-end" role="switch"
                                           name="snsLink"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="type_name form-group col p-3">
                            <label for="password" class="me-5">비밀번호</label>
                        </div>
                        <div class="form-group col w-75 mb-3 ">
                            <input type="password" class="password form-control m-1 d-inline w-100" name="password"
                                   id="password" value="${principal.password}">
                        </div>
                    </div>
                    <!-- 프로필 상세 창 끝 -->
                    <hr>
                    <div class="mt-3 mx-auto w-100">
                        <button class="btn btn_cancel w-49 me-2">취소하기</button>
                        <button class="btn btn-primary w-49">저장하기</button>
                    </div>
                </div>
            </form>
            <!-- 우측 프로필 창 끝 -->
        </section>
    </main>
    <!-- 프로필 관리 창 끝 -->
</div>

</div>
</div>
<script>
    let profileImage = document.querySelector("#inputFile");
    let imagePreviews = document.querySelectorAll(".preview");

    profileImage.addEventListener("change", (e) => {
        let file = e.currentTarget.files[0];

        if (!file.type.match("image/.*")) {
            alert("이미지를 등록해주세요");
            return;
        }

        let reader = new FileReader();

        reader.onload = function (e2) {
            // 모든 프리뷰 이미지에 대해 변경
            imagePreviews.forEach((preview) => {
                preview.src = e2.target.result;
            });
        };

        reader.readAsDataURL(file);
    });

    // 전송코드X , 미리보기코드임
    // function changePic(el) {
    //     console.log("event1" + el);
    //     // 클릭, 마우스 이동, 키 입력 등의 이벤트에서 사용
    //     // event
    //     let f = el.srcElement.files[0];
    //     console.log(f.type);
    //     if(!f.type.match("image.*")){
    //         alert("이미지를 등록해주세요");
    //         return;
    //     }
    //     // IO파일, 0번지는 그 파일의 정보, 파일 객체를 찾아옴 - 현재 실제 파일은 아님 ( 하드디스크에 있음 )
    //     let reader = new FileReader();
    //     // readline에서 파일을 읽어옴 (하드디스크에 있는 파일을 메모리에 끌어올릴려고)
    //     reader.onload = function(e2) { // 파일이 다 읽어지면 콜백됨
    //         console.log("숫자 1 " + 1);
    //         console.log("event2" + e2);
    //         // ProgressEvent는 파일 읽기의 진행 상황을 다루는 이벤트이며,
    //         // 파일 업로드, 데이터 다운로드 등과 같이 진행 상황이 중요한 작업에 사용
    //         let previewEl = document.querySelector("#preview");
    //         preview.setAttribute("src", e2.target.result);
    //         // 이 이벤트의 타겟 result(파일이) 들어가있는 것을 바꿔줌
    //     }
    //     reader.readAsDataURL(f); // 파일 읽기, 파일을 다 읽어내면 onload함수 ,
    //     // 콜백함수 onload()
    //     // 다른 이벤트가 끝냈을 때 실행해주는 것
    //     // 메인스레드는 빠져나와서 이벤트 루프에 가서 확인, 다운 다돼서 onload 함수 실행되면서
    //     console.log("숫자 2" + 2);
    //
    //     // 자바스크립트는 사진을 base64로 인코딩해서 관리
    // }

</script>
<script src="/js/javascript.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>