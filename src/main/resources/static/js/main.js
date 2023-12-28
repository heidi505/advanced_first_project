document.addEventListener("DOMContentLoaded", function () {

    let flightSearchBg = document.querySelector(".flight_search_bg");
    let flightSearchClose = document.querySelectorAll(".flight_search_close");
    let flightSearchBox = document.querySelectorAll(".flight_search_box");
    let flightSearchBoxNum = flightSearchBox.length;

    Array.from(flightSearchClose).forEach((closeButton) => {

        closeButton.addEventListener("click", (e) => {

            if (flightSearchBoxNum > 0) {
                closeButton.parentElement.style.display = "none";
                let searchId = closeButton.previousElementSibling.value;
				deleteSearchLog(searchId);
                if (flightSearchBoxNum === 1) {
                    flightSearchBg.style.display = "none";
                }

                flightSearchBoxNum--;
            }
        });
    });
    
    // 최근 검색 삭제
    async function deleteSearchLog(searchId){
		try{
			const response = await fetch(`/searched/delete-search-log`, {
            	method: 'POST',
            	headers: {
    			'Content-Type': 'application/json'
  				},
            	body: JSON.stringify({
					searchId : parseInt(searchId)
            	}),
            });
		} catch(e){
			alert('목록 제거에 실패했습니다');
		}
	}  
		 
    let commonModal = document.querySelectorAll(".common_modal");
    let commonModalBtn = document.querySelectorAll(".common_modal_btn");
    let closeBtn = document.querySelectorAll(".modal_close");
    let checkBtn = document.querySelectorAll(".check_btn");

    if (commonModal) {
        commonModalBtn.forEach(function (button) {
            button.addEventListener("click", function () {
                let targetModalId = button.getAttribute("data-target");
                openModal(targetModalId);
            });
        });

        function openModal(modalId) {
            let modal = document.getElementById(modalId);
            modal.style.display = "block";
        }

        closeBtn.forEach(function (closeBtn) {
            closeBtn.addEventListener("click", function () {
                let parentModal = closeBtn.closest(".common_modal");
                parentModal.style.display = "none";
            });
        });

        checkBtn.forEach(function (checkBtn) {
            checkBtn.addEventListener("click", function () {
                let parentModal = checkBtn.closest(".common_modal");
                parentModal.style.display = "none";
            });
        });
    }
    //  공통 모달


    const fromTabButtons = document.querySelectorAll("#from_modal .tab_menu li a");
    const fromTabContents = document.querySelectorAll("#from_modal .tab-content");

    if (fromTabButtons) {
        fromTabButtons.forEach((button) => {
            button.addEventListener("click", function (event) {
                event.preventDefault();

                fromTabContents.forEach((content) => {
                    content.style.display = "none";
                });

                fromTabButtons.forEach((btn) => {
                    btn.classList.remove("tab_active");
                });

                const tabId = button.getAttribute("data-tab");
                document.getElementById(tabId).style.display = "block";

                button.classList.add("tab_active");
            });
        });
    }
    // 출발지 탭

    const toTabButtons = document.querySelectorAll("#to_modal .tab_menu li a");
    const toTabContents = document.querySelectorAll("#to_modal .tab-content");

    if (toTabButtons) {
        toTabButtons.forEach((button) => {
            button.addEventListener("click", function (event) {
                event.preventDefault();

                toTabContents.forEach((content) => {
                    content.style.display = "none";
                });

                toTabButtons.forEach((btn) => {
                    btn.classList.remove("tab_active");
                });

                const tabId = button.getAttribute("data-tab");
                document.getElementById(tabId).style.display = "block";

                button.classList.add("tab_active");
            });
        });

    }


    //   도시 탭버튼

    let fromButtonIcon = document.querySelectorAll(".from_local_item button");
    let toButtonIcon = document.querySelectorAll(".to_local_item button");

    if (fromButtonIcon) {
        function valuesForm(airportCode, airportName) {
            let fromSelectButtons = document.querySelector("#from_select_btn");
            
            fromSelectButtons.querySelector(".from_code_value").innerText = airportCode;
            fromSelectButtons.querySelector(".from_airport_value").innerText = airportName;
            document.getElementById("origin").value = airportCode;
            //로딩 페이지 데이터 바인딩
            document.getElementById("loadingOrigin1").innerText = airportName;
            document.getElementById("loadingOrigin2").innerText = airportCode;
            document.getElementById("loadingOrigin3").innerText = airportName;


        }

        function valuesTo(airportCode, airportName) {
            let toSelectButtons = document.querySelector("#to_select_btn");
           
            toSelectButtons.querySelector(".to_code_value").innerText = airportCode;
            toSelectButtons.querySelector(".to_airport_value").innerText = airportName;
            document.getElementById("destination").value = airportCode;
            //로딩페이지 데이터 바인딩
            document.getElementById("loadingDestination1").innerText = airportName;
            document.getElementById("loadingDestination2").innerText = airportCode;
            document.getElementById("loadingDestination3").innerText = airportName;
        }

        fromButtonIcon.forEach(function (button, index) {
            button.addEventListener("click", function (event) {
                let fromAirportCode = button.querySelector(".from_local_code").innerText;
                let fromAirportName = button.querySelector(".from_local_airport").innerText;

                console.log(`Button ${index + 1} clicked: Code - ${fromAirportCode}, Name - ${fromAirportName}`);
                valuesForm(fromAirportCode, fromAirportName);
            });
        });

        toButtonIcon.forEach(function (button, index) {
            button.addEventListener("click", function (event) {
                let toAirportCode = button.querySelector(".to_local_code").innerText;
                let toAirportName = button.querySelector(".to_local_airport").innerText;

                console.log(`Button ${index + 1} clicked: Code - ${toAirportCode}, Name - ${toAirportName}`);
                valuesTo(toAirportCode, toAirportName);
            });
        });

    }

    let fromToForm = document.querySelector(".from_to_form");

    if (fromToForm) {

        let minusButtons = document.querySelectorAll(".minus");
        let plusButtons = document.querySelectorAll(".plus");
        let passengerCount = document.querySelectorAll(".passenger_count");
        let totalCount = 0;

        updatePassengerCount();

        let category = ["adults", "children", "infants"];

        minusButtons.forEach(function (minusButton, index) {
            minusButton.addEventListener("click", function () {
                let currentCount = parseInt(passengerCount[index].textContent);
                if (currentCount > 0) {
                    passengerCount[index].textContent = currentCount - 1;
                    document.getElementById(category[index]).value = parseInt(passengerCount[index].textContent);
                    updatePassengerCount();
                }
            });
        });


        plusButtons.forEach(function (plusButton, index) {
            plusButton.addEventListener("click", function () {
                let currentCount = parseInt(passengerCount[index].textContent);
                passengerCount[index].textContent = currentCount + 1;
                document.getElementById(category[index]).value = parseInt(passengerCount[index].textContent);

                updatePassengerCount();
            });
        });

        function updatePassengerCount() {
            totalCount = Array.from(passengerCount).reduce((sum, countElement) => {
                return sum + parseInt(countElement.textContent);
            }, 0);

            let passengerSeatButton = document.querySelector(".passenger_seat_btn");
            let passengerCountSpan = passengerSeatButton.querySelector("span");
            passengerCountSpan.textContent = "승객 " + totalCount + " 명 ,";
        }

        let seatButtons = document.querySelectorAll(
            '.seat_radio input[type="radio"]'
        );

        seatButtons.forEach(function (button) {
            button.addEventListener("click", function () {
                updatePassengerSeat(button.value);
            });


            let passengerSeatButton = document.querySelector(".passenger_seat_btn");
            let passengerCountSpan = passengerSeatButton.querySelector("span");
            passengerCountSpan.textContent = "승객 " + totalCount + " 명 ,";


            let seatButtons = document.querySelectorAll(
                '.seat_radio input[type="radio"]'
            );

            seatButtons.forEach(function (button) {
                button.addEventListener("click", function () {
                    updatePassengerSeat(button.value);
                });
            });

            function updatePassengerSeat(seatType) {
                let passengerSeatButton = document.querySelector(".passenger_seat_btn");
                let passengerSeatSpans = passengerSeatButton.querySelectorAll("span");
                passengerSeatSpans[1].textContent = seatType;
                document.getElementById("travelClass").value = seatType;
            }

            // 승객 좌석 선택



            let transFormBtns = document.querySelectorAll(".transform_btn");

            //목적지 도착지 인풋 값 받아오기

            transFormBtns.forEach((button) => {
                button.addEventListener("click", () => {
                    // Get the values of from_select
                    const fromCode = document.querySelector("#from_select_btn .from_code_value").textContent;
                    const fromAirport = document.querySelector("#from_select_btn .from_airport_value").textContent;

                    // Get the values of to_select
                    const toCode = document.querySelector("#to_select_btn .to_code_value").textContent;
                    const toAirport = document.querySelector("#to_select_btn .to_airport_value").textContent;

                    // Swap the values
                    document.querySelector("#from_select_btn .from_code_value").textContent = toCode;
                    document.querySelector("#from_select_btn .from_airport_value").textContent = toAirport;

                    document.querySelector("#to_select_btn .to_code_value").textContent = fromCode;
                    document.querySelector("#to_select_btn .to_airport_value").textContent = fromAirport;

                    //input 태그 값 전환
                    document.getElementById("origin").value = toCode;
                    document.getElementById("destination").value = fromCode;
                    document.getElementById("loadingOrigin1").innerText = toAirport;
                    document.getElementById("loadingOrigin2").innerText = toCode;
                    document.getElementById("loadingOrigin3").innerText = toAirport;
                    document.getElementById("loadingDestination1").innerText = fromAirport;
                    document.getElementById("loadingDestination2").innerText = fromCode;
                    document.getElementById("loadingDestination3").innerText = fromAirport;
                });
            });
            // 출발지 & 도착지 전환

            let children = document.querySelector("#childrenNum").textContent;
            document.getElementById("children").value = children;

        })
    }


	// 검색 결과 창
	const citySearchResult = document.querySelectorAll('.city_search_result');
	//검색 결과 출력
	function inputResult(cities, fromToCheck){
		let number = ( fromToCheck == 'from_modal' ) ? 0 : 1;
		citySearchResult[number].innerHTML = '';// 검색창 초기화
		let tr = '';
		let td = '';
		let text = '';
		// 검색 결과가 없을 때 출력
		if(cities.length == 0){
			tr = makeElement('tr');
			td = makeElement('td','text-center p-5');
			td.colSpan = '3';
			text = document.createTextNode('검색 결과에 해당하는 도시가 없습니다');
			td.appendChild(text);
			tr.appendChild(td);
			citySearchResult[number].appendChild(tr);
		}
		
		cities.forEach((city) => {
			tr = makeElement('tr', 'search_city '+fromToCheck);
			td = makeElement('td','py-3');
			text = document.createTextNode(city.cityCode);
			td.appendChild(text);
			tr.appendChild(td);
			td = makeElement('td','py-3');
			text = document.createTextNode(city.cityName);
			td.appendChild(text);
			tr.appendChild(td);
			td = makeElement('td','py-3');
			text = document.createTextNode(city.countryName);
			td.appendChild(text);
			tr.appendChild(td);
			citySearchResult[number].appendChild(tr);
		})
	}

	// 출발지 & 목적지 검색 
	async function searchCity(keyword, fromToCheck){
		keyword = keyword.toUpperCase();
		try {
        	const response = await fetch(`/ticket/search-city?keyword=${keyword}`);
        	const result = await response.json();
        	//검색 결과 출력
        	inputResult(result, fromToCheck);
    	} catch (error) {
			alert('도시 검색에 실패했습니다');
    	}
	}

	// 최근 검색한 항공권 이동 이벤트
	const recentFlight = document.querySelectorAll('.flight_search_box');
	recentFlight.forEach((flight)=>{
		flight.addEventListener('click',(e)=>{			
			if(e.target.tagName != 'IMG'){
				flight.children[0].click();
			}
		})	
	});	
	
 	const searchCityButton = document.querySelectorAll('.search_city_button'); 
 	const searchCityInput = document.querySelectorAll('.search_city_input');
 	const citySearchBox = document.querySelectorAll('.city_search_box');  	 	
 	
	// 도시 검색 기능
 	searchCityButton.forEach((button) => {
		 button.addEventListener('click', e =>{
		 const fromToCheck = button.classList.contains('from_modal') ? 'from_modal': 'to_modal';
		 const number = fromToCheck == 'from_modal' ? 0 : 1;
		 citySearchBox[number].style.display = 'block';
		//도시 검색 및 출력
		searchCity(searchCityInput[number].value, fromToCheck);
		});
	 });
 	
 	// 출발지 및 목적지 선택(검색창)
	citySearchResult.forEach((result) => {
		result.addEventListener('click', e => {
			if(e.target.parentElement.classList.contains('search_city')){
				let city = e.target.parentElement.childNodes;
			
				if(e.target.parentElement.classList.contains('to_modal')){
					valuesTo(city[0].textContent, city[1].textContent);
				} else {
					valuesForm(city[0].textContent, city[1].textContent);
				}
			}
		}); 
	}); 
    

});