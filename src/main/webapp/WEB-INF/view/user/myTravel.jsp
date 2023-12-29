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
                    <div>
						<nav aria-label="Page navigation example">
  							<ul class="pagination justify-content-center">
    							<li class="page-item">
      								<a class="page-link" href="#" aria-label="Previous">
        								<span aria-hidden="true">&lt;</span>
      								</a>
    							</li>
    							<li class="page-item active"><a class="page-link" href="#">${maxYear}</a></li>
    							<li class="page-item"><a class="page-link" href="#">${maxYear-1}</a></li>
    							<li class="page-item"><a class="page-link" href="#">${maxYear-2}</a></li>
    							<li class="page-item"><a class="page-link" href="#">${maxYear-3}</a></li>
    							<li class="page-item"><a class="page-link" href="#">${maxYear-4}</a></li>
    							<li class="page-item">
      							<a class="page-link" href="#" aria-label="Next">
        						<span aria-hidden="true">&gt;</span>
      							</a>
    							</li>
  							</ul>
						</nav>
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
                        나의 여행 준비</p>
                    <div class="trip_schedule">
                        <div class="trip_schedule_main">
                            <div class="trip_schedule_main_img"><img src="/images/logo.svg" alt="님부스"></div>
                            <p>Travel EveryDay, <span>님부스</span>입니다</p>
                        </div>
                        <div class="trip_questions">
                            <button type="button" class="trip_question_icon" id="plan">
                                <img class="trip_question_img" src="/images/icons/airplane_icon.svg" alt="비행기 아이콘">
                                내 여행 계획 세워줘!
                            </button>
                        </div>
                        <div class="trip_questions">
                            <button type="button" class="trip_question_icon" id="supplies">
                                <img class="trip_question_img" src="/images/icons/airplane_icon.svg" alt="비행기 아이콘">
                                준비물 뭐 챙겨야할까?
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
    const maxYear = '${maxYear}';
    if(maxYear != ''){
    	getMyTravel(tripEnum.PLANNED, isPayedEnum.ALL, maxYear);
    	currentPeriod = maxYear;
    } else {
    	// 자료 없음
    	getMyTravel(tripEnum.PLANNED, isPayedEnum.ALL, '0');
    	currentPeriod = '0';
    }
    pages[1].classList.add('active');
    

    // 결제여부에 따른 목록 보기
    tabContents.forEach((button) => {
        button.addEventListener('click', (e) => {
            let tabId = button.id;
            if (e.target.classList.contains('my_trip_count_label') ||
                e.target.classList.contains('my_trip_num')) {
                let sort = '';
                if (e.target.classList.contains('my_trip_num')) {
                    let myTripCountLabel = e.target.parentElement;
                    myTripCountLabel.style.background = `var(--primary02)`;
                    sort = myTripCountLabel.innerText.split(e.target.innerText)[0];
                } else {
                    sort = e.target.innerText.split(e.target.childNodes[1].innerText)[0];
                    e.target.style.background = `var(--primary02)`;
                }
                
                getMyTravel(tabId, sort, currentPeriod);
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



    //     tripQuestionIcon.addEventListener("click", () => {
    //         tripAnswer.style.transition = "max-height 0.7s";
    //         tripAnswer.style.maxHeight = isClicked ? "0" : "1000px"; // 토글된 상태에 따라 최대 높이 변경
    //         tripQuestionIcon.style.backgroundColor = isClicked ? "initial" : "var(--primary_02)"; // 토글된 상태에 따라 배경색 변경
    //         tripQuestionIcon.style.color = isClicked ? "var(--primary_02)" : "var(--basic_wh)"; // 토글된 상태에 따라 텍스트 색상 변경
    //
    //         // 클릭 상태에 따라 이미지 변경
    //     tripQuestionImg.src = isClicked ? defaultImagePath : clickedImagePath;
    //
    //     // 클릭 상태 업데이트
    //     isClicked = !isClicked;
    // });

    let plan = document.getElementById("plan");
    let supplies = document.getElementById("supplies");


    let gptAnswer = document.querySelector(".trip_answer_txt");

    plan.addEventListener("click", async function (){

        tripAnswer.style.transition = "max-height 0.7s";
        tripAnswer.style.maxHeight = isClicked ? "0" : "1000px"; // 토글된 상태에 따라 최대 높이 변경
        plan.style.backgroundColor = isClicked ? "initial" : "var(--primary_02)"; // 토글된 상태에 따라 배경색 변경
        plan.style.color = isClicked ? "var(--primary_02)" : "var(--basic_wh)"; // 토글된 상태에 따라 텍스트 색상 변경

        // 클릭 상태에 따라 이미지 변경
        tripQuestionImg.src = isClicked ? defaultImagePath : clickedImagePath;

        // 클릭 상태 업데이트
        isClicked = !isClicked;

        setTimeout(loading(), 2000);

        let response = await fetch("/user/gpt/plan", {
            method:"get",
            headers:{
                "Content-Type":"application/json"
            }
        });
        let responseBody = await response.text();

        console.log('응답'+responseBody);

        let htmlData = "";
        gptAnswer.innerHTML = responseBody;

    });

    function loading() {
        let data = "";
        gptAnswer.innerHTML = "<p>Loading...</p>"
    }

    supplies.addEventListener("click", async function (){
        tripAnswer.style.transition = "max-height 0.7s";
        tripAnswer.style.maxHeight = isClicked ? "0" : "1000px"; // 토글된 상태에 따라 최대 높이 변경
        supplies.style.backgroundColor = isClicked ? "initial" : "var(--primary_02)"; // 토글된 상태에 따라 배경색 변경
        supplies.style.color = isClicked ? "var(--primary_02)" : "var(--basic_wh)"; // 토글된 상태에 따라 텍스트 색상 변경

        // 클릭 상태에 따라 이미지 변경
        tripQuestionImg.src = isClicked ? defaultImagePath : clickedImagePath;

        // 클릭 상태 업데이트
        isClicked = !isClicked;

        setTimeout(loading(), 2000);

        let response = await fetch("/user/gpt/supplies", {
            method:"get",
            headers:{
                "Content-Type":"application/json"
            }
        });
        let responseBody = await response.text();

        console.log('응답'+responseBody);

        let htmlData = "";
        gptAnswer.innerHTML = responseBody;
    })


</script>

<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp" %>