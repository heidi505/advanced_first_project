<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- header.jsp -->
        <%@ include file="/WEB-INF/view/layout/header.jsp" %>

            <!-- TODO 여기서부터 main영역 -->
            <div class="nav_bg_preview">
                <div class="container">
                    <!-- 기본 메세지 -->
                    <section>
                        <div>
                            <div class="p-1 border">
                                <sapn><a href="">👈검색 결과로 돌아가기</a></sapn>
                                <h3 style="text-align: center;">선택한 항공권</h3>
                            </div>
                            <div class="p-3 text-white"
                                style="background-color: var(--primary_01); text-align: center;">
                                <span>
                                    <h2>훌륭한 선택을 하셨습니다! 지금 이 가격을 놓치지 마세요!</h2>
                                </span>
                            </div>
                    </section>

                    <!-- 왼쪽 항공편 정보 -->
                    <div style="display: flex; justify-content: space-between;">
                        <section style="width: 75%;">
                            <div class="" id="">
                                <div class="" style="display: block;">
                                    <!-- 가는편 -->
                                    <div class="" style="display: block; margin-top: 15px;">
                                        <div class="">
                                            <div class="" style="margin-bottom: 15px;">
                                                <h4>
                                                    <span class="btn-primary"
                                                        style="padding: 2px; border-radius: 7%">가는편</span>
                                                    <strong class="">서울 (ICN)</strong><span style="padding: 10px;"> ✈
                                                    </span><strong class="">도쿄
                                                        (NRT)</strong>
                                                    <span class="">12월 12일</span>
                                                </h4>
                                            </div>
                                            <ul>
                                                <li>
                                                    <div class="" style="border: 1px solid var(--form);">
                                                        <div class="">
                                                            <div class=""
                                                                style="border-bottom: 1px solid var(--line); padding: 15px; display: flex; align-items: center;">
                                                                <span class="ico_airline">
                                                                    <img src="../images/RS.png"
                                                                        style="width: 2em; height: 2em; margin-right: 10px;"></span>
                                                                <span>에어서울</span>
                                                                <span class="">
                                                                    <span class="">16:40<span>ICN</span></span>
                                                                    <span class=""><span class=""></span><span
                                                                            class="">02시간
                                                                            20분</span></span>
                                                                    <span class="">19:00<span>NRT </span></span>
                                                                </span>
                                                                <span class="">직항</span>
                                                            </div>
                                                        </div>
                                                        <!-- 수하물 정보 -->
                                                        <div>
                                                            <!-- 내용담길 박스 -->
                                                            <div style="display: flex; margin: 20px;">
                                                                <!-- 왼쪽 화면 -->
                                                                <div style="width: 25%;">
                                                                    <div>
                                                                        <p>
                                                                            <span>진에어 0103</span>
                                                                        </p>
                                                                    </div>
                                                                    <div style="margin-top: 15px;">
                                                                        <p style="margin-bottom: 5px;">
                                                                            <span>🧳</span>
                                                                            <span>무료수화물 15kg</span>
                                                                        </p>
                                                                        <p>
                                                                            <span>🪑</span>
                                                                            <span>일반석</span>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <!-- 오른쪽 화면 -->
                                                                <div style="width: 10%; text-align: end;">
                                                                    <span class="">1월 4일</span>
                                                                </div>
                                                                <div class="">
                                                                    <span class=""
                                                                        style="background: url(../images/ico_from_to.png); background-size: auto 100%; background-repeat: repeat-y; display: inline-block; line-height: 2span; padding-left: 20px; padding-right: 20px; color: transparent; margin-left: 45px;">
                                                                        <p>여</p>
                                                                        <p>.</p>
                                                                        <p>.</p>
                                                                        <p>정</p>
                                                                    </span>
                                                                </div>
                                                                <div class="">
                                                                    <p style="margin-bottom: 10px;">
                                                                        <span class="">18:00<span>서울 ICN</span>
                                                                            T2</span>
                                                                    </p>
                                                                    <p style="margin-bottom: 10px;">
                                                                        <span class="">
                                                                            <span class="">05시간 30분</span>
                                                                        </span>
                                                                    </p>
                                                                    <p>
                                                                        <span class="">22:30<span>코타키나발루 BKI</span>
                                                                            T1</span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 오는편 -->
                                    <div class="" style="display: block; margin-top: 15px;">
                                        <div class="">
                                            <div class="" style="margin-bottom: 15px;">
                                                <h4>
                                                    <span class="btn-primary"
                                                        style="padding: 2px; border-radius: 7%;">오는편</span>
                                                    <strong class="">도쿄 (NRT)</strong><span
                                                        style="padding: 10px;">✈</span><strong class="">서울
                                                        (ICN)</strong>
                                                    <span class="">12월 15일</span>
                                                </h4>
                                            </div>
                                            <ul>
                                                <li>
                                                    <div class="" style="border: 1px solid var(--form);">
                                                        <div class="">
                                                            <div class=""
                                                                style="border-bottom: 1px solid var(--line); padding: 15px; display: flex; align-items: center;">
                                                                <span class="ico_airline">
                                                                    <img src="../images/RS.png"
                                                                        style="width: 2em; height: 2em; margin-right: 10px;"></span>
                                                                <span>에어서울</span>
                                                                <span class="">
                                                                    <span class="">13:10<span>NRT</span></span>
                                                                    <span class=""><span class=""></span>02시간
                                                                        35분</span>
                                                                    <span class="">15:45<span>ICN </span></span>
                                                                </span>
                                                                </span>
                                                                <span class="">직항</span>
                                                            </div>
                                                        </div>
                                                        <!-- 수하물 정보 -->
                                                        <div>
                                                            <!-- 내용담길 박스 -->
                                                            <div style="display: flex; margin: 20px;">
                                                                <!-- 왼쪽 화면 -->
                                                                <div style="width: 25%;">
                                                                    <div>
                                                                        <p>
                                                                            <span>에어서울 0103</span>
                                                                        </p>
                                                                    </div>
                                                                    <div style="margin-top: 15px;">
                                                                        <p style="margin-bottom: 5px;">
                                                                            <span>🧳</span>
                                                                            <span>무료수화물 15kg</span>
                                                                        </p>
                                                                        <p>
                                                                            <span>🪑</span>
                                                                            <span>일반석</span>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <!-- 오른쪽 화면 -->
                                                                <div style="width: 10%; text-align: end;">
                                                                    <span class="">12월 1일</span>
                                                                </div>
                                                                <div class="">
                                                                    <span class=""
                                                                        style="background: url(../images/ico_from_to.png); background-size: auto 100%; background-repeat: repeat-y; display: inline-block; line-height: 2span; padding-left: 20px; padding-right: 20px; color: transparent; margin-left: 45px;">
                                                                        <p>여</p>
                                                                        <p>.</p>
                                                                        <p>.</p>
                                                                        <p>정</p>
                                                                    </span>
                                                                </div>
                                                                <div class="">
                                                                    <p style="margin-bottom: 5px;">
                                                                        <span class="">18:00<span>코타키나발루 BKI</span>
                                                                            T1</span>
                                                                    </p>
                                                                    <p style="margin-bottom: 5px;">
                                                                        <span class="">
                                                                            <span class="">05시간 30분</span>
                                                                        </span>
                                                                    </p>
                                                                    <p>
                                                                        <span class="">22:30<span>서울 ICN</span>
                                                                            T2</span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                        </section>

                        <!-- 오른쪽 금액 정보 -->
                        <section style="width: 25%; margin-top: 15px; margin-left: 50px;">
                            <!-- 예약 가격 확인 -->
                            <div>
                                <div>
                                    <div style="color: var(--primary_02);  font-weight: 800; margin-left: 10px;">
                                        <span">서울 <img src="../images/ico_from_to_02.png"
                                                style="width: 1em; height: 1em;"> 도쿄</span>
                                    </div>
                                    <div style="border-bottom: 1px solid var(--form); padding: 10px;">12월 12일 - 12월
                                        15일 · 승객 1명</div>
                                    <div>
                                        <!-- 요금포 -->
                                        <div>
                                            <h2 style="border-bottom: 1px solid var(--form); padding: 10px;">
                                                <a>성인 <string>1명</string></a>
                                            </h2>
                                            <div style="border-bottom: 1px solid var(--form); padding: 10px;">
                                                <table>
                                                    <colgroup>
                                                        <col style="width: 40%;">
                                                        <col style="width: 30%;">
                                                        <col style="width: 30%;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <td>항공요금</td>
                                                            <td>1명</td>
                                                            <td class="k1_tar">231,600원</td>
                                                        </tr>
                                                        <tr>
                                                            <td>유류할증료</td>
                                                            <td>1명</td>
                                                            <td class="k1_tar">62,400원</td>
                                                        </tr>
                                                        <tr>
                                                            <td>제세공과금</td>
                                                            <td>1명</td>
                                                            <td class="k1_tar">63,400원</td>
                                                        </tr>
                                                        <tr>
                                                            <td>발권수수료</td>
                                                            <td>1명</td>
                                                            <td>10,000원</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div style="border-bottom: 1px solid var(--form); padding: 10px;">
                                                <table>
                                                    <colgroup>
                                                        <col style="width: 40%;">
                                                        <col style="width: 30%;">
                                                        <col style="width: 30%;">
                                                    </colgroup>
                                                    <tfoot>
                                                        <tr>
                                                            <td>성인 총 요금</td>
                                                            <td></td>
                                                            <td>367,400원</td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- 성인요금 -->
                                        <div class=""
                                            style="display: flex; align-items: center; justify-content: space-between; padding: 15px;">
                                            <div>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <h2>총 요금</h2>
                                                        <td></td>
                                                        <td></td>
                                                        </td>
                                                        <td>
                                                        <td><span style="font-size: x-small;">세금 및 수수료 포함</span></td>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </div>
                                            <div>
                                                <b style="margin-right: 25px;">367,400<span>원</span></b>
                                            </div>
                                        </div>
                                        <div style="display: flex; align-items: center; justify-content: center;">
                                            <div class="btn btn-primary" style="width: 250px;">
                                                항공권 예약하기</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>






            </div>

            </div>
            </div>
            </div>
            <script src="js/javascript.js"></script>
            <!-- footer.jsp -->
            <%@ include file="/WEB-INF/view/layout/footer.jsp" %>