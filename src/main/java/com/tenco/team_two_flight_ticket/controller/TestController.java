package com.tenco.team_two_flight_ticket.controller;

import com.tenco.team_two_flight_ticket.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket.handler.exception.MyNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

    @GetMapping("/auth/test")
    public String test(){
     return "main";
    }
}
