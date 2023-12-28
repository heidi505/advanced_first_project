package com.tenco.team_two_flight_ticket.user;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.boot.context.properties.bind.ConstructorBinding;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "user_tb")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false, unique = true)
    private String username;
    @Column(length = 256, nullable = false)
    private String password;
    @Column(length = 100,nullable = false, unique = true)
    private String email;
    @Column(nullable = false)
    private String phoneNumber;
    private String profileImage;
    private String realName;
    @ColumnDefault("false")
    private boolean isAdmin;
    @CreationTimestamp
    private Timestamp createdAt;
    private String fcmToken;
    @ColumnDefault("false")
    private boolean isKaKao;

    @Builder
    public User(int id, String username, String password, String email, String profileImage, String realName, String phoneNumber, boolean isAdmin, Timestamp createdAt, boolean isKaKao, String fcmToken) {

        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.profileImage = profileImage;
        this.realName = realName;
        this.phoneNumber = phoneNumber;
        this.isAdmin = isAdmin;
        this.createdAt = createdAt;
        this.isKaKao = isKaKao;
        this.fcmToken = fcmToken;
    }
}
