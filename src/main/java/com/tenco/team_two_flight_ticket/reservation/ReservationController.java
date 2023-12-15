package com.tenco.team_two_flight_ticket.reservation;

import com.tenco.team_two_flight_ticket.kakaopay.dto.KakaoPayApprovalDTO;
import com.tenco.team_two_flight_ticket.kakaopay.service.KakaoPayService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetMyTripDetailDTO;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetPayedInfoDTO;

import com.tenco.team_two_flight_ticket.user.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {
    @Autowired
    private KakaoPayService kakaoPayService;

    @Autowired
    private HttpSession session;

    @Autowired
 	private ReservationService reservationService;


 	@ResponseBody
    @PostMapping("/reservation/cancel")
        public void cancelProc(@RequestBody Long reservationNum ) {
            reservationService.cancelReservation(reservationNum);
        }
 	// 복수 취소 여부에 따라 달라짐
//    @GetMapping("/reservation/cancel")
//    public String cancel(CancelReservationDTO dto, Model model) {
//        GetMyTripDetailDTO detailTrip  =  reservationService.getMyTripDetail(principal.getId(), reservationNum);
//        model.addAttribute("cancelTrip", cancelTrip);
//        ReservationResponse.GetPayedInfoDTO payedInfo = reservationService.getPayedInfo(dto.getNumList());
//        //ticket테이블에서 정보 가져와야 함
//        return "reservation/cancelReservation";
//    }


    @GetMapping("/reservation/final-result")
    public String finalResult() {
        return "/reservation/finalResult";
    }

    @GetMapping("/detail")

    public String test4() {
        return "reservation/detail";
    }

    @GetMapping("/payed")
    public String payed(@RequestParam("pg_token") String pg_token, Model model, Integer id) {


        KakaoPayApprovalDTO paymentInfo = kakaoPayService.kakaoPayInfo(pg_token, 2);
        ReservationResponse.ReservationPaymentDTO reservationInfo = kakaoPayService.reservationInfo(2);

        model.addAttribute("paymentInfo", paymentInfo);
        model.addAttribute("reservationInfo", reservationInfo);

        return "reservation/paymentEnd";
    }

    @GetMapping("/reserved")
    public String reserved() {
        return "reservation/finalResult";
    }


    @GetMapping("/sample")
    public String test2() {
        return "reservation/sample2";
    }

    // 운임규정 모달 버튼 (위치 잡고 추가만 해주면 됨!)
    // 예약규정, 운임규정, 결제규정, 환불/변경
    @GetMapping("/regulation")
    public String test05() {
        return "reservation/fareRegulation";
    }

    @GetMapping("/loading")
    public String loadingTest() {
        return "reservation/loadingPageSample";
    }

    @GetMapping("/loading2")
    public String loadingTest2() {
        return "reservation/loadingPage";
    }

    // 항공권 검색 - 카카오톡 문자까지 한페이지로 된 jsp
    @GetMapping("/mk")
    public String checkjsp() {
        return "reservation/bindtest";
    }

    // 취소 시 상세 정보 들고 가야함
    @GetMapping("/reservation/cancel-modal/{reservationNum}")
    public String cancelModal(@PathVariable Long reservationNum, Model model) {
        model.addAttribute("cancelRequest", true);
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
 		//GetMyTripDetailDTO detailTrip  =  reservationService.getMyTripDetail(principal.getId(), reservationNum);
 		ReservationResponse.GetMyTripDetailDTO detailTrip  =  reservationService.getMyTripDetail(1, reservationNum);

 		model.addAttribute("detailTrip", detailTrip);
        return "reservation/reservationDetail";
    }

    @PostMapping("reservation/save")
    public String save(ReservationRequest.SaveFormDto dto) {
        // 1. 인증검사
        // User principal = (User) session.getAttribute(Define.PRINCIPAL);
        // 2. 유효성 검사
        // 로직

        reservationService.save(dto);
        return null;
    }

}
