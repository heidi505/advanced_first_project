package com.tenco.team_two_flight_ticket.user;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;

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
    public static class GetMyTravelDto {
    	private int id;
    	private Boolean isPayed;
    	private Timestamp createdAt;
    	private Timestamp paymentDeadline;
    	private int reservationNum;
    	private StatusEnum statusEnum;
    	private String airrivalCity;
    	private String departureAirport;
    	private String departureCity;
    	private String flightName;
        private Timestamp departureTime;
        private Timestamp arrivalTime;
    	
    }
    	

}
