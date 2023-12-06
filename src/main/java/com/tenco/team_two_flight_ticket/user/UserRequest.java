package com.tenco.team_two_flight_ticket.user;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class UserRequest {

    @Getter
    @Setter
    @ToString
    public static class SignUpDTO{
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
    public static class SignInDTO{
        @NotEmpty
        private String username;
        @NotEmpty
        private String password;
    }
    @Getter
    @Setter
    @ToString
    public static class UserUpdateDTO{
        private int userId;
        private String phoneNumber;
        private String email;
        private String password;
    }

    @Getter
    @Setter
    @ToString
    public static class CheckUsernameDTO{
        @NotEmpty
        private String username;
    }
    @Getter
    @Setter
    @ToString
    public static class CheckEmailDTO{
        @NotEmpty
        @Email
        private String email;
    }



}
