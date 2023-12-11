async function getMyTravel(tabId){
	let statusEnum = '';
	let result = '';
	let reservedTrip = '';
	
	switch(tabId){
		case 'planned_trip': statusEnum = '예정'; break;
		case 'last_trip': statusEnum = '지난'; break;
		case 'canceled_trip': statusEnum = '취소'; break;
	}
	
	 try {
        const response = await fetch(`/user/get-my-travel?statusEnum=${statusEnum}&userId=1`);
        dataList = await response.json(); 
			switch(tabId){
				case 'planned_trip': insertPElement(dataList); break;
				case 'last_trip':   break;
				case 'canceled_trip': insertCElement(dataList); break;
			}
    } catch (error) {
    }
}

// 요소 타입과 클래스명을 받아 생성하는 함수
function makeElement(elementType, classString){
	let element = document.createElement(elementType);
	// 클래스명이 없다면 생략
	if(classString != undefined){
		classArray = classString.split(' ');
		classArray.forEach(name=>{
			element.classList.add(name);
		})
	}
	return element;
};

// 연도가 입력된 div를 반환하는 함수
function makeYearTag(year){
	let yearDiv = makeElement('div','trip_year');
    text = document.createTextNode(`${year}년`);
    yearDiv.appendChild(text);
    return yearDiv;
}




