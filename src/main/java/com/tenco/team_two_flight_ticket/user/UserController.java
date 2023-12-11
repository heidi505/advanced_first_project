package com.tenco.team_two_flight_ticket.user;

import java.util.List;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.reservation.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

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
	public String myPageTravel(@Valid UserRequest.GetMyTravelListDTO dto , Model model ) {
		
		return "user/myTravel";
	}
	
	
}
