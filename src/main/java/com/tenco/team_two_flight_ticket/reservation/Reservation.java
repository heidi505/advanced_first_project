package com.tenco.team_two_flight_ticket.reservation;

import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "reservation_tb")
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private int userId;
    @Column(nullable = false)
    private String resName;
    @Column(nullable = false)
    private String email;
    @Column(nullable = false)
    private String phoneNum;
    @Column(nullable = false)
    private String reservationNum;
    @ColumnDefault("false")
    private boolean isPayed;
    @Enumerated(EnumType.STRING)
    private StatusEnum statusEnum;
    private int passengerAmount;
    private Timestamp paymentDeadline;
    private Long reservationPrice;
    @CreationTimestamp
    private Timestamp createdAt;

    @Builder
    public Reservation(int id, int userId, String resName, String email, String phoneNum, String reservationNum, boolean isPayed, StatusEnum statusEnum, int passengerAmount, Timestamp paymentDeadline, Long reservationPrice, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.resName = resName;
        this.email = email;
        this.phoneNum = phoneNum;
        this.reservationNum = reservationNum;
        this.isPayed = isPayed;
        this.statusEnum = statusEnum;
        this.passengerAmount = passengerAmount;
        this.paymentDeadline = paymentDeadline;
        this.reservationPrice = reservationPrice;
        this.createdAt = createdAt;
    }
}
