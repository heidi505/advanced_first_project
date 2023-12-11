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
        result = await response.json(); 
        result.forEach((data)=>{
			switch(tabId){
				case 'planned_trip': insertPElement(data); break;
				case 'last_trip':  break;
				case 'canceled_trip':  break;
			}
		});
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




function insertPElement(data){
	const plannedTrip =  document.getElementById('planned_trip');
    plannedTrip.innerHTML = '';
	let myTripCountLabel = '';
	let text = '';
	let isPayed = '';
	let aTag = '';
	let span = '';
	let tripCount = 0;
	for(let i=0; i<3; i++){
		// 결제여부 버튼 삽입
		myTripCountLabel = makeElement('div','my_trip_count_label');
		aTag = makeElement('a','trip_payed_sort color_basic_wh');
    	switch(i){
			case 0: isPayed = '전체'; tripCount = 111; break;
			case 1: isPayed = '결제전'; tripCount = 56; break;
			case 2: isPayed = '결제완료'; tripCount = 55; break;
		}
    	text = document.createTextNode(isPayed); 
    	myTripCountLabel.appendChild(text);
    	span = makeElement('span','my_trip_num');
    	text = document.createTextNode(tripCount); 
    	span.appendChild(text);
    	aTag.appendChild(span);
    	myTripCountLabel.appendChild(aTag);
    	plannedTrip.appendChild(myTripCountLabel);
	}
    //결제 여부 버튼 끝
	//날짜 자르기 필요
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
		let yearDiv = makeElement('div','trip_year');
    	text = document.createTextNode(`${year}년`);
    	yearDiv.appendChild(text);
    	plannedTrip.appendChild(yearDiv);
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
    	if(data.payed){
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
    	a.href = '#';
    	text = document.createTextNode('예약 상세 보기');
    	a.appendChild(text);
    	let img = makeElement('img');
    	img.src = '/images/icons/detail_arrow.svg';
    	img.alt = '예약 상세보기';
    	a.appendChild(img);
    	li.appendChild(a);
    	myTripContentTop.appendChild(li);
    	// my_trip_content_top 끝
    	// my_trip_content_mid 끝
    	let myTripContentMid = makeElement('ul','my_trip_content_mid');
    	let myTripContentTit = makeElement('li','my_trip_content_tit');
    	
  /*  	
 <ul class="my_trip_content_mid">
       <li class="my_trip_content_tit">
         <div class="airline_icon_img">
               <img src="/images/icons/airline_icon_02.png" alt="제주항공">
       </div>
          <div>
               <p> [제주항공] 부산 - 도쿄/나리타</p>
               <p>예약번호 3018-4609</p>
                  </div>
            </li>
             <li>
             <div class="my_trip_ticket_img">
          <div class="my_trip_ticket_bg">
             <span class="trip_left">PUS</span>
         <span class="trip_right">NRT</span>
               </div>
         </div>
          </li>
             </ul>
*/

		myTripContentMid.appendChild(myTripContentTit);
		myTripContent.appendChild(myTripContentMid);
    	myTripContent.appendChild(myTripContentTop);
    	myTripItem.appendChild(myTripContent);
    	myTripBox.appendChild(myTripItem);
    	myTripList.appendChild(myTripBox);
    	plannedTrip.appendChild(myTripList);
                               
                                  

}



