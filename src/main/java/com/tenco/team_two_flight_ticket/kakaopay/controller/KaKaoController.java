package com.tenco.team_two_flight_ticket.kakaopay.controller;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.kakaopay.dto.KakaoPayApprovalDTO;
import com.tenco.team_two_flight_ticket.kakaopay.service.KakaoPayService;
import com.tenco.team_two_flight_ticket.user.User;
import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Log
@Controller
public class KaKaoController {
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

//    @GetMapping("/kakaoPay/success")
//    public String kakaoSuccess(@RequestParam("pg_token") String pg_token, Model model, Integer id) {
//        log.info("kakaoPaySuccess get............................................");
//        log.info("kakaoPaySuccess pg_token : " + pg_token);
//
//        KakaoPayApprovalDTO paymentInfo =  kakaoPayService.kakaoPayInfo(pg_token, 2);
//
//        model.addAttribute("paymentInfo", paymentInfo);
//        System.out.println(paymentInfo.getItem_name());
//        System.out.println(paymentInfo.getAmount().getDiscount() + "할인");
//        System.out.println();
//
//        return "redirect:/payed";
//    }

    @ResponseBody
    @PostMapping("/kakaoPay/cancel")
    public String kakaoCancel() {
        kakaoPayService.kakaoPayCancel();
        System.out.println(kakaoPayService.kakaoPayCancel());
        return "dddd";
    }

    @ResponseBody
    @PostMapping("/kakaoPay/fail")
    public String kakaoFail() {
        kakaoPayService.kakaoPayCancel();
        System.out.println(kakaoPayService.kakaoPayCancel());
        return "";
    }
}
