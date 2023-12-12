package com.tenco.team_two_flight_ticket.reservation;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.user.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReservationController {

    @Autowired
    private HttpSession session;

    @Autowired
    ReservationService reservationService;

    @GetMapping("/preview")
    public String test1() {
        return "reservation/preview";
    }

    // http://localhost:8080/reservation/detail

<<<<<<< HEAD
    @GetMapping("/reservation/detail")
    public String detail() {
        return "/reservation/reservationDetail";
    }

    @GetMapping("/reservation/cancel")
    public String cancel() {
        return "/reservation/cancelReservation";
    }

    @GetMapping("/reservation/final-result")
    public String finalResult() {
        return "/reservation/finalResult";
    }
=======
 	@GetMapping("/reservation/detail/{reservationNum}")
 	public String detail(@PathVariable int reservationNum) {
 		return "/reservation/reservationDetail";
 	}
 	
 	@GetMapping("/reservation/cancel")
 	public String cancel() {
 		return "/reservation/cancelReservation";
 	}
 	
 	@GetMapping("/reservation/final-result")
 	public String finalResult() {
 		return "/reservation/finalResult";
 	}
>>>>>>> master

    @GetMapping("/detail")
    public String test4() {
        return "reservation/detail";
    }

    @GetMapping("/payed")
    public String payed() {
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

<<<<<<< HEAD
=======
    // 항공권 검색 - 카카오톡 문자까지 한페이지로 된 jsp
    @GetMapping("/mk")
    public String checkjsp(){
        return "reservation/bindtest";
    }

>>>>>>> master
    // 취소 시 상세 정보 들고 가야함
    @GetMapping("/reservation/cancel-modal/{reservationNumber}")
    public String cancelModal(@PathVariable Long reservationNumber, Model model) {
        model.addAttribute("cancelRequest", true);

        return "reservation/reservationDetail";
    }

<<<<<<< HEAD
    @PostMapping("reservation/save")
    public String save(ReservationRequest.SaveFormDto dto) {
        // 1. 인증검사
        // User principal = (User) session.getAttribute(Define.PRINCIPAL);
        // 2. 유효성 검사
        // 로직

        reservationService.save(dto);
        return null;
    }

=======
>>>>>>> master
}
