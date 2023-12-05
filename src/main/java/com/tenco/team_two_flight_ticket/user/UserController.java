package com.tenco.team_two_flight_ticket.user;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession session;

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
	public String updateUser(UserRequest.UserUpdateDTO dto) {

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
	
	
	
}
