package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.kakaopay.dto.KakaoPayApprovalDTO;
import com.tenco.team_two_flight_ticket.kakaopay.service.KakaoPayService;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetMyTripDetailDTO;
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

    /* 페이지 별로 분리 된 시나리오 */
    // 선택한 항공권 보기 페이지 (검색 후 나오는 항공권 목록에서 클릭시 나오는 화면)
    @GetMapping("/preview")
    public String test1() {
        return "reservation/preview";
    }

    // 프리뷰 페이지에서 예약하기 버튼 클릭시 예약하기 입력 폼 화면
    @GetMapping("/detail")
    public String test4() {
        return "reservation/detail";
    }

    // 디테일 페이지에서 예약하기 버튼 클릭시 수행
    @PostMapping("reservation/save")
    public String save(ReservationRequest.SaveFormDto dto, Model model) {
        // 1. 인증검사
        // User principal = (User) session.getAttribute(Define.PRINCIPAL);
        // 2. 유효성 검사
        // 로직
        ReservationResponse.SaveResultDTO saveResultDTO = reservationService.save(dto);

        session.setAttribute("reservationResult", saveResultDTO);

        return "redirect:/reservation/final-result";
    }

    @GetMapping("/mk3")
    public String mk4(){
        return "reservation/help2";
    }

    // 수행 후 나오는 결과 화면
    @GetMapping("/reservation/final-result")
    public String finalResult(HttpSession session, Model model) {
        ReservationResponse.SaveResultDTO resultDTO = (ReservationResponse.SaveResultDTO) session.getAttribute("reservationResult");
        model.addAttribute("Result", resultDTO);
        System.out.println("잘 담겼나 안담겼나~~");
        System.out.println("Reservation Result:");
        System.out.println("Reservation: " + resultDTO.getReservation());
        System.out.println("Passenger: " + resultDTO.getPassenger());
        System.out.println("Tickets: " + resultDTO.getTicket());
        return "/reservation/finalResult";
    }
    // 예약 시나리오 끝!!

 	@ResponseBody
    @PostMapping("/reservation/cancel")
        public void cancelProc(@RequestBody Long reservationNum ) {
            reservationService.cancelReservation(reservationNum);
        }
 	

    @GetMapping("/reservation/cancel/{reservationNum}")
    public String cancel(@PathVariable Long reservationNum, Model model) {
        GetMyTripDetailDTO cancelTrip  =  reservationService.getMyTripDetail(1, reservationNum);
        model.addAttribute("cancelTrip", cancelTrip);
        List<ReservationResponse.GetPayedInfoDTO> payedInfoList = reservationService.getPayedInfo(reservationNum);
        model.addAttribute("payedInfoList", payedInfoList);
        return "reservation/cancelReservation";
    }

    @GetMapping("/payed")
    public String payed(@RequestParam("pg_token") String pg_token, Model model) {

        User principal = (User) session.getAttribute(Define.PRINCIPAL);

        KakaoPayApprovalDTO paymentInfo = kakaoPayService.kakaoPayInfo(pg_token, principal.getId());
        ReservationResponse.ReservationPaymentDTO reservationInfo = kakaoPayService.reservationInfo(principal.getId());

        model.addAttribute("paymentInfo", paymentInfo);
        model.addAttribute("reservationInfo", reservationInfo);

        return "reservation/paymentEnd";
    }

    @GetMapping("/reserved")
    public String reserved() {
        return "reservation/finalResult";
    }

    /* 테스트용 + 예비 */

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

}
