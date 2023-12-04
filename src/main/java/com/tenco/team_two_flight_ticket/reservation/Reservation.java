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
    private Long reservationNum;
    private boolean is_payed;
    @Enumerated(EnumType.STRING)
    private StatusEnum statusEnum;
    private int passengerAmount;
    private Timestamp paymentDeadline;
    private Long reservationPrice;
    @CreationTimestamp
    private Timestamp createdAt;

    @Builder
    public Reservation(int id, int userId, Long reservationNum, boolean is_payed, StatusEnum statusEnum, int passengerAmount, Timestamp paymentDeadline, Long reservationPrice, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.reservationNum = reservationNum;
        this.is_payed = is_payed;
        this.statusEnum = statusEnum;
        this.passengerAmount = passengerAmount;
        this.paymentDeadline = paymentDeadline;
        this.reservationPrice = reservationPrice;
        this.createdAt = createdAt;
    }
}
