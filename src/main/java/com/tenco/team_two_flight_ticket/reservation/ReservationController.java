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
    

    @GetMapping("/detail")
    public String test4(){
        return"reservation/detail";
    }
    
    @GetMapping("/payed")
    public String payed(){
    	return"reservation/paymentEnd";
    }
    @GetMapping("/reserved")
    public String reserved(){
    	return"reservation/finalResult";
    }

}
