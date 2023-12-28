const statusEnum = {
	PLANNED  :`예정`,
	LAST     :`지난`,
	CANCELED :`취소`
};
Object.freeze(statusEnum);
const tripEnum = {
	PLANNED  :`planned_trip`,
	LAST     :`last_trip`,
	CANCELED :`canceled_trip`
}
Object.freeze(tripEnum);
const isPayedEnum = {
	ALL      : `전체`,
	NOTPAYED : `결제전`,
	PAYED    : `결제완료`
}
Object.freeze(isPayedEnum);
const weekEnum = {
	SUN : `일`,
	MON : `월`,
	TUE : `화`,
	WED : `수`,
	THU : `목`,
	FRI : `금`,
	SAT : `토`
}
Object.freeze(weekEnum);

// 페이징 용 변수
let currentTabId = ``;
let currentSort = ``;
let currentPeriod = ``;
let minDepartureYear = ``;
let maxDepartureYear = ``;
const pages = document.querySelectorAll(`.pagination li`); // 페이지버튼들


// 선택한 버튼 활성화
function activeButton(page) {
	pages.forEach( (button) => {
		button.classList.remove(`active`);
	})
	page.classList.add(`active`);
}


async function getMyTravel(tabId, sort, year){
	currentTabId = tabId;
	if(currentPeriod != year&& currentPeriod != ``){
		let myTripCountLabel = document.getElementsByClassName(`my_trip_count_label`);
		currentPeriod = year;
		myTripCountLabel[0].style.background = `var(--primary02)`;
		sort = isPayedEnum.ALL;
	}
	currentSort = sort;
	
	//statusEnum 파라미터
	let status = ``;
	switch(tabId){
		case tripEnum.PLANNED  : status = statusEnum.PLANNED;  break;
		case tripEnum.LAST     : status = statusEnum.LAST;     break;
		case tripEnum.CANCELED : status = statusEnum.CANCELED; break;
	}

	const href=`/user/get-my-travel?statusEnum=${status}&sort=${sort}&year=${year}`; 
	 try {
        const response = await fetch(href);
        const data = await response.json(); 
        insertElement(data.tripList, data.tripCount, tabId , sort);
    } catch (error) {
		alert(error+`목록을 불러오는데 실패했습니다`);
    }
}


// 연도가 입력된 div를 반환하는 함수
function makeYearTag(year){
	let yearDiv = makeElement(`div`,`trip_year`);
    let text = document.createTextNode(`${year}년`);
    yearDiv.appendChild(text);
    return yearDiv;
}


