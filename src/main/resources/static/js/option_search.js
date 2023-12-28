let option = document.getElementsByName("option");
let flightOption = new Array();

for (let i = 0; i < option.length; i++) {
    option[i].addEventListener("click", async function () {
        if(option[i].checked){
        console.log("여기:" + option[i].value);
        flightOption.push(option[i].value);
        console.log(flightOption);}

        if (!option[i].checked){
            flightOption.pop(option[i].value);
            console.log(flightOption);
        }
        document.getElementById("airlineOption").value = flightOption;
    });
}
//인풋태그 네임만 dto 내부 list 필드랑 같으면 됨

let depOption = document.getElementsByName("onewayDepOption");
let depTimeArr = new Array();

for (let i = 0; i < depOption.length ; i++) {
    depOption[i].addEventListener("click", async function(){
        if(depOption[i].checked){
            console.log("여기:" + depOption[i].value);
            depTimeArr.push(depOption[i].value);
            console.log("배열:"+depTimeArr);}

        if (!depOption[i].checked){
            depTimeArr.pop(depOption[i].value);
            console.log("제거 후 배열:"+depTimeArr);
        }
        document.getElementById("onewayDepTimeOption").value = depTimeArr;

    });
}

let roundDepOption = document.getElementsByName("roundDepOption");
let roundDepArr = new Array();

for (let i = 0; i < roundDepOption.length; i++) {
    roundDepOption[i].addEventListener("click", async function(){
        if (roundDepOption[i].checked){
            roundDepArr.push(roundDepOption[i].value);
        }
        if (!roundDepOption[i].checked){
            roundDepArr.pop(roundDepOption[i].value);
        }

        document.getElementById("roundDepTimeOption").value = roundDepArr;

    });

}

let onewayArrOption = document.getElementsByName("onewayArrOption");
let onewayArr = new Array();

for (let i = 0; i < onewayArrOption.length; i++) {
    onewayArrOption[i].addEventListener("click", async function(){
        if (onewayArrOption[i].checked){
            console.log("여기:"+onewayArrOption[i]);
            onewayArr.push(onewayArrOption[i].value);
        }
        if (!onewayArrOption[i].checked){
            onewayArr.pop(onewayArrOption[i].value);
        }

        document.getElementById("onewayArrTimeOption").value = onewayArr;

    });

}

let roundArrOption = document.getElementsByName("roundArrOption");
let roundArr = new Array();

for (let i = 0; i < roundArrOption.length; i++) {
    roundArrOption[i].addEventListener("click", async function(){
        if (roundArrOption[i].checked){
            roundArr.push(roundArrOption[i].value);
        }
        if (!roundArrOption[i].checked){
            roundArr.pop(roundArrOption[i].value);
        }

        document.getElementById("roundArrTimeOption").value = roundArr;

    });

}


// 가격 낮은 순, 비행시간 짧은 순 정렬
// const sortTypeValue = document.getElementById("sortType");
// let result = {};
// const selectedSortType = sortTypeValue.options[sortTypeValue.selectedIndex].value;
//
// function createFlightHTML(ticket) {
//     let html = '<div class="flight_detail_wrap">' +
//         '<div class="flight_detail_area">';
//
//     for (let j = 0; j < ticket.itineraries.length; j++) {
//         let itinerary = ticket.itineraries[j];
//
//         html += '<div class="flight_detail_cont">' +
//             '<div class="flight_search_result active">';
//
//         for (let k = 0; k < itinerary.segments.length; k++) {
//             let segment = itinerary.segments[k];
//
//             html += '<ul class="flight_result_top">' +
//                 '<li class="airline_icon">' +
//                 '<span class="airline_icon_img"><img src="/images/airline_images/' + segment.carrierCode + '.png"></span>' +
//                 '<span>' + segment.airlineName + '</span>' +
//                 '</li>' +
//                 '<li>' +
//                 '<div>' +
//                 '<span class="airline_time">' + segment.departure.time() + '</span>' +
//                 '<span class="airline_arrow_icon">' +
//                 '<img src="/images/icons/my_trip_arrow.svg" alt="화살표">' +
//                 '</span>' +
//                 '<span class="airline_time">' + segment.arrival.time() + '</span>' +
//                 '</div>' +
//                 '<div class="airline_txt">' +
//                 '<span>' + segment.departure.iataCode + '</span>' +
//                 '<span class="airline_time_taken">' + itinerary.duration + '</span>' +
//                 '<span>' + segment.arrival.iataCode + '</span>' +
//                 '</div>' +
//                 '</li>' +
//                 '<li>';
//
//             // 동적으로 추가되는 부분
//             if (segment.stops == null) {
//                 html += '<div>직항</div>' +
//                     '<div class="airline_txt">' + itinerary.duration + '</div>';
//             } else {
//                 html += '<div>경유</div>' +
//                     '<div class="airline_txt">' + itinerary.duration + '</div>';
//             }
//
//             html += '</li>' +
//                 '</ul>';
//         }
//
//         html += '<div class="detail_more_btn">' +
//             '<span>상세보기</span>' +
//             '<div class="detail_arrow"><img src="/images/icons/icon_down.svg"></div>' +
//             '</div>' +
//             '</div>' +
//             '<ul class="flight_detail_price">' +
//             '<li>' +
//             '<span class="remaining_seats">' + ticket.numberOfBookableSeats + '석 남음</span>' +
//             '</li>' +
//             '<li>' +
//             '<a href="/ticket/preview/' + ticket.id + '" class="reservation_price">' + ticket.price.grandTotal + '원</a>' +
//             '</li>' +
//             '</ul>' +
//             '</div>';
//     }
//
//     html += '</div>' +
//         '</div>';
//
//     return html;
// }
//
// function populateDropdown(data) {
//     let viewData = document.getElementById("flightResults");
//     let isRound = 1; // 가정
//
//     viewData.innerHTML = "";
//
//     if (data.list && Array.isArray(data.list)) {
//         data.list.forEach(ticket => {
//             if (isRound === 1) {
//                 let ticketHTML = createFlightHTML(ticket);
//                 viewData.innerHTML += ticketHTML;
//             }
//         });
//     } else {
//         console.error("Invalid data format received from the server");
//     }
// }
//
// // 이벤트 핸들러
// sortTypeValue.addEventListener("change", function () {
//     fetch("/flight-search/select/" + selectedSortType, {
//         method: "GET",
//         headers: {
//             "Content-Type": "application/json",
//         },
//     })
//         .then(response => response.json())
//         .then(data => {
//             console.log(data);
//             populateDropdown(data);
//         })
//         .catch(error => {
//             console.error("Error sending selectedSortType:", error);
//         });
// });

