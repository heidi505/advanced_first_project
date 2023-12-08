package com.tenco.team_two_flight_ticket.ticket;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.ToString;

public class TicketRequest {

    @Data
    @ToString
    public static class TicketSearchDTO{

        private String originLocationCode;

        private String destinationLocationCode;

        private String departureDate;
        private String returnDate;
        private Integer adults;
        private Integer children;
        private Integer infants;
        private String travelClass;
        private boolean nonstop;
        private String currencyCode = "KRW";


    }
}
