package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;

import com.tenco.team_two_flight_ticket.coupon.dto.CouponListDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DataDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.TravelerPricingDTO;
import com.tenco.team_two_flight_ticket.ticket.TicketService;

import com.tenco.team_two_flight_ticket.user.UserService;
import lombok.extern.slf4j.Slf4j;

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
@Slf4j
@Controller
public class ReservationController {
    @Autowired
    private KakaoPayService kakaoPayService;
    @Autowired
    private HttpSession session;
    @Autowired
    private ReservationService reservationService;
    @Autowired
    private TicketService ticketService;

    /* 페이지 별로 분리 된 시나리오 */
    // 선택한 항공권 보기 페이지 (검색 후 나오는 항공권 목록에서 클릭시 나오는 화면)
    @GetMapping("/preview")
    public String test1() {
        return "reservation/preview";
    }

    // 프리뷰 페이지에서 예약하기 버튼 클릭시 예약하기 입력 폼 화면
    @GetMapping("/detail/{ticketId}")
    public String test4(@PathVariable int ticketId, Model model) {

        List<DataDTO> dto = ticketService.ticketDetail(ticketId);
        int isRound = dto.get(0).getItineraries().size();

        model.addAttribute("ticket", dto.get(0));
        session.setAttribute("ticketData", dto.get(0));
        for (DataDTO dataDTO : dto) {
            System.out.println("디티오아디");
            System.out.println("Ticket: " + dataDTO.getId());
            System.out.println("이티너리스");
            System.out.println("Ticket: " + dataDTO.getItineraries());
            System.out.println("타입");
            System.out.println("Ticket: " + dataDTO.getType());
            System.out.println("프라이스카운트");
            System.out.println("Ticket: " + dataDTO.getPrice().getPeopleCount());
            System.out.println("트레벌프라이싱");
            System.out.println("Ticket: " + dataDTO.getTravelerPricings());
            System.out.println("북에이블싯");
            System.out.println("Ticket: " + dataDTO.getNumberOfBookableSeats());
        }
        model.addAttribute("isRound", isRound);
        return "reservation/detail";
    }

    // 디테일 페이지에서 예약하기 버튼 클릭시 수행
    @PostMapping("reservation/save")
    public String save(ReservationRequest.SaveFormDto dto) {
        // 1. 인증검사
        System.out.println("터지는 라인 체크 1");

        User principal = (User) session.getAttribute(Define.PRINCIPAL);

        // 2. 유효성 검사
        // 로직
        DataDTO dataDTO = (DataDTO) session.getAttribute("ticketData");


//        List<PassengerDTO> savedto = flightDTO.getPassengerDTOList();
        ReservationRequest.SaveFormDto savedto = dto;

        System.out.println("티켓데이터");
        System.out.println(dataDTO);
        System.out.println("dto 체크체크");
        System.out.println(dto);

        System.out.println(savedto);
        System.out.println(savedto.getPassengerDTOS().get(0).getLastName());
        ReservationResponse.SaveResultDTO saveResultDTO = reservationService.save(dto, principal, dataDTO);
        // 카카오 메시지 보내기
        String kakaoAccessToken = (String) session.getAttribute("kakaoAccessToken");
        if ("Y".equals(dto.getOptionMessage())) {

            String message = reservationService.kakaoMessage(1, kakaoAccessToken, saveResultDTO);
            session.setAttribute("reservationResult", saveResultDTO);

            return "redirect:/reservation/final-result";
        }

        session.setAttribute("reservationResult", saveResultDTO);

        return "redirect:/reservation/final-result";
    }

    @GetMapping("/mk3")
    public String mk4() {
        return "reservation/help2";
    }

    // 수행 후 나오는 결과 화면
    @GetMapping("/reservation/final-result")
    public String finalResult(HttpSession session, Model model) {

        ReservationResponse.SaveResultDTO resultDTO = (ReservationResponse.SaveResultDTO) session.getAttribute("reservationResult");
        User principal = (User) session.getAttribute(Define.PRINCIPAL);

        // 쿠폰 받아오기.
        List<CouponListDTO> coupons = reservationService.getCouponList(principal);
        System.out.println("쿠폰체크 쿠폰체크 쿠폰체크으으");
        for (CouponListDTO coupon : coupons) {
            System.out.println("쿠폰 ID: " + coupon.getId());
            System.out.println("쿠폰 이름: " + coupon.getCouponName());
            System.out.println("쿠폰 이름: " + coupon.getExpiredAt());
            System.out.println("쿠폰 이름: " + coupon.getDiscountingPrice());
        }
        // 3. 쿠폰 정보 모델에 추가.

        model.addAttribute("Coupon", coupons);
        model.addAttribute("Result", resultDTO);
        model.addAttribute("Ticket", resultDTO.getTicket());
        model.addAttribute("Passenger", resultDTO.getPassenger());
        System.out.println("잘 담겼나 안담겼나~~");
        System.out.println("Reservation Result:");
        System.out.println("Reservation: " + resultDTO.getReservation().getId());
        System.out.println("Reservation: " + resultDTO.getReservation().getId());
        System.out.println("Reservation: " + resultDTO.getTicket().get(0).getAirFare());
        return "/reservation/finalResult";
    }
    // 예약 시나리오 끝!!

    @ResponseBody
    @PostMapping("/reservation/cancel")
    public void cancelProc(@RequestBody ReservationRequest.ReservationCancelDTO dto) {
        reservationService.cancelReservation(dto.getReservationNum());
    }


    @GetMapping("/reservation/cancel/{reservationNum}")
    public String cancel(@PathVariable Long reservationNum, Model model) {
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        GetMyTripDetailDTO cancelTrip = reservationService.getMyTripDetail(principal.getId(), reservationNum);
        model.addAttribute("cancelTrip", cancelTrip);
        List<ReservationResponse.GetPayedInfoDTO> payedInfoList = reservationService.getPayedInfo(reservationNum);
        model.addAttribute("payedInfoList", payedInfoList);
        return "reservation/reservationCancelInfo";
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
    
    // 예약 상세 보기
    @GetMapping("/reservation/detail/{reservationNum}")
    public String reservationDetail(@PathVariable Long reservationNum, Model model) {
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        ReservationResponse.GetMyTripDetailDTO detailTrip = reservationService.getMyTripDetail(principal.getId(), reservationNum);
        List<ReservationResponse.GetPayedInfoDTO> payedInfoList = reservationService.getPayedInfo(reservationNum);
        model.addAttribute("detailTrip", detailTrip);
        model.addAttribute("payedInfoList", payedInfoList);
        return "reservation/reservationDetail";
    }
    

    // 취소 시 상세 정보 들고 가야함
    @GetMapping("/reservation/cancel-modal/{reservationNum}")
    public String cancelModal(@PathVariable Long reservationNum, Model model) {
        model.addAttribute("cancelRequest", true);
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        ReservationResponse.GetMyTripDetailDTO detailTrip = reservationService.getMyTripDetail(principal.getId(), reservationNum);
        List<ReservationResponse.GetPayedInfoDTO> payedInfoList = reservationService.getPayedInfo(reservationNum);
        model.addAttribute("detailTrip", detailTrip);
        model.addAttribute("payedInfoList", payedInfoList);
        return "reservation/reservationDetail";
    }

    @GetMapping("/fix")
    public String fix() {
        return "reservation/finalResult2";
    }

}