// 여행 목록 삽입하기(목록, 목록 수, 목록의 종류)
function insertElement(tripList, tripCnt , tabId, sort){
	const myTrip =  document.getElementById(tabId);
    myTrip.innerHTML = ``;
	let myTripCountLabel = ``;
	let isPayed = ``;
	let span, div, form, button = ``;
	let lastYear = ``; // 지난 여행 연도와 비교하여 변동 시 연도 표기
	let tripCount = 0;
	let num = tabId == tripEnum.LAST ? 1 : 3 ;
	let text = ``;
	for(let i=0; i<num; i++){
		// 결제여부 버튼 삽입
		myTripCountLabel = makeElement(`div`,`my_trip_count_label me-2`);

    	switch(i){
			case 0: isPayed = isPayedEnum.ALL; 
					tripCount = tripCnt.allTripCount;
					myTripCountLabel.classList.add(`all_payment`);
			        break;
			case 1: isPayed = isPayedEnum.NOTPAYED; 
					tripCount = tripCnt.notPayedTripCount;
					myTripCountLabel.classList.add(`before_payment`);   
					break;
			case 2: isPayed = isPayedEnum.PAYED;
					tripCount = tripCnt.payedTripCount;
					myTripCountLabel.classList.add(`payed_complete`);     
					break;
		}
		if(isPayed == sort){
			// 현재 선택한 버튼에 색상 변경
			myTripCountLabel.style.background = `var(--primary_02)`;
		}
    	text = document.createTextNode(isPayed); 
    	myTripCountLabel.appendChild(text);
    	span = makeElement(`span`,`my_trip_num`);
    	text = document.createTextNode(tripCount); 
    	span.appendChild(text);
    	myTripCountLabel.appendChild(span);
    	myTrip.appendChild(myTripCountLabel);
	}
    //결제 여부 버튼 끝
    // 여기부터 반복문 
    tripList.forEach((data) => {
		let departureTime = data.departureTime;
    	let date = departureTime.split(`T`)[0].split(`-`);
    	let year, month, day = 0;
    	let week = ``;
    	let num = 0;
    	date.forEach((splitDate) => {
			switch(num){
				case 0: year  = splitDate; break;
				case 1: month = splitDate; break;
				case 2: day   = splitDate; break;
			}
			num++;
		});
		// 연도는 매번 삽입하는 것이 아니니 조건문 처리
		let yearDiv = ``;
		if(year != lastYear){
			lastYear = year;
			yearDiv = makeYearTag(year);
    		myTrip.appendChild(yearDiv);
    	}
		let createdAtDate = new Date(year,month,day);
		let weekNumber = createdAtDate.getDay();
		switch(weekNumber){
			case 0: week= weekEnum.SUN ; break;
			case 1: week= weekEnum.MON ; break;
			case 2: week= weekEnum.TUE ; break;
			case 3: week= weekEnum.WED ; break;
			case 4: week= weekEnum.THU ; break;
			case 5: week= weekEnum.FRI ; break;
			case 6: week= weekEnum.SAT ; break;
		}
		
    	let myTripList = makeElement(`div`, `my_trip_list`);
   		let myTripBox = makeElement(`div`, `my_trip_box`);
    	let tripDay = makeElement(`span`,`trip_day`);
    	text = document.createTextNode(`${month}월 ${day}일 ( ${week} )`);
    	tripDay.appendChild(text);
    	myTripBox.appendChild(tripDay);
    	let myTripItem = makeElement(`ul`,`my_trip_item`);
    	myTripBox.appendChild(myTripItem);
    	let myTripContent = makeElement(`li`,`my_trip_content`);
    	// my_trip_content_top 시작
    	let myTripContentTop = makeElement(`ul`,`my_trip_content_top`);
    	let li = makeElement(`li`);
    	let beforePaymentLabel = ``;
    	if(data.isPayed){
    		beforePaymentLabel = makeElement(`span`,`complete_label`);
    		text = document.createTextNode(isPayedEnum.PAYED);	
		} else {
			beforePaymentLabel = makeElement(`span`,`before_payment_label`);
    		text = document.createTextNode(isPayedEnum.NOTPAYED);	
		}
    	beforePaymentLabel.appendChild(text);
    	li.appendChild(beforePaymentLabel);
    	myTripContentTop.appendChild(li);
    	li = makeElement(`li`);
    	let a = makeElement(`a`);
    	a.href = `/reservation/detail/${data.reservationNum}`;
    	text = document.createTextNode(`예약 상세 보기`);
    	a.appendChild(text);
    	let img = makeElement(`img`);
    	img.src = `/images/icons/detail_arrow.svg`;
    	img.alt = `예약 상세보기`;
    	a.appendChild(img);
    	li.appendChild(a);
    	myTripContentTop.appendChild(li);
    	// my_trip_content_top 끝
    	// my_trip_content_mid 시작
    	let myTripContentMid = makeElement(`ul`,`my_trip_content_mid`);
    	let myTripContentTit = makeElement(`li`,`my_trip_content_tit`);
    	let airlineIconImg = makeElement(`div`,`airline_icon_img`);
    	
		const koreanAirline = data.koreanAirline; 
    	img = makeElement(`img`);
    	img.src = `/images/airline_images/${data.airline}.png`;
    	img.alt = koreanAirline;
    	airlineIconImg.appendChild(img);
    	div = makeElement(`div`);
    	
    	let p = makeElement(`p`);
    	
    	
    	text = document.createTextNode(` [${koreanAirline}] ${data.koreanDepartureAirport} - ${data.koreanArrivalAirport}`);
    	p.appendChild(text);
    	div.appendChild(p);
    	p = makeElement(`p`);
    	text = document.createTextNode(`예약번호 ${data.reservationNum}`);
    	p.appendChild(text);
    	div.appendChild(p);

    	myTripContentTit.appendChild(airlineIconImg);
    	myTripContentTit.appendChild(div);
    	li = makeElement(`li`);
		myTripContentMid.appendChild(myTripContentTit);
    	myTripContentMid.appendChild(li);
		
		if(tabId != tripEnum.LAST){
    		let myTripTicketImg = makeElement(`div`,`my_trip_ticket_img`);
    		li.appendChild(myTripTicketImg);
    		let myTripTicketBg = makeElement(`div`,`my_trip_ticket_bg`);
    		myTripTicketImg.appendChild(myTripTicketBg);
    		let tripLeft = makeElement(`span`,`trip_left`);
    		text = document.createTextNode(data.departureCity);
    		tripLeft.appendChild(text);
    		myTripTicketBg.appendChild(tripLeft);
    		let tripRight = makeElement(`span`,`trip_right`);
    		text = document.createTextNode(data.arrivalCity);
    		tripRight.appendChild(text);
    		myTripTicketBg.appendChild(tripRight);
    	}
    	// my_trip_content_mid 끝
    	// my_trip_content_btm 시작
    	let myTripContentBtm = ``;
    	let reservationCancle =``;
    	if(tabId != tripEnum.LAST){
    		myTripContentBtm = makeElement(`ul`,`my_trip_content_btm`);
    		li = makeElement(`li`);
    		myTripContentBtm.appendChild(li);
    		p = makeElement(`p`);
    		text = document.createTextNode(koreanAirline);
    		p.appendChild(text);
    		li.appendChild(p);
    		p = makeElement(`p`);
    	
    		text = document.createTextNode(data.flightName);
    		p.appendChild(text);
    		li.appendChild(p);
    		li = makeElement(`li`);
    		myTripContentBtm.appendChild(li);
    		p = makeElement(`p`);
    		let departureTime = data.departureTime.split(`T`)[1].substring(0,5);
    		text = document.createTextNode(departureTime);
			p.appendChild(text);
			li.appendChild(p);
    		p = makeElement(`p`);
    		text = document.createTextNode(data.departureCity);
			p.appendChild(text);
			li.appendChild(p);
		
			li = makeElement(`li`);
			myTripContentBtm.appendChild(li);
			img = makeElement(`img`);
			img.src = `/images/icons/my_trip_arrow.svg`;
			img.alt = `화살표`;
			li.appendChild(img);
			
			li = makeElement(`li`);
			myTripContentBtm.appendChild(li);
			p = makeElement(`p`);
    		let arrivalTime = data.arrivalTime.split(`T`)[1].substring(0,5);
    		text = document.createTextNode(arrivalTime);
			p.appendChild(text);
			li.appendChild(p);
    		p = makeElement(`p`);
    		text = document.createTextNode(data.arrivalCity);
			p.appendChild(text);
			li.appendChild(p);
		
			li = makeElement(`li`);
			myTripContentBtm.appendChild(li);
			
			// my_trip_content_btm 끝
			if(tabId == tripEnum.PLANNED){
				reservationCancle = makeElement(`li`,`reservation_cancle mb-3`);
				div = makeElement(`div`,`reservation_cancle_btn mb-3`);
				a = makeElement(`a`);
				div.appendChild(a);
				reservationCancle.appendChild(div);
				a.href = `/reservation/cancel-modal/${data.reservationNum}`;
				text = document.createTextNode(`예약 취소하기`);
				a.appendChild(text);
				// 결제 취소 부분
				if(data.isPayed){
					div = makeElement(`div`,`reservation_cancle_btn`);
					form = makeElement(`form`);
					form.action = `/kakaoPay/cancel`;
					form.method = `post`;
					div.appendChild(form);
					button = makeElement(`button`);
					button.id = `kakaoPayCancel`;
					button.type = `button`;
					text = document.createTextNode(`결제 취소하기`);
					button.appendChild(text);
					form.appendChild(button);
					reservationCancle.appendChild(div);
				}
			}
		}
    	myTripContent.appendChild(myTripContentTop);
		myTripContent.appendChild(myTripContentMid);
		if(tabId != tripEnum.LAST) myTripContent.appendChild(myTripContentBtm);
    	myTripItem.appendChild(myTripContent);
    	if(tabId == tripEnum.PLANNED) myTripItem.appendChild(reservationCancle);
    	myTripBox.appendChild(myTripItem);
    	myTripList.appendChild(myTripBox);
    	myTrip.appendChild(myTripList);
    });	
    if(tripList.length == 0){
		let noResult = makeElement(`p`,`no_result_page`);
		text = document.createTextNode(`조회된 목록이 없습니다`);
		noResult.appendChild(text);
		myTrip.appendChild(noResult);
	}
    //반복문 끝
}

	
const pagination = document.getElementsByClassName(`pagination`)[0];

pages.forEach((page) => {
	page.addEventListener(`click`, e => {
		const activeBtn = document.querySelectorAll(`.active`)[0];
		// paging
		if(e.target.ariaLabel == `Previous`||e.target.parentElement.ariaLabel == `Previous`){
			if(activeBtn.previousElementSibling != page){
				activeButton(activeBtn.previousElementSibling);
				currentPeriod = activeBtn.previousElementSibling.textContent;
				getMyTravel(currentTabId, currentSort, currentPeriod);
			} 
			return false;
		}
		if(e.target.ariaLabel == `Next`||e.target.parentElement.ariaLabel == `Next`){
			if(activeBtn.nextElementSibling != page){
				activeButton(activeBtn.nextElementSibling);
				currentPeriod = activeBtn.nextElementSibling.textContent;
				getMyTravel(currentTabId, currentSort, currentPeriod);			
			}
			return false;
		}
		activeButton(page);
		currentPeriod = page.textContent;
		getMyTravel(currentTabId, currentSort, currentPeriod);
		
	})
})

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
            getMyTravel(tabId, isPayedEnum.ALL, currentPeriod);
            button.classList.add("tab_active");
        });
    });


