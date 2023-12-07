package com.tenco.team_two_flight_ticket.admin.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
    @GetMapping("/sign-in")
    public String adminSignIn() {
        return "admin/signIn";
    }

}
