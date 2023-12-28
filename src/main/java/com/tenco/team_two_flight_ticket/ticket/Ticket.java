package com.tenco.team_two_flight_ticket.ticket;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.tenco.team_two_flight_ticket._middle._entity.enums.SeatTypeEnum;
import com.tenco.team_two_flight_ticket.reservation.Reservation;
import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;


@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "ticket_tb")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private int reservationId;
    private Long airFare;
    private Long fuelSurcharge;
    private Long taxes;
    private Long ticketingFee;
    private Long totalPrice;
    private String airline;
    private String flightName;
    private String departureCity;
    private String arrivalCity;
    private Timestamp departureTime;
    private Timestamp arrivalTime;
    private String departureAirport;
    private String arrivalAirport;
    @Enumerated(EnumType.STRING)
    private SeatTypeEnum seatType;
    private boolean isOneWay;
    private boolean isNonStop;
    private int baggageAllowance;
    @CreationTimestamp
    private Timestamp createdAt;

    @Builder
    public Ticket(int id, int reservationId, Long airFare, Long fuelSurcharge, Long taxes, Long ticketingFee, Long totalPrice, String airline, String flightName, String departureCity, String arrivalCity, Timestamp departureTime, Timestamp arrivalTime, String departureAirport, String arrivalAirport, SeatTypeEnum seatType, boolean isOneWay, boolean isNonStop, int baggageAllowance, Timestamp createdAt) {
        this.id = id;
        this.reservationId = reservationId;
        this.airFare = airFare;
        this.fuelSurcharge = fuelSurcharge;
        this.taxes = taxes;
        this.ticketingFee = ticketingFee;
        this.totalPrice = totalPrice;
        this.airline = airline;
        this.flightName = flightName;
        this.departureCity = departureCity;
        this.arrivalCity = arrivalCity;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.departureAirport = departureAirport;
        this.arrivalAirport = arrivalAirport;
        this.seatType = seatType;
        this.isOneWay = isOneWay;
        this.isNonStop = isNonStop;
        this.baggageAllowance = baggageAllowance;
        this.createdAt = createdAt;
    }
}
