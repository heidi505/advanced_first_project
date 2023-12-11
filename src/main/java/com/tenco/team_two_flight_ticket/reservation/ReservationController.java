package com.tenco.team_two_flight_ticket.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationController {
    @GetMapping("/preview")
    public String test1() {
        return "reservation/preview";
    }

    // http://localhost:8080/reservation/detail

 	@GetMapping("/reservation/detail")
 	public String detail() {
 		return "/reservation/reservationDetail";
 	}
 	
 	@GetMapping("/reservation/cancel")
 	public String cancel() {
 		return "/reservation/cancelReservation";
 	}
 	
 	@GetMapping("/reservation/final-result")
 	public String finalResult() {
 		return "/reservation/finalResult";
 	}

    @GetMapping("/detail")
    public String test4() {
        return "reservation/detail";
    }
    
    @GetMapping("/payed")
    public String payed(){
    	return"reservation/paymentEnd";
    }
    @GetMapping("/reserved")
    public String reserved(){
    	return"reservation/finalResult";
    }


    @GetMapping("/sample")
    public String test2() {
        return "reservation/sample2";
    }

    // 운임규정 모달 버튼 (위치 잡고 추가만 해주면 됨!)
    // 예약규정, 운임규정, 결제규정, 환불/변경
    @GetMapping("/regulation")
    public String test05(){
        return "reservation/fareRegulation";
    }

    @GetMapping("/loading")
    public String loadingTest(){
        return "reservation/loadingPageSample";
    }

    @GetMapping("/loading2")
    public String loadingTest2(){
        return "reservation/loadingPage";
    }

    // 항공권 검색 - 카카오톡 문자까지 한페이지로 된 jsp
    @GetMapping("/mk")
    public String checkjsp(){
        return "reservation/bindtest";
    }

}
