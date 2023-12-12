//package com.tenco.team_two_flight_ticket.reservation.Passenger;
//
//import com.tenco.team_two_flight_ticket.reservation.Reservation;
//import jakarta.persistence.*;
//import lombok.Builder;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//import org.hibernate.annotations.CreationTimestamp;
//
//import java.sql.Timestamp;
//
//@Setter
//@Getter
//@NoArgsConstructor
//@Entity
//@Table(name = "passenger_tb")
//public class Passenger {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private int id;
//    private String firstName;
//    private String lastName;
//    private String birthDate;
//    private String gender;
//    private String passengerType;
//    @CreationTimestamp
//    private Timestamp createdAt;
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    private Reservation reservation;
//
//    @Builder
//    public Passenger(int id, String firstName, String lastName, String birthDate, String gender, String passengerType, Timestamp createdAt, Reservation reservation) {
//        this.id = id;
//        this.firstName = firstName;
//        this.lastName = lastName;
//        this.birthDate = birthDate;
//        this.gender = gender;
//        this.passengerType = passengerType;
//        this.createdAt = createdAt;
//        this.reservation = reservation;
//    }
//}
