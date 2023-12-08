document.addEventListener("DOMContentLoaded", function () {
    let fromButtonIcon = document.querySelectorAll(".from_local_item button");
    let toButtonIcon = document.querySelectorAll(".to_local_item button");
    console.log(toButtonIcon.values());

    function valuesForm(airportCode, airportName) {
        let fromSelectButtons = document.querySelector("#from_select_btn");
        console.log("fromselectButton" + fromSelectButtons + " 야");
        fromSelectButtons.querySelector(".from_code_value").innerText = airportCode;
        fromSelectButtons.querySelector(".from_airport_value").innerText = airportName;
    }



    function valuesTo(airportCode, airportName) {
        let toSelectButtons = document.querySelector("#to_select_btn");
        console.log("to" + toSelectButtons + " 호");
        toSelectButtons.querySelector(".to_code_value").innerText = airportCode;

        toSelectButtons.querySelector(".to_airport_value").innerText = airportName;
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

            console.log(toAirportCode.valueOf()+ "도착지값");
            console.log(`Button ${index + 1} clicked: Code - ${toAirportCode}, Name - ${toAirportName}`);
            valuesTo(toAirportCode, toAirportName);
        });
    });
    // 도시 지역 선택한 값 넣기

    let flightSearchBg = document.querySelector(".flight_search_bg");

    let flightSearchClose = document.querySelectorAll(".flight_search_close");
    let flightSearchBox = document.querySelectorAll(".flight_search_box");
    let flightSearchBoxNum = flightSearchBox.length;

    Array.from(flightSearchClose).forEach((closeButton) => {
        console.log(closeButton);
        closeButton.addEventListener("click", () => {
            if (flightSearchBoxNum > 0) {
                flightSearchBox[flightSearchBoxNum - 1].style.display = "none";

                if (flightSearchBoxNum === 1) {
                    flightSearchBg.style.display = "none";
                }

                flightSearchBoxNum--;
            }
        });
    });
    // 최근 검색 삭제

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
    // 도착지 탭

    let minusButtons = document.querySelectorAll(".minus");
    let plusButtons = document.querySelectorAll(".plus");
    let passengerCount = document.querySelectorAll(".passenger_count");
    let totalCount = 0;

    updatePassengerCount();

    minusButtons.forEach(function (minusButton, index) {
        minusButton.addEventListener("click", function () {
            let currentCount = parseInt(passengerCount[index].textContent);
            if (currentCount > 0) {
                passengerCount[index].textContent = currentCount - 1;
                updatePassengerCount();
            }
        });
    });

    plusButtons.forEach(function (plusButton, index) {
        plusButton.addEventListener("click", function () {
            let currentCount = parseInt(passengerCount[index].textContent);
            passengerCount[index].textContent = currentCount + 1;
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
    });

    function updatePassengerSeat(seatType) {
        let passengerSeatButton = document.querySelector(".passenger_seat_btn");
        let passengerSeatSpans = passengerSeatButton.querySelectorAll("span");
        passengerSeatSpans[1].textContent = seatType;
    }

    // 승객 좌석 선택

    let transFormBtns = document.querySelectorAll(".transform_btn");

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
        });
    });

});
