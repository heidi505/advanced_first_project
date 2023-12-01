package com.tenco.team_two_flight_ticket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
    @GetMapping("/main")
    public String test(){
        return "account/blank";
    }
}
