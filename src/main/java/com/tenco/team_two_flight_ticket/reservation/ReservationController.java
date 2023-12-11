package com.tenco.team_two_flight_ticket.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ReservationController {
    @GetMapping("/preview")
    public String test1() {
        return "reservation/preview";
    }

    // http://localhost:8080/reservation/detail

 	@GetMapping("/reservation/detail/{reservationNum}")
 	public String detail(@PathVariable int reservationNum) {
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
    
    // 취소 시 상세 정보 들고 가야함
    @GetMapping("/reservation/cancel-modal/{reservationNumber}")
    public String cancelModal(@PathVariable Long reservationNumber , Model model) {
    	model.addAttribute("cancelRequest",true);
    	
    	return "reservation/reservationDetail";
    }
    
    
    
}
