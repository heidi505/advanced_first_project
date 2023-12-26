package com.tenco.team_two_flight_ticket.airport.airportTravelTime;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.tenco.team_two_flight_ticket.airport.parkingspace.ParkingStatusResponse2;
import lombok.Data;
import lombok.ToString;

import java.util.List;

@Data
@ToString
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class AirportTravelTimeDTO {
    @JsonProperty("response")
    private Response response;

    @Data
    public static class Response {
        @JsonProperty("header")
        private Header header;

        @JsonProperty("body")
        private Body body;
    }

    @Data
    public static class Header {
        @JsonProperty("resultCode")
        private String resultCode;

        @JsonProperty("resultMsg")
        private String resultMsg;
    }

    @Data
    public static class Body {
        @JsonProperty("items")
        private Items items;

        @JsonProperty("numOfRows")
        private int numOfRows;

        @JsonProperty("pageNo")
        private int pageNo;

        @JsonProperty("totalCount")
        private int totalCount;
    }

    @Data
    public static class Items {
        @JsonProperty("item")
        private List<Item> item;
    }

    @Data
    public static class Item {

        @JsonProperty("arp")
        private String arp;

        @JsonProperty("hh")
        private String hh;

        @JsonProperty("pct")
        private int pct;

    }

    // Getter 메서드 추가
    public List<Item> getItems() {
        return this.response.getBody().getItems().getItem();
    }
}