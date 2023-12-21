package com.tenco.team_two_flight_ticket.user;

import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket._core.utils.PicUrl;
import com.tenco.team_two_flight_ticket._middle._entity.HasCoupon;
import com.tenco.team_two_flight_ticket._middle._repository.HasCouponRepository;
import com.tenco.team_two_flight_ticket.auth.authresponse.KakaoPushTokenResponse;
import com.tenco.team_two_flight_ticket.auth.authresponse.KakaoPushUser;
import com.tenco.team_two_flight_ticket.auth.authresponse.PushAlertFail;
import com.tenco.team_two_flight_ticket.firebase.FCMInitializer;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private HasCouponRepository hasCouponRepository;
    @Autowired
    private HttpSession session;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private JavaMailSender javaMailSender;
    private int authNumber;
    @Autowired
    private ResourceLoader resourceLoader;


    @Transactional
    public void signUp(UserRequest.SignUpDTO dto) {
        User user = User.builder()
                .username(dto.getUsername())
                .email(dto.getEmail())
                .password(passwordEncoder.encode(dto.getPassword()))
                .phoneNumber(dto.getPhoneNumber())
                .build();

        int resultRowCount = userRepository.insert(user);

        if (resultRowCount != 1) {
            throw new MyBadRequestException("회원 가입 실패");
        }
    }

    @Transactional
    public void kakaoSignUp(UserRequest.SignUpDTO dto) {
        User user = User.builder()
                .username("kakao")
                .email("")
                .password("")
                .phoneNumber("")
                .build();

        int resultRowCount = userRepository.insert(user);

        if (resultRowCount != 1) {
            throw new MyBadRequestException("회원 가입 실패");
        }
    }

    public User signIn(UserRequest.SignInDTO dto) {

        User userEntity = userRepository.findByUsername(dto);

        if (userEntity == null) {
            throw new MyBadRequestException("아이디 혹은 비번이 틀렸습니다.");
        }

        boolean isPwdMatched = passwordEncoder.matches(dto.getPassword(), userEntity.getPassword());

        if (isPwdMatched == false) {
            throw new MyBadRequestException("비번이 틀렸습니다.");
        }


        return userEntity;

    }

    public int getProfile(User principal) {
        List<HasCoupon> couponList = hasCouponRepository.findByUserId(principal.getId());
        return couponList.size();
    }

    @Transactional
    public int updateUser(UserRequest.UserUpdateDTO dto) {
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        dto.setUserId(principal.getId());

        String picUrl = "";
        MultipartFile file = dto.getProfileImage();

        // 파일이 업로드되었는지 확인
        if (file != null && !file.isEmpty()) {
            if (file.getSize() > Define.MAX_FILE_SIZE) {
                throw new MyBadRequestException("파일 크기는 20MB 이상 클 수 없습니다");
            } else {
                String originalFilename = file.getOriginalFilename();
                picUrl = PicUrl.save(file, originalFilename);
            }
        } else {
            // 파일이 업로드되지 않은 경우 기본 이미지 사용
            picUrl = "basic_img.svg";
        }

        try {
            dto.setOriginalPicName(picUrl);
            int update = userRepository.updateByUserId(dto);
            principal.setEmail(dto.getEmail());
            principal.setPassword(dto.getPassword());
            principal.setPhoneNumber(dto.getPhoneNumber());
            principal.setProfileImage(picUrl);

            session.setAttribute(Define.PRINCIPAL, principal);

            return update;
        } catch (Exception e) {
            throw new MyServerError("서버 에러");
        }
    }

    public String checkUsername(String username) {
        User checkUser = userRepository.checkUsername(username);
        if (checkUser == null) {
            return "사용할 수 있는 아이디입니다";
        } else {
            return "사용할 수 없는 아이디입니다";
        }
    }

    public void makeRandomNumber() {
        Random r = new Random();
        String randomNumber = "";
        for (int i = 0; i < 6; i++) {
            randomNumber += Integer.toString(r.nextInt(10));
        }

        int authNumber = Integer.parseInt(randomNumber);

        this.authNumber = authNumber;
    }

    public void sendEmail(String email) {
        makeRandomNumber();
        MimeMessage verifyMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(verifyMessage, true, "UTF-8");
            helper.setFrom("xxwhite19@gmail.com");
            helper.setTo(email);
            helper.setSubject("님부스의 인증 메일입니다");
            helper.setText("님부스를 방문해주셔서 감사합니다." +
                    "<br><br>" +
                    "인증 번호는 " + this.authNumber + "입니다." +
                    "<br>" +
                    "인증번호를 입력해주세요", true);
            javaMailSender.send(verifyMessage);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public String verifyEmail(int key) {
        if (key == this.authNumber) {
            return "인증 완료. 회원 가입을 진행해주세요";
        } else {
            return "인증 번호가 일치하지 않습니다";
        }
    }

    public String findUserByEmail(String email) {
        User user = userRepository.findUserByEmail(email);

        if(user == null){
            return "존재하지 않는 이메일입니다. 회원 가입을 진행해주세요";
        }else{

            return "있음";
        }
    }


    @Transactional
    public String setPassword(String email) {

        // 비번 생성
        String uuid = "";
        for (int i = 0; i < 5; i++) {
            uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.
        }
        uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리를 자름

        //비번 변경
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        userRepository.updatePassword(passwordEncoder.encode(uuid), email);

        //이메일 전송
        MimeMessage setPwdMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(setPwdMessage, true, "UTF-8");
            helper.setFrom("xxwhite19@gmail.com");
            helper.setTo(email);
            helper.setSubject("님부스 - 비밀번호 변경");
            helper.setText("아래 비밀 번호로 변경되었습니다." +
                    "<br><br>" +
                    "새 비밀번호는 " + uuid + "입니다." +
                    "<br>", true);
            javaMailSender.send(setPwdMessage);

            return "비밀번호 변경 완료되었습니다";
        }catch (Exception e){
            throw new MyServerError("알 수 없는 서버 에러");
        }

    }

    // 로그인 시 푸시 알림 기기 등록
	public void KakaoPushInsertUser(UserRequest.SignInDTO dto) {
		// uuid 가져오기
		User principal = userRepository.findByUsername(dto);
		String uuid = String.valueOf(principal.getId());
		dto.setUuid(uuid);
		// 푸시 알림을 받을 대상 등록
    	RestTemplate rt = new RestTemplate();
    	// 헤더 구성
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
    	headers.add("Authorization", "KakaoAK 22999c9c34f480718a810c84766265f6");
    	// body 구성
    	MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
    	params.add("uuid", dto.getUuid());
    	params.add("device_id", dto.getInstallationId());
    	params.add("push_type", "fcm");
    	params.add("push_token", dto.getFcmToken());
    		
    	// 헤더 + body 결합
    	HttpEntity<MultiValueMap<String, String>> requestMsg
    		= new HttpEntity<>(params, headers);
    			
    	// 요청 처리(응답은 토큰의 유효기간)
    	ResponseEntity<KakaoPushTokenResponse> response = rt.exchange("https://kapi.kakao.com/v2/push/register" , HttpMethod.POST,
    			requestMsg, KakaoPushTokenResponse.class);
    	KakaoPushTokenResponse result = response.getBody();
    	System.out.println("----------------");
    	System.out.println(result.toString());
    	System.out.println("----------------");
    	
	}

	//푸시 알림 대상자 찾기
	public void KakaoPushFindUser(UserRequest.SignInDTO dto) {
		System.out.println(dto);
		RestTemplate rt = new RestTemplate();
    	// 헤더 구성
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
    	headers.add("Authorization", "KakaoAK 22999c9c34f480718a810c84766265f6");
    	// body 구성
    	MultiValueMap<String, String> params = new LinkedMultiValueMap<>(); 
    	params.add("uuid", dto.getUuid());

    	// 헤더 + body 결합
    	HttpEntity<MultiValueMap<String, String>> requestMsg
    		= new HttpEntity<>(params, headers);
    			
    	// 요청 처리
    	//ResponseEntity<KakaoPushUser> response = rt.exchange("https://kapi.kakao.com/v2/push/tokens" , HttpMethod.POST,
    	//		requestMsg, KakaoPushUser.class);
    	ResponseEntity<List<KakaoPushUser>> response = rt.exchange("https://kapi.kakao.com/v2/push/tokens" , HttpMethod.POST,
    			requestMsg, new ParameterizedTypeReference<List<KakaoPushUser>>() {});
    	System.out.println("-------------------");
		List<KakaoPushUser> result = response.getBody();
		System.out.println(result.toString());
	}

	//카카오 푸시 보내기
	public void KakaoPushAlert(@Valid UserRequest.SignInDTO dto) {

    	RestTemplate rt = new RestTemplate();
    	// 헤더 구성
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", "KakaoAK 22999c9c34f480718a810c84766265f6");
    	headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
    	
    	String pushMsgJson = "{  \"for_fcm\":{"
    			+ "    \"collapse\": \"articleId123\","
    			+ "    \"delay_while_idle\":false,"
    			+ "    \"custom_field\": {"
    			+ "      \"article_id\": 111,"
    			+ "      \"comment_id\": 222,"
    			+ "      \"comment_preview\": \""+"테스트"+"\" }}}";

    	String uuids = "[\"" +dto.getUuid() +"\"]";
    	System.out.println("------------"+uuids);
    	// body 구성
    	MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
    	params.add("uuids", uuids);
    	params.add("push_message", pushMsgJson);
    	//params2.add("bypass", ""); 
    	//서비스 자체 관리 여부. 
    	//boolean값 기본 false
    	//사용 시 message에 푸시 토큰 포함

    	// 헤더 바디 결합
    	HttpEntity<MultiValueMap<String, String>> requestMsg 
    								= new HttpEntity<>(params, headers);
    	System.out.println(requestMsg.toString());
    	//요청
    	ResponseEntity<PushAlertFail> response = rt.exchange("https://kapi.kakao.com/v2/push/send", HttpMethod.POST,
    			requestMsg, PushAlertFail.class);
    	PushAlertFail result = response.getBody();
		
	}

	
	public void FireBasePushAlert(@Valid UserRequest.SignInDTO dto) {
		//firebase 초기화
		FCMInitializer fcmInitializer = new FCMInitializer();
		fcmInitializer.initialize();
        		
        // 클라이언트에게 푸시 알림 보내기
        String registrationToken = dto.getFcmToken();

        Message message = Message.builder()
                .setNotification(Notification.builder()
                        .setTitle("님부스")
                        .setBody("님부스에 로그인 하신 것을 환영합니다")
                        .build())
                .setToken(registrationToken)
                .build();

        String response = "";
		try {
			response = FirebaseMessaging.getInstance().send(message);
			System.out.println("Successfully sent message: " + response);
		} catch (FirebaseMessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


}

