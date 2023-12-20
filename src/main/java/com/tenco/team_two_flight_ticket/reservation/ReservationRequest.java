package com.tenco.team_two_flight_ticket.reservation;

import com.tenco.team_two_flight_ticket._middle._entity.enums.PassengerTypeEnum;
import com.tenco.team_two_flight_ticket._middle._entity.enums.SeatTypeEnum;
import lombok.Data;

import java.sql.Timestamp;

public class ReservationRequest {

    @Data
    public static class SaveFormDto{
        // reservation_tb
        private String resName; // oa
        private String email; // oa
        private String phoneNum; // oa
        private Integer passengerAmount; // oa
        private Timestamp paymentDeadline; // ?
        private Long reservationPrice; // ?

        // passenger_tb
        private String firstName; // oa
        private String lastName; // oa
        private String birthDate; // oa
        private String gender; // oa
        private PassengerTypeEnum passengerType; // oa


        // ticket_tb
        private Long airFare; // oa
        private Long fuelSurcharge; // oa
        private Long taxes; // oa
        private Long ticketingFee; // oa
        private Long totalPrice; // oa --
        private String airline;
        private String flightName; //oa
        private String departureCity; //od
        private String arrivalCity; //oa
        private String departureAirport; //oa
        private String arrivalAirport; //oa
        private SeatTypeEnum seatType; // oa
        private boolean isOneWay; //oa
        private boolean isNonStop; //oa
        private int baggageAllowance; //oa

        //kakaomessage
        private String optionMessage;
    }
}
