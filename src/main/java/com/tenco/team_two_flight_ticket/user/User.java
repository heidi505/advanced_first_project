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
    private String profileImage;

    private String realName;
    private String phoneNumber;
    @ColumnDefault("false")
    private boolean is_admin;
    @CreationTimestamp
    private Timestamp createdAt;

    @Builder
    public User(int id, String username, String password, String email, String profileImage, String realName, String phoneNumber, boolean is_admin, Timestamp createdAt) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.profileImage = profileImage;
        this.realName = realName;
        this.phoneNumber = phoneNumber;
        this.is_admin = is_admin;
        this.createdAt = createdAt;
    }
}
