package com.tenco.team_two_flight_ticket.kakaopay.controller;

import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket._middle._entity.City;
import com.tenco.team_two_flight_ticket.kakaopay.dto.KakaoPayApprovalDTO;
import com.tenco.team_two_flight_ticket.kakaopay.dto.KakaoPayNewDTO;
import com.tenco.team_two_flight_ticket.kakaopay.dto.cancelResponse.KaKaoCancelDTO;
import com.tenco.team_two_flight_ticket.kakaopay.service.KakaoPayService;
import com.tenco.team_two_flight_ticket.ticket.TicketService;
import com.tenco.team_two_flight_ticket.user.User;
import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Slf4j
@Controller
public class KaKaoController {

    @Autowired
    private TicketService ticketService;

    @Autowired
    private KakaoPayService kakaoPayService;

    @Autowired
    private HttpSession session;

    @GetMapping("/kakaoPay")
    public String kakaoPayGet() {
        return "user/kakaoPay";
    }

    @PostMapping("/kakaoPay")
    public String kakaoPay(KakaoPayNewDTO dto) {
        System.out.println("=======================");
        System.out.println(dto);
        System.out.println("========================");
        log.info("kakaoPay post............................................");

        return "redirect:" + kakaoPayService.kakaoPayReady(dto);

    }

    @PostMapping("/kakaoPay/cancel")
    public ResponseEntity<ApiUtils.ApiResult<String>> kakaoCancel() {
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        String message = kakaoPayService.kakaoPayCancel(principal.getId());

        return ResponseEntity.ok().body(ApiUtils.success(message));
    }

    @GetMapping("/kakaoPay/cancel")
    public String kakaoCancelGet(){
        return "redirect:/main";
    }


    @ResponseBody
    @PostMapping("/kakaoPay/fail")
    public String kakaoFail() {
        return "";
    }
}
