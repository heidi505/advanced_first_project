package com.tenco.team_two_flight_ticket.user;

import java.util.List;

import com.tenco.team_two_flight_ticket._core.utils.PicUrl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.reservation.ReservationService;
import com.tenco.team_two_flight_ticket.user.UserRequest.GetMyTravelListDTO;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTravelDTO;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTripCntAndListDTO;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTripCountDTO;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession session;

	@Autowired
	private ReservationService reservationService;

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
		return "redirect:/user/sign-in";
	}
	@GetMapping("/coupon")
	public String coupon() {
		return "user/coupon";
	}

	@GetMapping("/my-travel")
	public String myPageTravel(@Valid GetMyTravelListDTO dto , Model model ) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		List<GetMyTravelDTO> tripList = reservationService.getMyTravel(1, dto);
		GetMyTripCountDTO tripCount = reservationService.getMyTripCount(1,dto);
		model.addAttribute("tripCount", tripCount);
		model.addAttribute("tripList",tripList);
		return "user/myTravel";
	}
	
	@ResponseBody
	@GetMapping("/get-my-travel")
	public GetMyTripCntAndListDTO myPageTravelProc(@Valid GetMyTravelListDTO dto, Errors errors) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		//principal.getId()
		List<GetMyTravelDTO> tripList = reservationService.getMyTravel(1, dto);
		GetMyTripCountDTO tripCount = reservationService.getMyTripCount(1,dto);
		GetMyTripCntAndListDTO myTrip = new GetMyTripCntAndListDTO();
		myTrip.setTripCount(tripCount);
		myTrip.setTripList(tripList);
		
		return myTrip;
	}
	

	
	
	
}
