<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header.jsp -->
<%@ include file="../layout/header.jsp"%>


<!-- TODO 여기서부터 main영역 -->

<main id="my_travel_page">
	<section class="my_travel">
		<div class="nav_container">
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
		</div>
		<!--  </article> -->
	</section>
</main>
</div>
</div>
</div>
<script src="/js/make_element.js"></script>
<script src="/js/my_travel.js"></script>
<script type="text/javascript">
//결제 취소 이벤트
const plannedTrip = document.getElementById(`planned_trip`);
plannedTrip.addEventListener(`click`, e => {
	if(e.target.id == `kakaoPayCancel`){
		if(confirm(`결제를 취소하시겠습니까?`)) kakaoCancel();
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
        getMyTravel(tabId , isPayedEnum.ALL);
        button.classList.add("tab_active");
    });
});

// 결제여부에 따른 목록 보기
tabContents.forEach((button)=>{
	button.addEventListener('click',(e)=>{
		let tabId = button.id;
		if(e.target.classList.contains('my_trip_count_label')||
				e.target.classList.contains('my_trip_num')){
			let sort = '';
			if(e.target.classList.contains('my_trip_num')){
				let myTripCountLabel = e.target.parentElement;
				sort = myTripCountLabel.innerText.split(e.target.innerText)[0];
			} else{
				sort = e.target.innerText.split(e.target.childNodes[1].innerText)[0];
			}
			getMyTravel(tabId, sort);
		}
	})
});


//let kakaoPayCancelBtn = document.querySelector("#kakaoPayCancel");
// body가 필요하지
function kakaoCancel(){
    fetch(`/kakaoPay/cancel`
        ,{ method: "POST",
            headers:{
                "Content-Type": "application/json",
                "charset": "UTF-8"
            },
        }).then(response=>response.json())
        .then(result=>{
            alert(result.data);
        })
        .catch(result=> {
            alert(result.data);
        })
}
//kakaoPayCancelBtn.addEventListener("click",kakaoCancel);




</script>

<!-- footer.jsp -->
<%@ include file="../layout/footer.jsp"%>