package com.tenco.team_two_flight_ticket.ticket;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

public class TicketRequest {

    @Data
    @ToString
    @NoArgsConstructor
    @AllArgsConstructor
    public static class OptionDTO{
        List<String> airlineOption;
        //가는날 출발 시간
        List<String> onewayDepTimeOption;
        //오는 날 출발 시간 - 왕복에만 있음
        List<String> roundDepTimeOption;
        //가는 날 도착 시간
        List<String> onewayArrTimeOption;
        //오는 날 도착 시간 - 왕복에만 있음
        List<String> roundArrTimeOption;

        public boolean roundOptionsAreEmpty(OptionDTO optionDTO) {
            return optionDTO.getAirlineOption().isEmpty() &&
                    optionDTO.getOnewayDepTimeOption().isEmpty() &&
                    optionDTO.getOnewayArrTimeOption().isEmpty() &&
                    optionDTO.getRoundArrTimeOption().isEmpty() &&
                    optionDTO.getRoundDepTimeOption().isEmpty();
        }


    }

    @Data
    @ToString
    public static class TicketSearchDTO{
        @NotEmpty(message = "출발지를 입력해주세요")
        private String originLocationCode;
        @NotEmpty(message = "도착지를 입력해주세요")
        private String destinationLocationCode;
        @NotEmpty(message = "출발하실 날짜를 입력해주세요")
//        @Pattern(regexp = "^(\\d{4}-\\d{2}-\\d{2} | \\d{4}-\\d{2}-\\d{2}~\\d{4}-\\d{2}-\\d{2})$", message = "날짜를 입력해주세요")
        private String startDate;
        private String endDate = null;
        @Min(value = 1, message = "1명 이하일 수 없습니다")
        @Max(value = 9, message = "9명 이상은 검색할 수 없습니다. 항공사로 문의해주세요")
        private int adults;
        private int children;
        private int infants;
        private String travelClass;
        private String currencyCode = "KRW";

        private String originLocationName;
        private String destinationLocationName;
        private String allPassengers;

        public String seatType(){
            if(travelClass.equals("ECONOMY")){
                return "일반석";
            }

            if(travelClass.equals("BUSINESS")){
                return "비즈니스";
            }

            return "일등석";
        }


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
