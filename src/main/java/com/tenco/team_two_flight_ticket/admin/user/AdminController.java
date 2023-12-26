package com.tenco.team_two_flight_ticket.admin.user;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.ticket.TicketResponse;
import com.tenco.team_two_flight_ticket.user.User;
import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@RequestMapping("/admin")
@Controller
public class AdminController {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserService userService;

    @GetMapping("/sign-in")
    public String adminSignIn() {
        return "admin/signIn";
    }

    @PostMapping("/sign-in")
    public String signInProc(@Valid UserRequest.SignInDTO dto, Model model, Errors errors){
        System.out.println(111111);
        System.out.println(dto.getUsername());
        User principal = userService.signIn(dto);
        session.setAttribute(Define.PRINCIPAL, principal);
        if(principal.isAdmin() == true) {
            return "redirect:/admin/banner-list";
        } else {
            throw new MyBadRequestException("아이디 혹은 비밀번호를 찾을 수 없습니다");
        }
    }

    @GetMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/admin/sign-in";
    }
}
