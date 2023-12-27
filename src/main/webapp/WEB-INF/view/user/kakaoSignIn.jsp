<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>



<!-- TODO 여기서부터 main영역 -->

<main class="kakao_sign_in_page">
    <div class="container">
        <div class="section">
            <div class="mx-auto">
                <div class="d-flex flex-column border mx-auto w-40 ">
                    <div class="top_bar p-3 border"><h2>로그인</h2></div>
                    <img class="w-50 mx-auto mt-5" src="/images/logo.svg"/>
                    <h2 class="mx-auto mb-4 text-center"><b class="color_primary02 lh-lg">진짜 나다운 여행</b>
                        <b>을<br>
                            시작해보세요</b></h2>
                    <div class="w-100 mx-auto d-flex mb-2 ">
                        <button type="button" class="w-100 mb-2" >
                            <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=bd176db587eb198984842f426ddb64c0&redirect_uri=http://localhost:8080/kakao-redirect&prompt=login">
                                <img class="kakao_logo" src="/images/kakao_login_medium_wide.png"/></a>
                        </button>
                    </div>
                    <!-- fcm 토큰과 클라이언트 식별자 input -->
					<input id="installationId" type="hidden" name="installationId" value="">
					<input id="fcmToken" type="hidden" name="fcmToken" value="">
                    <div class="w-75 mx-auto d-flex mb-5 ">
                        <a href="/sign-in" class="mx-auto" href="/user/sign-in"><b>로그인</b></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

</div>
</div>
<script type="module" src="/js/firebase.js"></script>
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>