// 예정된 여행 목록 삽입하기
function insertPElement(dataList){
	const plannedTrip =  document.getElementById('planned_trip');
    plannedTrip.innerHTML = '';
	let myTripCountLabel = '';
	let text = '';
	let isPayed = '';
	let aTag = '';
	let span = '';
	let lastYear = '0000'; // 지난 여행 연도와 비교하여 변동 시 연도 표기
	let tripCount = 0;
	for(let i=0; i<3; i++){
		// 결제여부 버튼 삽입
		myTripCountLabel = makeElement('div','my_trip_count_label');
		aTag = makeElement('a','trip_payed_sort color_basic_wh');
		aTag.href = '#';
    	switch(i){
			case 0: isPayed = '전체'; 
					tripCount = 111; 
					aTag.classList.add('all_payment');
			        break;
			case 1: isPayed = '결제전'; 
					tripCount = 56;
					aTag.classList.add('before_payment');   
					break;
			case 2: isPayed = '결제완료';
					tripCount = 55;
					aTag.classList.add('payed_complete');     
					 break;
		}
    	text = document.createTextNode(isPayed); 
    	myTripCountLabel.appendChild(aTag);
    	aTag.appendChild(text);
    	span = makeElement('span','my_trip_num');
    	text = document.createTextNode(tripCount); 
    	span.appendChild(text);
    	aTag.appendChild(span);
    	plannedTrip.appendChild(myTripCountLabel);
	}
    //결제 여부 버튼 끝
    // 여기부터 반복문 
    dataList.forEach((data)=>{
		let createdAt = data.createdAt;
    	let date = createdAt.split('T')[0].split('-');
    	let year = 0;
   		let month = 0;
    	let day = 0;
    	let week = '';
    	let num = 0;
    	date.forEach((splitDate)=>{
			switch(num){
				case 0: year = splitDate; break;
				case 1: month = splitDate; break;
				case 2: day = splitDate; break;
			}
			num++;
		});
		// 연도는 매번 삽입하는 것이 아니니 조건문 처리
		let yearDiv = '';
		if(lastYear == '0000'){
			lastYear = year;
    		yearDiv = makeYearTag(year);
    		plannedTrip.appendChild(yearDiv);
		} 
		if(year != lastYear){
			yearDiv = makeYearTag(year);
    		plannedTrip.appendChild(yearDiv);
    	}
		let createdAtDate = new Date(year,month,day);
		let weekNumber = createdAtDate.getDay();
		switch(weekNumber){
			case 0: week='일'; break;
			case 1: week='월'; break;
			case 2: week='화'; break;
			case 3: week='수'; break;
			case 4: week='목'; break;
			case 5: week='금'; break;
			case 6: week='토'; break;
		}
		
    	let myTripList = makeElement('div', 'my_trip_list');
   		let myTripBox = makeElement('div', 'my_trip_box');
    	let tripDay = makeElement('span','trip_day');
    	text = document.createTextNode(`${month}월 ${day}일 ( ${week} )`);
    	tripDay.appendChild(text);
    	myTripBox.appendChild(tripDay);
    	let myTripItem = makeElement('ul','my_trip_item');
    	myTripBox.appendChild(myTripItem);
    	let myTripContent = makeElement('li','my_trip_content');
    	// my_trip_content_top 시작
    	let myTripContentTop = makeElement('ul','my_trip_content_top');
    	let li = makeElement('li');
    	let beforePaymentLabel = '';
    	if(data.isPayed){
    		beforePaymentLabel = makeElement('span','complete_label');
    		text = document.createTextNode('결제완료');	
		} else {
			beforePaymentLabel = makeElement('span','before_payment_label');
    		text = document.createTextNode('결제전');	
		}
    	beforePaymentLabel.appendChild(text);
    	li.appendChild(beforePaymentLabel);
    	myTripContentTop.appendChild(li);
    	li = makeElement('li');
    	let a = makeElement('a');
    	a.href = `/reservation/detail/${data.reservationNum}`;
    	text = document.createTextNode('예약 상세 보기');
    	a.appendChild(text);
    	let img = makeElement('img');
    	img.src = '/images/icons/detail_arrow.svg';
    	img.alt = '예약 상세보기';
    	a.appendChild(img);
    	li.appendChild(a);
    	myTripContentTop.appendChild(li);
    	// my_trip_content_top 끝(검사 끝)
    	// my_trip_content_mid 시작
    	let myTripContentMid = makeElement('ul','my_trip_content_mid');
    	let myTripContentTit = makeElement('li','my_trip_content_tit');
    	let airlineIconImg = makeElement('div','airline_icon_img');
    	let koreanName = '';
    	// 항공사별 데이터 상 이름을 한국어로 변경. 나머지도 작성 필요
    	switch(data.airline){
			case 'KAL': koreanName = '대한항공';
			 break;
		}
    	// 이거 2개는 데이터에 따라 매치시켜야 함
    	img = makeElement('img');
    	img.src = '/images/icons/airline_icon_02.png';
    	img.alt = koreanName;
    	airlineIconImg.appendChild(img);
    	div = makeElement('div');
    	
    	let p = makeElement('p');
    	// 이것도 영문 데이터를 한글 데이터로 바꿔 text안에 넣어줘야 함
    	text = document.createTextNode(` [${koreanName}] 부산 - 도쿄/나리타`);
    	p.appendChild(text);
    	div.appendChild(p);
    	p = makeElement('p');
    	text = document.createTextNode('예약번호 3018-4609');
    	p.appendChild(text);
    	div.appendChild(p);
    	myTripContentTit.appendChild(airlineIconImg);
    	myTripContentTit.appendChild(div);
    	li = makeElement('li');
		myTripContentMid.appendChild(myTripContentTit);
    	myTripContentMid.appendChild(li);
    	let myTripTicketImg = makeElement('div','my_trip_ticket_img');
    	li.appendChild(myTripTicketImg);
    	let myTripTicketBg = makeElement('div','my_trip_ticket_bg');
    	myTripTicketImg.appendChild(myTripTicketBg);
    	let tripLeft = makeElement('span','trip_left');
    	text = document.createTextNode(data.departureAirport);
    	tripLeft.appendChild(text);
    	myTripTicketBg.appendChild(tripLeft);
    	let tripRight = makeElement('span','trip_right');
    	text = document.createTextNode(data.arrivalCity);
    	tripRight.appendChild(text);
    	myTripTicketBg.appendChild(tripRight);
    	// my_trip_content_mid 끝
    	// my_trip_content_btm 시작
    	let myTripContentBtm = makeElement('ul','my_trip_content_btm');
    	li = makeElement('li');
    	myTripContentBtm.appendChild(li);
    	p = makeElement('p');
    	
    	text = document.createTextNode(koreanName);
    	p.appendChild(text);
    	li.appendChild(p);
    	p = makeElement('p');
    	
    	text = document.createTextNode(data.flightName);
    	p.appendChild(text);
    	li.appendChild(p);
    	li = makeElement('li');
    	myTripContentBtm.appendChild(li);
    	p = makeElement('p');
    	let departureTime = data.departureTime.split('T')[1].substring(0,5);
    	text = document.createTextNode(departureTime);
		p.appendChild(text);
		li.appendChild(p);
    	p = makeElement('p');
    	text = document.createTextNode(data.departureCity);
		p.appendChild(text);
		li.appendChild(p);
		
		li = makeElement('li');
		myTripContentBtm.appendChild(li);
		img = makeElement('img');
		img.src = '/images/icons/my_trip_arrow.svg';
		img.alt = '화살표';
		li.appendChild(img);
		
		li = makeElement('li');
		myTripContentBtm.appendChild(li);
		p = makeElement('p');
    	let arrivalTime = data.arrivalTime.split('T')[1].substring(0,5);
    	text = document.createTextNode(arrivalTime);
		p.appendChild(text);
		li.appendChild(p);
    	p = makeElement('p');
    	text = document.createTextNode(data.arrivalCity);
		p.appendChild(text);
		li.appendChild(p);
		
		li = makeElement('li');
		myTripContentBtm.appendChild(li);
		let reservationCancle = makeElement('li','reservation_cancle');
		// my_trip_content_btm 끝
		a = makeElement('a');
		reservationCancle.appendChild(a);
		a.href = `/reservation/cancel-modal/${data.reservationNum}`;
		text = document.createTextNode('예약 취소하기');
		a.appendChild(text);
		
    	myTripContent.appendChild(myTripContentTop);
		myTripContent.appendChild(myTripContentMid);
		myTripContent.appendChild(myTripContentBtm);
    	myTripItem.appendChild(myTripContent);
    	myTripItem.appendChild(reservationCancle);
    	myTripBox.appendChild(myTripItem);
    	myTripList.appendChild(myTripBox);
    	plannedTrip.appendChild(myTripList);
    });	
    //반복문 끝
}





