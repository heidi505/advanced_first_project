package com.tenco.team_two_flight_ticket.ticket;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.ToString;

public class TicketRequest {

    @Data
    @ToString
    public static class TicketSearchDTO{

        private String originLocationCode;
        private String destinationLocationCode;
        private String startDate;
        private String endDate = null;
        private int adults;
        private int children;
        private int infants;
        private String travelClass;
        private String currencyCode = "KRW";


    }

    @Data
    @ToString
    @JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
    public static class AccessToken {
        private String type;
        private String username;
        private String applicationName;
        private String clientId;
        private String tokenType;
        private String accessToken;
        private String expiresIn;
        private String state;
    }

}
