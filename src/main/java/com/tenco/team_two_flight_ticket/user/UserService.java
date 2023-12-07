package com.tenco.team_two_flight_ticket.user;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket._middle._entity.HasCoupon;
import com.tenco.team_two_flight_ticket._middle._repository.HasCouponRepository;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;
import java.util.UUID;

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
    public void updateUser(UserRequest.UserUpdateDTO dto) {
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        dto.setUserId(principal.getId());

        try {
            int update = userRepository.updateByUserId(dto);
            principal.setEmail(dto.getEmail());
            principal.setPassword(dto.getPassword());
            principal.setPhoneNumber(dto.getPhoneNumber());

            session.setAttribute(Define.PRINCIPAL, principal);
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
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom("xxwhite19@gmail.com");
            helper.setTo(email);
            helper.setSubject("님부스의 인증 메일입니다");
            helper.setText("님부스를 방문해주셔서 감사합니다." +
                    "<br><br>" +
                    "인증 번호는 " + this.authNumber + "입니다." +
                    "<br>" +
                    "인증번호를 입력해주세요", true);
            javaMailSender.send(message);
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

    @Transactional
    public void setPassword(String email) {

        // 비번 생성
        String uuid = "";
        for (int i = 0; i < 5; i++) {
            uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.
        }
        uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리를 자름

        //비번 변경
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        userRepository.updatePassword(passwordEncoder.encode(uuid), principal.getId());

        //이메일 전송
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom("xxwhite19@gmail.com");
            helper.setTo(email);
            helper.setSubject("님부스 - 비밀번호 변경");
            helper.setText("아래 비밀 번호로 변경되었습니다." +
                    "<br><br>" +
                    "새 비밀번호는 " + uuid + "입니다." +
                    "<br>" +
                    "인증번호를 입력해주세요", true);
            javaMailSender.send(message);
        }catch (Exception e){
            throw new MyServerError("알 수 없는 서버 에러");
        }

    }
}

