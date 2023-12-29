package com.tenco.team_two_flight_ticket.auth;

import java.util.List;

import lombok.extern.slf4j.Slf4j;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.admin.notice.NoticeResponseDTO;
import com.tenco.team_two_flight_ticket.admin.notice.NoticeService;
import com.tenco.team_two_flight_ticket.auth.authrequest.KakaoPushFindUserDTO;
import com.tenco.team_two_flight_ticket.auth.authrequest.KakaoPushMessageDTO;
import com.tenco.team_two_flight_ticket.auth.authrequest.KakaoPushUserDTO;
import com.tenco.team_two_flight_ticket.auth.authresponse.KakaoProfile;
import com.tenco.team_two_flight_ticket.auth.authresponse.KakaoPushTokenResponse;
import com.tenco.team_two_flight_ticket.auth.authresponse.KakaoPushUser;
import com.tenco.team_two_flight_ticket.auth.authresponse.OAuthToken;
import com.tenco.team_two_flight_ticket.auth.authresponse.PushAlertFail;
import com.tenco.team_two_flight_ticket.search.SearchedResponse;
import com.tenco.team_two_flight_ticket.search.SearchedService;
import com.tenco.team_two_flight_ticket.ticket.TicketResponse.GetTicketDateDTO;
import com.tenco.team_two_flight_ticket.ticket.TicketService;
import com.tenco.team_two_flight_ticket.user.User;
import com.tenco.team_two_flight_ticket.user.UserRepository;
import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserRequest.PushAlarmDTO;
import com.tenco.team_two_flight_ticket.user.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Slf4j
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

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private NoticeService noticeService;
    
    public static final String KAKAOPUSHKEY = "22999c9c34f480718a810c84766265f6";
    

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
        if(principal != null) {
        	List<SearchedResponse.GetRecentSearchDTO> searchedList = searchService.getRecentSearch(principal.getId());
        	model.addAttribute("searchedList", searchedList);        	
        }

        List<NoticeResponseDTO.NoticeListDTO> noticeList = noticeService.findAll();
        model.addAttribute("noticeList", noticeList);
        
        return "main";
    }

    //회원가입
    @GetMapping("/sign-up")
    public String signUp(){
        return "user/signUp";
    }

    //회원 가입
    @PostMapping("/sign-up")
    public String signUpProc(@Valid UserRequest.SignUpDTO dto,RedirectAttributes redirectAttributes , Errors errors){
        
        userService.signUp(dto);
        redirectAttributes.addAttribute("check" , true);
        return "redirect:/sign-in";
    }

    //로그인
    @GetMapping("/sign-in")
    public String signIn(@RequestParam(defaultValue = "false") Boolean check, Model model) {
    	// 회원 가입시 메시지
    	if(check) {
    		model.addAttribute(check);
    		model.addAttribute("message","회원가입에 성공했습니다");
    	}
        return "user/signIn";
    }

    //로그인
    @PostMapping("/sign-in")
    public String signInProc(@Valid UserRequest.SignInDTO dto, Model model, Errors errors){
        User principal = userService.signIn(dto);
        session.setAttribute(Define.PRINCIPAL, principal);
        // 푸시 알림을 위한 fcm 토큰 update
        userService.saveFcmToken(dto.getUsername() ,dto.getFcmToken());
        // 로그인 푸시 알림 보내기
        PushAlarmDTO pushDto = new PushAlarmDTO();
        pushDto.setFcmToken(dto.getFcmToken());
        pushDto.setTitle("님부스");
        pushDto.setMessage("님부스에 로그인 하신 것을 환영합니다");
        // 푸시 알림을 거부한 경우 로그인 알림 생략
        if(dto.getFcmToken() != null) {
        	userService.FireBasePushAlert(pushDto);
        }
        // 로그인 시 예약한 티켓 날짜를 가져와 보냄
        GetTicketDateDTO ticketDate  = ticketService.getTicketDate(principal.getId());
        session.setAttribute("ticketDate", ticketDate);
        return "redirect:/main";
    }

    @GetMapping("/kakao/sign-in")
    public String kakaoSignIn() {
        return "user/kakaoSignIn";
    }


    //카카오 로그인
    @GetMapping("/kakao-redirect")
    public String kakaoRedirect(@RequestParam String code, UserRequest.SignUpDTO dto) {

        RestTemplate r1 = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();

        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
        bodies.add("grant_type","authorization_code");
        bodies.add("client_id",Define.KAKAOKEY);
        bodies.add("redirect_uri","http://localhost:8080/kakao-redirect");
        bodies.add("code",code);

        HttpEntity<MultiValueMap<String,String>> requestMsg = new HttpEntity<>(bodies,headers);
        ResponseEntity<OAuthToken> response = r1.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, requestMsg,OAuthToken.class);
        // 여기까지 토큰 받기 위함 //


        RestTemplate r2 = new RestTemplate();
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization","Bearer " + response.getBody().getAccess_token());
        headers2.add("Content-type", "Content-type: application/x-www-form-urlencoded;charset=utf-8");

        // 헤더 바디 결합
        HttpEntity<MultiValueMap<String, String>> requestMsg2 = new HttpEntity<>(headers2);

        // 요청
        ResponseEntity<KakaoProfile> response2 = r2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, requestMsg2, KakaoProfile.class);

        KakaoProfile kakaoProfile = response2.getBody();

        User checkUser = userService.kakaoCheckUsername(kakaoProfile);
        System.out.println("=====================");
        System.out.println(checkUser.isKaKao());
        System.out.println("====================");

        session.setAttribute(Define.PRINCIPAL, checkUser);
        
        return "redirect:/main";
    }


    //유저 아이디 중복체크
    @GetMapping("/check/username")
    public ResponseEntity<ApiUtils.ApiResult<String>> nameCheck(@RequestParam String username){
        
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
    
    // 푸시 대상 등록(uuid, device_id, push_token 필요)
    @ResponseBody
    @GetMapping("/kakao/push-insert-user")
    public void KakaoPushInsertUser(@RequestParam KakaoPushUserDTO dto) {
    	// 푸시 알림을 받을 대상 등록
    	RestTemplate rt = new RestTemplate();
    	// 헤더 구성
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
    	headers.add("Authorization", "KakaoAK "+KAKAOPUSHKEY);
    	// body 구성
    	MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
    	params.add("uuid", dto.getUuid());
    	params.add("device_id", dto.getDeviceId());
    	params.add("push_type", "fcm");
    	params.add("push_token", dto.getPushToken());
    			
    	// 헤더 + body 결합
    	HttpEntity<MultiValueMap<String, String>> requestMsg
    		= new HttpEntity<>(params, headers);
    			
    	// 요청 처리(응답은 토큰의 유효기간)
    	ResponseEntity<KakaoPushTokenResponse> response = rt.exchange("https://kapi.kakao.com/v2/push/register" , HttpMethod.POST,
    			requestMsg, KakaoPushTokenResponse.class);
    }
    
    // 푸시 대상 조회(uuid, device_id, push_token 필요)
    @ResponseBody
    @GetMapping("/kakao/push-find-user")
    public void KakaoPushFindUser(@RequestParam KakaoPushFindUserDTO dto) {
    	RestTemplate rt = new RestTemplate();
    	// 헤더 구성
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
    	headers.add("Authorization", "KakaoAK "+KAKAOPUSHKEY);
    	// body 구성
    	MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
    	if(dto.getUuids().size() == 1) {
    		params.add("uuid", dto.getUuids().get(0));
    	} else {
    		String uuids = "{";
    		int i = 1;
    		for (String uuid : dto.getUuids()) {
    			uuids += uuid;
    			if(dto.getUuids().size() != i) {
    				uuids += ",";
    			}
    			i++;
			}
    		uuids += "}";
    		params.add("uuids", uuids);
    	}
    	
    			
    	// 헤더 + body 결합
    	HttpEntity<MultiValueMap<String, String>> requestMsg
    		= new HttpEntity<>(params, headers);
    			
    	// 요청 처리
    	ResponseEntity<KakaoPushUser> response = rt.exchange("https://kapi.kakao.com/v2/push/tokens" , HttpMethod.POST,
    			requestMsg, KakaoPushUser.class);
    }
    

    // 푸시 대상 제거(uuid만 있으면 됨)
    @ResponseBody
    @GetMapping("/kakao/push-delete-user")
    public void KakaoPushDeleteUser(@RequestParam KakaoPushUserDTO dto) {
    	// 푸시 알림을 받을 대상 제외
    	RestTemplate rt = new RestTemplate();
    	// 헤더 구성
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
    	headers.add("Authorization", "KakaoAK "+KAKAOPUSHKEY);
    	// body 구성
    	MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
    	params.add("uuid", dto.getUuid());
    			
    	// 헤더 + body 결합
    	HttpEntity<MultiValueMap<String, String>> requestMsg
    		= new HttpEntity<>(params, headers);
    			
    	// 요청 처리
    	ResponseEntity<KakaoPushTokenResponse> response = rt.exchange("https://kapi.kakao.com/v2/push/deregister" , HttpMethod.POST,
    			requestMsg, KakaoPushTokenResponse.class);
    }

    // 푸시 보내기(uuid목록, 메시지 내용)
    @ResponseBody
    @GetMapping("/kakao/push-alert")
    public void KakaoPushAlert(@RequestParam KakaoPushMessageDTO dto) {

    	RestTemplate rt = new RestTemplate();
    	// 헤더 구성
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", "KakaoAK "+ KAKAOPUSHKEY);
    	headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
    	
    	String pushMsgJson = "{  'for_fcm':{"
    			+ "    \"collapse\": \"articleId123\","
    			+ "    \"delay_while_idle\":false,"
    			+ "    \"custom_field\": {"
    			+ "      \"article_id\": 111,"
    			+ "      \"comment_id\": 222,"
    			+ "      \"comment_preview\": \""+dto.getMessage()+"\" }}}";

    	String uuids = "[ ";
    	List<String> uuidList = dto.getUuids();
    	int i = 1;
    	for (String uuid : uuidList) {
			uuids += uuid;
			if(uuidList.size() != i) {
				uuids +=",";
			}
			i++;
		}
    	uuids +=" ]";
    	// body 구성
    	MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
    	params.add("uuid", uuids);
    	params.add("push_message", pushMsgJson);
    	//params2.add("bypass", ""); 
    	//서비스 자체 관리 여부. 
    	//boolean값 기본 false
    	//사용 시 message에 푸시 토큰 포함

    	// 헤더 바디 결합
    	HttpEntity<MultiValueMap<String, String>> requestMsg 
    								= new HttpEntity<>(params, headers);
    	//요청
    	ResponseEntity<PushAlertFail> response = rt.exchange("https://kapi.kakao.com/v2/push/send", HttpMethod.POST,
    			requestMsg, PushAlertFail.class);
    }
    
}
