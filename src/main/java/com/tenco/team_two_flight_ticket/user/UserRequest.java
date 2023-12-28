package com.tenco.team_two_flight_ticket.user;

import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

public class UserRequest {

    @Getter
    @Setter
    @ToString
    @Builder
    public static class SignUpDTO {
        @NotEmpty
        private String realName;
        @NotEmpty
        private String username;
        @NotEmpty
        @Email(message = "이메일 형식으로 입력해주세요")
        private String email;
        @NotEmpty
        private String phoneNumber;
        @NotEmpty
        private String password;
        @NotEmpty
        private String passwordCheck;
    }

    @Getter
    @Setter
    @ToString
    public static class SignInDTO {
        @NotEmpty
        private String username;
        @NotEmpty
        private String password;

        private String installationId;
        private String fcmToken;
        private String uuid;
        

    }

    @Getter
    @Setter
    @ToString
    public static class UserUpdateDTO {
        private int userId;
        private String phoneNumber;
        private String email;
        private String password;
        private MultipartFile profileImage;
        private String originalPicName;
    }

    @Getter
    @Setter
    @ToString
    public static class CheckUsernameDTO {
        @NotEmpty
        private String username;
    }

    @Getter
    @Setter
    @ToString
    public static class CheckEmailDTO {
        @NotEmpty
        @Email
        private String email;
    }

    @Getter
    @Setter
    @ToString
    public static class GetMyTravelListDTO {
        private StatusEnum statusEnum;
        private int userId;
        private String sort;
        private String year;
    }
    
    @Getter
    @Setter
    @ToString
    public static class PushAlarmDTO {
        private int userId;
        private String fcmToken;
        private String title;
        private String message;
    }


}
