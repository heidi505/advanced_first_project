<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp" %>


<!-- TODO 여기서부터 main영역 -->
<div class="travel_container">
    <main id="my_travel_page">

        <section class="my_travel">
            <!-- <article> -->
            <div class="my_travel_box">
                <div class="my_travel_tab">
                    <h2>
                        <b>내 여행</b>
                    </h2>
                    <ul class="my_travel_menu tab_menu">
                        <li><a href="#" data-tab="planned_trip" class="tab_active ">예정된
                            여행</a></li>
                        <li><a href="#" data-tab="last_trip" class="">지난 여행</a></li>
                        <li><a href="#" data-tab="canceled_trip" class="">취소된 여행</a>
                        </li>
                    </ul>
                </div>
                <div class="my_travel_tab_content">
                    <div class="tab-content" id="planned_trip">
                    </div>
                    <div class="tab-content regions_list_item" id="last_trip">
                    </div>
                    <div class="tab-content regions_list_item" id="canceled_trip">
                    </div>
                </div>
            </div>

            <!--  </article> -->

        </section>
        <aside class="my_trip_modal_area">
            <button id="trip_modal_btn">
                <img src="/images/icons/chat_icon.svg" alt="챗 아이콘">
            </button>

            <div id="trip_modal_area" class="hidden">

                <div class="trip_modal_content">
                    <span id="modal_close_btn">
                        <img src="/images/icons/close.png" alt="닫기"/>
                     </span>
                    <p class="trip_modal_logo"><img src="/images/logo.svg" alt="님부스">
                        나의 여행 일정</p>
                    <div class="trip_schedule">
                        <div class="trip_schedule_main">
                            <div class="trip_schedule_main_img"><img src="/images/logo.svg" alt="님부스"></div>
                            <p>Travel EveryDay, <span>님부스</span>입니다</p>
                        </div>
                        <div class="trip_questions">
                            <button type="button" class="trip_question_icon">
                                <img class="trip_question_img" src="/images/icons/airplane_icon.svg" alt="비행기 아이콘">
                                항공권 문의
                            </button>
                        </div>
                        <div class="trip_answer">
                            <div class="trip_answer_box">
                                <span class="trip_modal_icon">
                                    <img src="/images/logo.svg" alt="님부스">
                                </span>
                                <div class="trip_answer_cont">
                                <span class="trip_answer_tit">님부스</span>
                                <div class="trip_answer_txt scroll">
                                    <p>
                                        여행자님, 가는편 결항으로 오는편도 환불 신청이 필요하신가요?
                                    </p>
                                    <p>
                                        <span class="trip_answer_sub_tit">* 신청방법</span>
                                        flights@myrealtrip.com 메일로 서류와 함께 아래 3가지 모두 작성하여 제출해주세요.
                                    </p>
                                    <p>
                                        <span  class="trip_answer_sub_tit">* 필요서류</span>
                                        1. 결항 확인서(탑승객명/일정/결항사유 : 기상악화 기재 必)
                                        2. 탑승객 신분증 사본 (에어서울/RS)
                                        ※민감 정보는 마스킹 처리 후 제출
                                    </p>
                                    <p>
                                        <span  class="trip_answer_sub_tit">* 내용 (3가지 모두 기재)</span>
                                        1. 예약번호(출발편/복편 모두)
                                        2. 환불요청 탑승객 성함
                                        3. 출발 편 결항으로 인한 복편 전액 환불 요청
                                    </p>
                                </div>
                            </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </aside>

    </main>
</div>
</div>
</div>
</div>
<script src="/js/make_element.js"></script>
<script src="/js/my_travel.js"></script>
<script type="text/javascript">
    //결제 취소 이벤트
    const plannedTrip = document.getElementById(`planned_trip`);
    plannedTrip.addEventListener(`click`, e => {
        if (e.target.id == `kakaoPayCancel`) {
            if (confirm(`결제를 취소하시겠습니까?`)) kakaoCancel();
        }
    });

    // 처음 목록 출력
    getMyTravel(tripEnum.PLANNED, isPayedEnum.ALL);

    const tabButtons = document.querySelectorAll(".tab_menu li a");
    const tabContents = document.querySelectorAll(".tab-content");

    tabButtons.forEach((button) => {
        button.addEventListener("click", function (event) {
            event.preventDefault();

            tabContents.forEach((content) => {
                content.style.display = "none";
            });

            tabButtons.forEach((btn) => {
                btn.classList.remove("tab_active");
            });

            const tabId = button.getAttribute("data-tab");
            document.getElementById(tabId).style.display = "block";

            //데이터를 가져와 출력하는 함수
            getMyTravel(tabId, isPayedEnum.ALL);
            button.classList.add("tab_active");
        });
    });

    // 결제여부에 따른 목록 보기
    tabContents.forEach((button) => {
        button.addEventListener('click', (e) => {
            let tabId = button.id;
            if (e.target.classList.contains('my_trip_count_label') ||
                e.target.classList.contains('my_trip_num')) {
                let sort = '';
                if (e.target.classList.contains('my_trip_num')) {
                    let myTripCountLabel = e.target.parentElement;
                    sort = myTripCountLabel.innerText.split(e.target.innerText)[0];
                } else {
                    sort = e.target.innerText.split(e.target.childNodes[1].innerText)[0];
                }
                getMyTravel(tabId, sort);
            }
        })
    });

    // 결제 취소하기
    function kakaoCancel() {
        fetch(`/kakaoPay/cancel`
            , {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "charset": "UTF-8"
                },
            }).then(response => response.json())
            .then(result => {
                alert(result.data);
            })
            .catch(result => {
                alert(result.data);
            })
    }


    const tripModalBtn = document.getElementById('trip_modal_btn');
    const modalCloseButton = document.getElementById('modal_close_btn');
    const tripModal = document.getElementById('trip_modal_area');

    tripModalBtn.addEventListener('click', () => {
        tripModal.classList.remove('hidden');
    });

    modalCloseButton.addEventListener('click', () => {
        tripModal.classList.add('hidden');
    });


    const tripQuestionIcon = document.querySelector(".trip_question_icon");
    const tripAnswer = document.querySelector(".trip_answer");
    const tripQuestionImg = document.querySelector(".trip_question_img");

    const defaultImagePath = "/images/icons/airplane_icon.svg";
    const clickedImagePath = "/images/icons/airplane_icon_wh.svg";
    let isClicked = false;

    tripQuestionIcon.addEventListener("click", () => {
        tripAnswer.style.transition = "max-height 0.7s";
        tripAnswer.style.maxHeight = isClicked ? "0" : "1000px"; // 토글된 상태에 따라 최대 높이 변경
        tripQuestionIcon.style.backgroundColor = isClicked ? "initial" : "var(--primary_02)"; // 토글된 상태에 따라 배경색 변경
        tripQuestionIcon.style.color = isClicked ? "var(--primary_02)" : "var(--basic_wh)"; // 토글된 상태에 따라 텍스트 색상 변경

        // 클릭 상태에 따라 이미지 변경
        tripQuestionImg.src = isClicked ? defaultImagePath : clickedImagePath;

        // 클릭 상태 업데이트
        isClicked = !isClicked;
    });


</script>

<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>