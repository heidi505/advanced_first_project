package com.tenco.team_two_flight_ticket.user;

import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetMyTravelDTO;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetMyTripCountDTO;

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
    public static class GetMyTripCntAndListDTO {
    	private List<GetMyTravelDTO> tripList;
    	private GetMyTripCountDTO tripCount;
    	private String minYear;
    	private String maxYear;
    }
    
    	

}
