package com.tenco.team_two_flight_ticket.user;

import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse;

import lombok.Data;

public class UserResponse {
    @Data
    @JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
    public class OAuthToken {
        private String accessToken;
        private String tokenType;
        private String refreshToken;
        private String expiresIn;
        private String scope;
    }
    
    @Data
    public static class GetMyTravelDTO {
    	private int id;
    	private Boolean isPayed;
    	private Timestamp createdAt;
    	private Timestamp paymentDeadline;
    	private int reservationNum;
    	private StatusEnum statusEnum;
    	private String airline;
    	private String arrivalCity;
    	private String departureAirport;
    	private String departureCity;
    	private String flightName;
        private Timestamp departureTime;
        private Timestamp arrivalTime;
        
        private String koreanDepartureAirport;
        private String koreanArrivalCity;
        private String koreanAirline;
        private String koreanDepartureCity;
    }
    
    @Data
    public static class GetMyTripCountDTO {
    	private int allTripCount;
    	private int payedTripCount;
    	private int notPayedTripCount;
    }
    
    @Data
    public static class GetMyTripCntAndListDTO {
    	private List<GetMyTravelDTO> tripList;
    	private GetMyTripCountDTO tripCount;
    	private String minYear;
    	private String maxYear;
    }
    
    	

}
