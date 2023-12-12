<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공권 선택</title>
</head>
<body>

<div class="1">
    <h3>항공권 리스트 페이지</h3>
    <div class="t1" onclick="copyData(this)">
        A
        <span>도시A</span>
        <span>날짜A</span>
    </div>
    <div class="t2" onclick="copyData(this)">
        B
        <span>도시B</span>
        <span>날짜B</span>
    </div>
</div>

<div class="2">
    <h3>내가 선택한 항공권 페이지</h3>
    <div id="selectedFlight">
        <span>도시</span>
        <span>날짜</span>
    </div>
</div>

<script>
    function copyData(element) {
        // 클래스 1에서 선택한 span의 내용 가져오기
        var city = element.querySelector('span:nth-child(1)').innerText;
        var date = element.querySelector('span:nth-child(2)').innerText;

        // 클래스 2의 span에 내용 설정
        var selectedFlightElement = document.getElementById('selectedFlight');
        selectedFlightElement.innerHTML = '<span>' + city + '</span><span>' + date + '</span>';
    }
</script>

</body>
</html>