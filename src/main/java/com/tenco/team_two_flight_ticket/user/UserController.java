package com.tenco.team_two_flight_ticket.user;

import java.util.List;

import com.tenco.team_two_flight_ticket.coupon.CouponService;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponListDTO;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetMyTravelDTO;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetMyTripCountDTO;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetMyTripYearDTO;
import com.tenco.team_two_flight_ticket.reservation.ReservationService;
import com.tenco.team_two_flight_ticket.user.UserRequest.GetMyTravelListDTO;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTripCntAndListDTO;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Slf4j
@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession session;

	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private CouponService couponService;


	@GetMapping("/profile")
	public String profile(Model model) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		int couponNum = userService.getProfile(principal);


		model.addAttribute("principal", principal);
		model.addAttribute("couponNum", couponNum);

		return "user/profile";
	}
	
	@GetMapping("/profile-management")
	public String profileManagement(Model model) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		int couponNum = userService.getProfile(principal);

		model.addAttribute("principal", principal);
		model.addAttribute("couponNum", couponNum);
		return "user/profileManagement";
	}

	@PostMapping("/profile-management")
	public String updateUser(@Valid UserRequest.UserUpdateDTO dto, Errors errors) {
		userService.updateUser(dto);
		return "redirect:/user/profile";
	}
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/sign-in";
	}
	@GetMapping("/coupon")
	public String coupon(Model model) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		// coupon 목록 조회
		List<CouponListDTO> couponList = couponService.findCouponByUserId(principal.getId());
		// coupon 수 조회
		int couponNum = userService.getProfile(principal);
		model.addAttribute("couponList",couponList);
		model.addAttribute("couponNum",couponNum);
		model.addAttribute("principal",principal);		
		return "user/coupon";
	}

	@GetMapping("/my-travel")
	public String myPageTravel(@Valid GetMyTravelListDTO dto, Model model,Errors errors) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		GetMyTripYearDTO tripYear = reservationService.getMyTripDepartureYear(principal.getId(), dto);
		model.addAttribute("maxYear",tripYear.getMaxYear());
		model.addAttribute("minYear",tripYear.getMinYear());
		return "user/myTravel";
	}
	
	@ResponseBody
	@GetMapping("/get-my-travel")
	public GetMyTripCntAndListDTO myPageTravelProc(@Valid GetMyTravelListDTO dto, Errors errors) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		List<GetMyTravelDTO> tripList = reservationService.getMyTravel(principal.getId(), dto);
		GetMyTripCountDTO tripCount = reservationService.getMyTripCount(principal.getId(),dto);
		GetMyTripYearDTO tripYear = reservationService.getMyTripDepartureYear(principal.getId(), dto);
		GetMyTripCntAndListDTO myTrip = new GetMyTripCntAndListDTO();
		myTrip.setTripCount(tripCount);
		myTrip.setTripList(tripList);
		myTrip.setMinYear(tripYear.getMinYear());
		myTrip.setMaxYear(tripYear.getMaxYear());
		return myTrip;
	}

	@ResponseBody
	@GetMapping("/gpt/{condition}")
	public String gptTest(@PathVariable String condition){
		return userService.getChatResponse(condition);
	}

	
	
	
}
