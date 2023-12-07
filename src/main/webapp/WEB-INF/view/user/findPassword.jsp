<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>


<!-- TODO 여기서부터 main영역 -->
<main class="sign_in_page">
    <div class="container">
        <div class="section">
            <div class="mx-auto w-35">
                <div class="top_bar p-3 border"><h2>비밀번호 찾기</h2></div>
                    <div class="flex-column w-100">
                        <div class="form-group w-80 mx-auto pt-2 mt-2">
                            <label for="emailforpw">이메일</label><br> <input type="text"
                                                                       class="form-control w-85 mt-2 p-2 d-inline"
                                                                       name="email"
                                                                       id="emailforpw" placeholder="이메일을 입력해주세요"/>
                        </div>
                        <div class="form-group w-75 mx-auto mb-5 mt-4">
                            <button type="submit" class="btn btn-primary p-2 w-100" onclick="setPassword(event)">비밀번호 변경하기</button>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</main>
</div>
</div>

<script>
    async function setPassword(event){
        event.preventDefault();



        let email = document.querySelector("#emailforpw").value;

        let response = await fetch("/find-password/email?email="+email, {
            method: "get",
            headers: {
                "Content-Type": "application/json",
            },
        });
        //여기까지 사용자의 이메일을 보내준 코드

        let responseBody = await response.json();
        if (responseBody.success) {
            alert(responseBody.data);
        } else {
            alert(responseBody.data);
        }

        return false;
    }
</script>
<!-- <script src="/js/javascript.js"></script> -->
<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>
