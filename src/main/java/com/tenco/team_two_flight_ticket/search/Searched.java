package com.tenco.team_two_flight_ticket.search;

import com.tenco.team_two_flight_ticket._middle._entity.enums.PassengerTypeEnum;
import com.tenco.team_two_flight_ticket._middle._entity.enums.SeatTypeEnum;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "searched_tb")
public class Searched {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private int userId;
    private String keyword;
    private boolean isOneWay;
    private String departureCity;
    private String arrivalCity;
    private Timestamp departureDate;
    private Timestamp arrivalDate;
    private int passengerAmount;
    private Long price;
    @CreationTimestamp
    private Timestamp createdAt;
    @Enumerated(EnumType.STRING)
    private SeatTypeEnum seatType;
    @Enumerated(EnumType.STRING)
    private PassengerTypeEnum passengerType;

    @Builder
    public Searched(int id, int userId, String keyword, boolean isOneWay, String departureCity, String arrivalCity, Timestamp departureDate, Timestamp arrivalDate, int passengerAmount, Long price, Timestamp createdAt, SeatTypeEnum seatType, PassengerTypeEnum passengerType) {
        this.id = id;
        this.userId = userId;
        this.keyword = keyword;
        this.isOneWay = isOneWay;
        this.departureCity = departureCity;
        this.arrivalCity = arrivalCity;
        this.departureDate = departureDate;
        this.arrivalDate = arrivalDate;
        this.passengerAmount = passengerAmount;
        this.price = price;
        this.createdAt = createdAt;
        this.seatType = seatType;
        this.passengerType = passengerType;
    }
}
