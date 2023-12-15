package com.tenco.team_two_flight_ticket.kakaopay.controller;

import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket._middle._entity.City;
import com.tenco.team_two_flight_ticket.kakaopay.dto.KakaoPayApprovalDTO;
import com.tenco.team_two_flight_ticket.kakaopay.dto.cancelResponse.KaKaoCancelDTO;
import com.tenco.team_two_flight_ticket.kakaopay.service.KakaoPayService;
import com.tenco.team_two_flight_ticket.ticket.TicketService;
import com.tenco.team_two_flight_ticket.user.User;
import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Log
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
    public String kakaoPay() {
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        log.info("kakaoPay post............................................");

        return "redirect:" + kakaoPayService.kakaoPayReady(2);

    }
    @ResponseBody
    @PostMapping("/kakaoPay/cancel")
    public ResponseEntity<ApiUtils.ApiResult<KaKaoCancelDTO>> kakaoCancel() {
        KaKaoCancelDTO cancelDTO = kakaoPayService.kakaoPayCancel();
        return ResponseEntity.ok().body(ApiUtils.success(cancelDTO));
    }

    @GetMapping("/cities-list")
    public ResponseEntity<ApiUtils.ApiResult<List<City>>> citiesList(@RequestParam(defaultValue = "대한민국") String region){
        List<City> cities = ticketService.getCities(region);
        return ResponseEntity.ok().body(ApiUtils.success(cities));
    }

    @ResponseBody
    @PostMapping("/kakaoPay/fail")
    public String kakaoFail() {
        kakaoPayService.kakaoPayCancel();
        System.out.println(kakaoPayService.kakaoPayCancel());
        return "";
    }
}
