package com.tenco.team_two_flight_ticket.airport.parkingspace;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class ParkingStatusResponse2 {

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
        private List<ParkingInfo> item;
    }

    @Data
    public static class ParkingInfo {
        @JsonProperty("airportEng")
        private String airportEng;

        @JsonProperty("airportKor")
        private String airportKor;

        @JsonProperty("parkingAirportCodeName")
        private String parkingAirportCodeName;

        @JsonProperty("parkingCongestion")
        private String parkingCongestion;

        @JsonProperty("parkingCongestionDegree")
        private String parkingCongestionDegree;

        @JsonProperty("parkingOccupiedSpace")
        private int parkingOccupiedSpace;

        @JsonProperty("parkingTotalSpace")
        private int parkingTotalSpace;

        @JsonProperty("sysGetdate")
        private String sysGetdate;

        @JsonProperty("sysGettime")
        private String sysGettime;
    }
}
