package com.tenco.team_two_flight_ticket.user;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket._middle._entity.HasCoupon;
import com.tenco.team_two_flight_ticket._middle._repository.HasCouponRepository;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

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


    @Transactional
    public void signUp(UserRequest.SignUpDTO dto){
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

        if (isPwdMatched == false){
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

        try{
            int update = userRepository.updateByUserId(dto);
            principal.setEmail(dto.getEmail());
            principal.setPassword(dto.getPassword());
            principal.setPhoneNumber(dto.getPhoneNumber());

            session.setAttribute(Define.PRINCIPAL, principal);
        }
        catch (Exception e){
            throw new MyServerError("서버 에러");
        }

    }

    public String checkUsername(UserRequest.CheckUsernameDTO dto) {
        User checkUser = userRepository.checkUsername(dto);
        if (checkUser == null) {
            return "사용할 수 있는 아이디입니다";
        }else{
            return "사용할 수 없는 아이디입니다";
        }


    }
}
