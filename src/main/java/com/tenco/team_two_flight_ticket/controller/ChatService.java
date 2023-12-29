package com.tenco.team_two_flight_ticket.controller;

import io.github.flashvayne.chatgpt.service.ChatgptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {
    @Autowired
    private ChatgptService chatgptService;
    public String getChatResponse() {
        return chatgptService.sendMessage("도쿄 여행 일정 짜줘");
    }
}
