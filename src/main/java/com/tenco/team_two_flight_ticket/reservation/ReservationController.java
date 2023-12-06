package com.tenco.team_two_flight_ticket.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationController {
    @GetMapping("/preview")
    public String test1() {
        return "reservation/preview";
    }

    @GetMapping("/detail")
    public String test4(){
        return"reservation/detail";
    }

    @GetMapping("/sample")
    public String test2(){
        return"reservation/sample2";
    }

    @GetMapping("/test")
    public String test3(){
        return"reservation/test";
    }
}
