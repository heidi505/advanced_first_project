package com.tenco.team_two_flight_ticket._middle._entity;

import com.tenco.team_two_flight_ticket._middle._entity.enums.PassengerTypeEnum;
import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;
import java.text.DateFormat;
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "passenger_tb")
public class Passenger {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private int reservationId;
    private String firstName;
    private String lastName;
    private String birthDate;
    private String gender;
    @Enumerated(EnumType.STRING)
    private PassengerTypeEnum passengerType;
    private Timestamp createdAt;

    @Builder
    public Passenger(int id, int reservationId, String firstName, String lastName, String birthDate, String gender, PassengerTypeEnum passengerType, Timestamp createdAt) {
        this.id = id;
        this.reservationId = reservationId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDate = birthDate;
        this.gender = gender;
        this.passengerType = passengerType;
        this.createdAt = createdAt;
    }
}
