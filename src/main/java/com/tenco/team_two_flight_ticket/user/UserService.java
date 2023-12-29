package com.tenco.team_two_flight_ticket.user;

import java.util.List;
import java.util.Random;
import java.util.UUID;

import com.tenco.team_two_flight_ticket.auth.authresponse.KakaoProfile;
import com.tenco.team_two_flight_ticket.ticket.TicketRepository;
import io.github.flashvayne.chatgpt.service.ChatgptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
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
import com.tenco.team_two_flight_ticket.firebase.FCMInitializer;
import com.tenco.team_two_flight_ticket.user.UserRequest.PushAlarmDTO;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

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
    @Autowired
    private ChatgptService chatgptService;

    @Autowired
    private TicketRepository ticketRepository;



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
            dto.setPassword(passwordEncoder.encode(dto.getPassword()));
            int update = userRepository.updateByUserId(dto);
            principal.setEmail(dto.getEmail());
            principal.setPassword(passwordEncoder.encode(dto.getPassword()));
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

    public User kakaoCheckUsername(KakaoProfile kakaoProfile) {
        User checkUser = userRepository.checkUsername(kakaoProfile.getId());
        if(checkUser == null) {
            User user = User.builder()
                    .realName(kakaoProfile.getProperties().getNickname())
                    .username("aahhee")
                    .profileImage("profile_05.jpg")
                    .email("aahh2@naver.com")
                    .password("")
                    .phoneNumber("01035842292")
                    .isKaKao(true)
                    .build();

            userRepository.insert(user);
            checkUser = user;
        }
        checkUser.setKaKao(true);
        return checkUser;
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
    
    // 푸시 알림 전송
	public void FireBasePushAlert(PushAlarmDTO pushDto) {
		
		//firebase 초기화
		FCMInitializer fcmInitializer = new FCMInitializer();
		fcmInitializer.initialize();
        		
        // 클라이언트에게 푸시 알림 보내기
        String registrationToken = pushDto.getFcmToken();

        Message message = Message.builder()
                .setNotification(Notification.builder()
                        .setTitle(pushDto.getTitle())
                        .setBody(pushDto.getMessage())
                        .build())
                .setToken(registrationToken)
                .build();

        String response = "";
		try {
			response = FirebaseMessaging.getInstance().send(message);
			System.out.println("Successfully sent message: " + response);
		} catch (FirebaseMessagingException e) {
			e.printStackTrace();
		}
		
	}

	// fcm 토큰 저장
	public void saveFcmToken(String userName, String fcmToken) {
		try {
			userRepository.saveFcmToken(userName, fcmToken);
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		
	}

    public String getChatResponse(String condition){
        User user = (User) session.getAttribute(Define.PRINCIPAL);
        List<String> cityName = ticketRepository.findUserDestination(user.getId());

        if(cityName.isEmpty()){
            return "예약을 먼저 해주세요!";
        }

        if (condition.equals("plan")){
            return chatgptService.sendMessage(cityName.get(0) + "에 유명한 관광지 한국어로 알려줘");
        }else{
            return chatgptService.sendMessage(cityName.get(0) + " 가는데 챙겨야할 준비물 뭐 있을까?");
        }
    }

}

