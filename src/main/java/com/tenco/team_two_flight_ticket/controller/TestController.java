package com.tenco.team_two_flight_ticket.controller;

import io.github.flashvayne.chatgpt.service.ChatgptService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

    @Autowired
    private ChatgptService chatgptService;
    @Autowired
    private ChatService chatService;

    @GetMapping("/test")
    public String test() {
        return "test";
    }

    @ResponseBody
    @GetMapping("/gpt")
    public String gptTest(){
        return chatService.getChatResponse();
    }

    @GetMapping("/reservation/preview")
    public String test3() {
        return "reservation/preview";
    }

    @GetMapping("/chatbot")
    public String chatbot(){
        return "user/chatbot";
    }

}
