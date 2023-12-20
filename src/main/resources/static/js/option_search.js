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