// 취소한 여행 목록 삽입하기
function insertCElement(dataList){
	console.log(dataList);
	const plannedTrip = document.getElementById('canceled_trip');
    plannedTrip.innerHTML = '';
	let myTripCountLabel = '';
	let text = '';
	let isPayed = '';
	let aTag = '';
	let span = '';
	let lastYear = '0000'; // 지난 여행 연도와 비교하여 변동 시 연도 표기
	let tripCount = 0;
	for(let i=0; i<3; i++){
		// 결제여부 버튼 삽입
		myTripCountLabel = makeElement('div','my_trip_count_label');
		aTag = makeElement('a','trip_payed_sort color_basic_wh');
		aTag.href = '#';
    	switch(i){
			case 0: isPayed = '전체'; 
					tripCount = 111; 
					aTag.classList.add('all_payment');
			        break;
			case 1: isPayed = '결제전'; 
					tripCount = 56;
					aTag.classList.add('before_payment');   
					break;
			case 2: isPayed = '결제완료';
					tripCount = 55;
					aTag.classList.add('payed_complete');     
					 break;
		}
    	text = document.createTextNode(isPayed); 
    	myTripCountLabel.appendChild(aTag);
    	aTag.appendChild(text);
    	span = makeElement('span','my_trip_num');
    	text = document.createTextNode(tripCount); 
    	span.appendChild(text);
    	aTag.appendChild(span);
    	plannedTrip.appendChild(myTripCountLabel);
	}
    //결제 여부 버튼 끝
    // 여기부터 반복문 
    dataList.forEach((data)=>{
		let createdAt = data.createdAt;
    	let date = createdAt.split('T')[0].split('-');
    	let year = 0;
   		let month = 0;
    	let day = 0;
    	let week = '';
    	let num = 0;
    	date.forEach((splitDate)=>{
			switch(num){
				case 0: year = splitDate; break;
				case 1: month = splitDate; break;
				case 2: day = splitDate; break;
			}
			num++;
		});
		// 연도는 매번 삽입하는 것이 아니니 조건문 처리
		let yearDiv = '';
		if(lastYear == '0000'){
			lastYear = year;
    		yearDiv = makeYearTag(year);
    		plannedTrip.appendChild(yearDiv);
		} 
		if(year != lastYear){
			yearDiv = makeYearTag(year);
    		plannedTrip.appendChild(yearDiv);
    	}
		let createdAtDate = new Date(year,month,day);
		let weekNumber = createdAtDate.getDay();
		switch(weekNumber){
			case 0: week='일'; break;
			case 1: week='월'; break;
			case 2: week='화'; break;
			case 3: week='수'; break;
			case 4: week='목'; break;
			case 5: week='금'; break;
			case 6: week='토'; break;
		}
		
    	let myTripList = makeElement('div', 'my_trip_list');
   		let myTripBox = makeElement('div', 'my_trip_box');
    	let tripDay = makeElement('span','trip_day');
    	text = document.createTextNode(`${month}월 ${day}일 ( ${week} )`);
    	tripDay.appendChild(text);
    	myTripBox.appendChild(tripDay);
    	let myTripItem = makeElement('ul','my_trip_item');
    	myTripBox.appendChild(myTripItem);
    	let myTripContent = makeElement('li','my_trip_content');
    	// my_trip_content_top 시작
    	let myTripContentTop = makeElement('ul','my_trip_content_top');
    	let li = makeElement('li');
    	let beforePaymentLabel = '';
    	if(data.isPayed){
    		beforePaymentLabel = makeElement('span','complete_label');
    		text = document.createTextNode('결제완료');	
		} else {
			beforePaymentLabel = makeElement('span','before_payment_label');
    		text = document.createTextNode('결제전');	
		}
    	beforePaymentLabel.appendChild(text);
    	li.appendChild(beforePaymentLabel);
    	myTripContentTop.appendChild(li);
    	li = makeElement('li');
    	let a = makeElement('a');
    	a.href = `/reservation/detail/${data.reservationNum}`;
    	text = document.createTextNode('예약 상세 보기');
    	a.appendChild(text);
    	let img = makeElement('img');
    	img.src = '/images/icons/detail_arrow.svg';
    	img.alt = '예약 상세보기';
    	a.appendChild(img);
    	li.appendChild(a);
    	myTripContentTop.appendChild(li);
    	// my_trip_content_top 끝(검사 끝)
    	// my_trip_content_mid 시작
    	let myTripContentMid = makeElement('ul','my_trip_content_mid');
    	let myTripContentTit = makeElement('li','my_trip_content_tit');
    	let airlineIconImg = makeElement('div','airline_icon_img');
    	let koreanName = '';
    	// 항공사별 데이터 상 이름을 한국어로 변경. 나머지도 작성 필요
    	switch(data.airline){
			case 'KAL': koreanName = '대한항공';
			 break;
		}
    	// 이거 2개는 데이터에 따라 매치시켜야 함
    	img = makeElement('img');
    	img.src = '/images/icons/airline_icon_02.png';
    	img.alt = koreanName;
    	airlineIconImg.appendChild(img);
    	div = makeElement('div');
    	
    	let p = makeElement('p');
    	// 이것도 영문 데이터를 한글 데이터로 바꿔 text안에 넣어줘야 함
    	text = document.createTextNode(` [${koreanName}] 부산 - 도쿄/나리타`);
    	p.appendChild(text);
    	div.appendChild(p);
    	p = makeElement('p');
    	text = document.createTextNode('예약번호 3018-4609');
    	p.appendChild(text);
    	div.appendChild(p);
    	myTripContentTit.appendChild(airlineIconImg);
    	myTripContentTit.appendChild(div);
    	li = makeElement('li');
		myTripContentMid.appendChild(myTripContentTit);
    	myTripContentMid.appendChild(li);
    	let myTripTicketImg = makeElement('div','my_trip_ticket_img');
    	li.appendChild(myTripTicketImg);
    	let myTripTicketBg = makeElement('div','my_trip_ticket_bg');
    	myTripTicketImg.appendChild(myTripTicketBg);
    	let tripLeft = makeElement('span','trip_left');
    	text = document.createTextNode(data.departureAirport);
    	tripLeft.appendChild(text);
    	myTripTicketBg.appendChild(tripLeft);
    	let tripRight = makeElement('span','trip_right');
    	text = document.createTextNode(data.arrivalCity);
    	tripRight.appendChild(text);
    	myTripTicketBg.appendChild(tripRight);
    	// my_trip_content_mid 끝
    	// my_trip_content_btm 시작
    	let myTripContentBtm = makeElement('ul','my_trip_content_btm');
    	li = makeElement('li');
    	myTripContentBtm.appendChild(li);
    	p = makeElement('p');
    	
    	text = document.createTextNode(koreanName);
    	p.appendChild(text);
    	li.appendChild(p);
    	p = makeElement('p');
    	
    	text = document.createTextNode(data.flightName);
    	p.appendChild(text);
    	li.appendChild(p);
    	li = makeElement('li');
    	myTripContentBtm.appendChild(li);
    	p = makeElement('p');
    	let departureTime = data.departureTime.split('T')[1].substring(0,5);
    	text = document.createTextNode(departureTime);
		p.appendChild(text);
		li.appendChild(p);
    	p = makeElement('p');
    	text = document.createTextNode(data.departureCity);
		p.appendChild(text);
		li.appendChild(p);
		
		li = makeElement('li');
		myTripContentBtm.appendChild(li);
		img = makeElement('img');
		img.src = '/images/icons/my_trip_arrow.svg';
		img.alt = '화살표';
		li.appendChild(img);
		
		li = makeElement('li');
		myTripContentBtm.appendChild(li);
		p = makeElement('p');
    	let arrivalTime = data.arrivalTime.split('T')[1].substring(0,5);
    	text = document.createTextNode(arrivalTime);
		p.appendChild(text);
		li.appendChild(p);
    	p = makeElement('p');
    	text = document.createTextNode(data.arrivalCity);
		p.appendChild(text);
		li.appendChild(p);
		
		li = makeElement('li');
		myTripContentBtm.appendChild(li);
		let reservationCancle = makeElement('li','reservation_cancle');
		// my_trip_content_btm 끝
		a = makeElement('a');
		reservationCancle.appendChild(a);
		a.href = `/reservation/cancel-modal/${data.reservationNum}`;
		text = document.createTextNode('예약 취소하기');
		a.appendChild(text);
		
    	myTripContent.appendChild(myTripContentTop);
		myTripContent.appendChild(myTripContentMid);
		myTripContent.appendChild(myTripContentBtm);
    	myTripItem.appendChild(myTripContent);
    	myTripItem.appendChild(reservationCancle);
    	myTripBox.appendChild(myTripItem);
    	myTripList.appendChild(myTripBox);
    	plannedTrip.appendChild(myTripList);
    });	
    //반복문 끝
}



































	


