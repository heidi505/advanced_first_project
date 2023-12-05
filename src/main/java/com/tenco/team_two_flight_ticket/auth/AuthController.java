package com.tenco.team_two_flight_ticket.auth;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.user.User;
import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserResponse;
import com.tenco.team_two_flight_ticket.user.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private HttpSession session;

    @GetMapping("/main")
    public String mainPage(){
        return "main";
    }
    @GetMapping("/sign-up")
    public String signUp(){
        return "user/signUp";
    }
    @PostMapping("/sign-up")
    public String signUpProc(UserRequest.SignUpDTO dto){
        userService.signUp(dto);
        return "redirect:/sign-in";
    }
    @GetMapping("/sign-in")
    public String signIn() {
        return "user/signIn";
    }

    @PostMapping("/sign-in")
    public String signInProc(UserRequest.SignInDTO dto){
        User principal = userService.signIn(dto);
        session.setAttribute(Define.PRINCIPAL, principal);
        return "redirect:/main";
    }

    @GetMapping("/kakao/sign-in")
    public String kakaoSignIn() {
        return "user/kakaoSignIn";
    }

    @GetMapping("/kakao-callback")
    public void kakaoCallback(@RequestParam String code){
        RestTemplate rt1 = new RestTemplate();

        //헤더 구성
        HttpHeaders headers1 = new HttpHeaders();
        headers1.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        //body 구성
        MultiValueMap<String, String> params1 = new LinkedMultiValueMap<>();
        params1.add("grant_type", "authorization_code");
        params1.add("client_id", "b3353bee8ecc7f0689a50e62a4cd4ada");
        params1.add("redirect_uri", "http://localhost:8080/user/kakao-callback");
        params1.add("code", code);

        //헤더 + 바디 결합
        HttpEntity<MultiValueMap<String, String>> requestMsg1 = new HttpEntity<>(params1, headers1);

        //요청 처리
        ResponseEntity<UserResponse.OAuthToken> response1 = rt1.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, requestMsg1, UserResponse.OAuthToken.class);

        //여기까지 토큰 받기 위함
        System.out.println("------------------------------");
        System.out.println(response1.getHeaders());
        System.out.println(response1.getBody());
        System.out.println("------------------------------");

        RestTemplate rt2 = new RestTemplate();
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer " + response1.getBody().getAccessToken());
        headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<MultiValueMap<String, String>> requestMsg2 = new HttpEntity<>(headers2);

        ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me",HttpMethod.POST,requestMsg2, String.class);

        //카카오 로그인으로 받을 수 있는 정보가 닉네임, 프로필 이미지 밖에 없어서 보류



    }



}