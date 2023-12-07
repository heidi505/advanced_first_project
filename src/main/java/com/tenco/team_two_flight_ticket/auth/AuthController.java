package com.tenco.team_two_flight_ticket.auth;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.user.User;
import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserResponse;
import com.tenco.team_two_flight_ticket.user.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private HttpSession session;

    @Autowired
    private JavaMailSender javaMailSender;

    private String email;


    //메인 페이지
    @GetMapping("/main")
    public String mainPage(){
        return "main";
    }

    //회원가입
    @GetMapping("/sign-up")
    public String signUp(){
        return "user/signUp";
    }

    //회원 가입
    @PostMapping("/sign-up")
    public String signUpProc(@Valid UserRequest.SignUpDTO dto, Errors errors){
        userService.signUp(dto);
        return "redirect:/sign-in";
    }

    //로그인
    @GetMapping("/sign-in")
    public String signIn() {
        return "user/signIn";
    }

    //로그인
    @PostMapping("/sign-in")
    public String signInProc(@Valid UserRequest.SignInDTO dto, Errors errors){
        User principal = userService.signIn(dto);
        session.setAttribute(Define.PRINCIPAL, principal);
        return "redirect:/main";
    }

    //카카오 로그인
    @GetMapping("/kakao/sign-in")
    public String kakaoSignIn() {
        return "user/kakaoSignIn";
    }

    //카카오 로그인
    @GetMapping("/kakao-callback")
    public void kakaoCallback(@RequestParam String code){

    }

    //유저 아이디 중복체크
    @GetMapping("/check/username")
    public ResponseEntity<ApiUtils.ApiResult<String>> nameCheck(@RequestParam String username){
        System.out.println("+++++++++++++++" + username);
        String message = userService.checkUsername(username);

        return ResponseEntity.ok().body(ApiUtils.success(message));

    }

    //유저에게 인증코드 담긴 이메일 발송
    @ResponseBody
    @GetMapping("/check/email")
    public void emailCheck(@RequestParam String email){
        this.email = email;
        userService.sendEmail(email);
    }

    //인증코드 받아와서 인증
    @GetMapping("/verify/email")
    public ResponseEntity<ApiUtils.ApiResult<String>> emailVerify(@RequestParam int key){
        String message = userService.verifyEmail(key);

        return ResponseEntity.ok().body(ApiUtils.success(message));

    }

    //비밀번호 찾기
    @GetMapping("/find-password")
    public String findPassword(){
        return "/user/findPassword";
    }

    @GetMapping("/find-password/email")
    public String sendEmailforPwd(@RequestParam String email){
        userService.setPassword(email);
        return "redirect:/sign-in";
    }






}
