package com.tenco.team_two_flight_ticket.auth;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.auth.authresponse.KakaoProfile;
import com.tenco.team_two_flight_ticket.auth.authresponse.OAuthToken;
import com.tenco.team_two_flight_ticket.search.SearchedResponse;
import com.tenco.team_two_flight_ticket.search.SearchedService;
import com.tenco.team_two_flight_ticket.ticket.TicketResponse.GetTicketDateDTO;
import com.tenco.team_two_flight_ticket.ticket.TicketService;
import com.tenco.team_two_flight_ticket.user.User;
import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private HttpSession session;

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private TicketService ticketService;
    private String email;

    @Autowired
    private SearchedService searchService;

    //메인 페이지
    @GetMapping("/main")
    public String mainPage(Model model){

        String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
        String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};

        for (int i = 0; i < regions.length; i++) {
            model.addAttribute(values[i],ticketService.getCities(regions[i]));
        }
        
        //최근 검색한 항공권 목록을 가지고 와야 함(searched DB)
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        List<SearchedResponse.GetRecentSearchDTO> searchedList = searchService.getRecentSearch(1);
        model.addAttribute("searchedList", searchedList);
        System.out.println(searchedList);
        
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
        System.out.println("1: 실명" + dto.getRealName());
        System.out.println("2: 유저아이디" + dto.getUsername());
        System.out.println("3: 이메일" + dto.getEmail());
        System.out.println("4: 비번" + dto.getPassword());
        System.out.println("5: 비번체크" + dto.getPasswordCheck());
        
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
    public String signInProc(@Valid UserRequest.SignInDTO dto, Model model, Errors errors){
        User principal = userService.signIn(dto);
        session.setAttribute(Define.PRINCIPAL, principal);
        // 로그인 시 예약한 티켓 날짜를 가져와 보냄
        GetTicketDateDTO ticketDate  = ticketService.getTicketDate(1);
        System.out.println(ticketDate);
        model.addAttribute("ticketDate", ticketDate);
        return "redirect:/main";
    }

    //카카오 로그인
    @GetMapping("/kakao/sign-in")
    public String kakaoSignIn() {
        return "user/kakaoSignIn";
    }

    //카카오 로그인
    @GetMapping("/user/kakao-redirect")
    public String kakaoRedirect(@RequestParam String code, UserRequest.SignUpDTO dto) {
        System.out.println("메서드 동작 확인");

        RestTemplate r1 = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();

        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
        bodies.add("grant_type","authorization_code");
        bodies.add("client_id",Define.KAKAOKEY);
        bodies.add("redirect_uri","http://localhost:8080/user/kakao-redirect");
        bodies.add("code",code);

        HttpEntity<MultiValueMap<String,String>> requestMsg = new HttpEntity<>(bodies,headers);
        ResponseEntity<OAuthToken> response = r1.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, requestMsg,OAuthToken.class);
        System.out.println("-----------------");
        System.out.println(response.getHeaders());
        System.out.println(response.getBody());
        System.out.println(response.getBody().getAccess_token());
        System.out.println("-----------------");
        // 여기까지 토큰 받기 위함 //


        RestTemplate r2 = new RestTemplate();
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization","Bearer " + response.getBody().getAccess_token());
        headers2.add("Content-type", "Content-type: application/x-www-form-urlencoded;charset=utf-8");

        // 헤더 바디 결합
        HttpEntity<MultiValueMap<String, String>> requestMsg2 = new HttpEntity<>(headers2);

        // 요청
        ResponseEntity<KakaoProfile> response2 = r2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, requestMsg2, KakaoProfile.class);
        System.out.println("---------------------");
        System.out.println(response2.getBody());
        System.out.println(response2.getBody().getProperties().getNickname());
        System.out.println("-----카카오 서버 정보 받기 완료------");

        KakaoProfile kakaoProfile = response2.getBody();
        System.out.println(kakaoProfile);

        userService.kakaoSignUp(dto);


        return "redirect:/main";
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

    @ResponseBody
    @GetMapping("/find-password/email")
    public ResponseEntity<ApiUtils.ApiResult<String>> sendEmailforPwd(@RequestParam String email){
        String message = userService.findUserByEmail(email);

        if (message.equals("있음")){
            message = userService.setPassword(email);
        }

        return ResponseEntity.ok().body(ApiUtils.success(message));
    }
}
