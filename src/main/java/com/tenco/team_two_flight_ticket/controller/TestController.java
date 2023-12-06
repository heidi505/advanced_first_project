package com.tenco.team_two_flight_ticket.controller;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class TestController {

    @GetMapping("/test")
    public String test() {
        return "test";
    }

    // @PostMapping("/test")
    // public String validtest(@Valid UserRequest.JoinDTO joinDTO){
    // return "main";
    // }

    @GetMapping("/reservation/preview")
    public String test3() {
        return "reservation/preview";
    }

    @GetMapping("/reservation/detail")
    public String test4(){
        return"reservation/detail";
    }

    @GetMapping("/main")
    public String test2() {
        return "main";
    }

    @GetMapping("/detailtest")
    public String test5(){
        return "test";
    }

}
