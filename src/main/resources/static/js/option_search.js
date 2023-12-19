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


// // document.getElementById("airlineOption").value
// function sendSelectedOptions() {
//     var selectedOptions = [];
//
//     // 모든 체크박스 엘리먼트를 가져옴
//     var checkboxes = document.querySelectorAll('input[name="option"]:checked');
//
//     // 선택된 각 체크박스의 값을 배열에 추가
//     checkboxes.forEach(function (checkbox) {
//         selectedOptions.push(checkbox.value);
//         console.log(checkbox.value);
//     });

//     document.getElementById("airlineOption").value = selectedOptions;
// }