package com.tenco.team_two_flight_ticket.reservation;

import com.tenco.team_two_flight_ticket._middle._entity.Passenger;
import com.tenco.team_two_flight_ticket._middle._entity.enums.PassengerTypeEnum;
import com.tenco.team_two_flight_ticket._middle._entity.enums.SeatTypeEnum;
import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

public class ReservationRequest {

    @Data
    public static class SaveFormDto {
        // reservation_tb
        private String resName;
        private String email;
        private String phoneNum;
        private Integer passengerAmount;
        private Timestamp paymentDeadline; // ?
        private Long reservationPrice; // ?

        // passenger_tb
        private List<PassengerDTO> passengerDTOS;
        private List<TicketDto> tickets;

        @Data
        public static class TicketDto {
            private Long airFare;
            private Long fuelSurcharge;
            private Long taxes;
            private Long ticketingFee;
            private Long totalPrice;
            private String airline;
            private String flightName;
            private String departureCity;
            private String arrivalCity;
            private String departureAirport;
            private String arrivalAirport;
            private SeatTypeEnum seatType;
            private boolean isOneWay;
            private boolean isNonStop;
            private int baggageAllowance;
        }

        @Data
        public static class PassengerDTO {
            private String firstName;
            private String lastName;
            private String birthDate;
            private String gender;
            private PassengerTypeEnum passengerType;
        }

        //kakaomessage
        private String optionMessage;
    }
    
    @Data
    public static class ReservationCancelDTO{
    	private Long reservationNum;
    }
    
}
