package com.tenco.team_two_flight_ticket.ticket;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.ToString;

public class TicketRequest {

    @Data
    @ToString
    public static class TicketSearchDTO{
        @NotEmpty(message = "출발지를 입력해주세요")
        private String originLocationCode;
        @NotEmpty(message = "도착지를 입력해주세요")
        private String destinationLocationCode;
        @NotEmpty(message = "출발하실 날짜를 입력해주세요")
        private String startDate;
        private String endDate = null;
        @Min(value = 1, message = "1명 이하일 수 없습니다")
        @Max(value = 9, message = "9명 이상은 검색할 수 없습니다. 항공사로 문의해주세요")
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
    
    @Data
    public static class TicketLightSearchDTO{
    	@NotEmpty
    	private String keyword;
    }
    
    @Data
    public static class SearchCityDTO{
    	@NotEmpty
    	private String keyword;
    }
    

}
