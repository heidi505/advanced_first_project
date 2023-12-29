package com.tenco.team_two_flight_ticket.airport.airportTravelTime;

import com.fasterxml.jackson.annotation.JsonCreator;
import lombok.Data;

import java.util.List;

@Data
public class AirportTravelTimeDTO {
    private Integer airportTotalCount;
    private Response response;

    @Data
    public static class Response {
        private Header header;
        private Body body;
    }

    @Data
    public static class Header {
        private String resultCode;
        private String resultMsg;
    }

    @Data
    public static class Body {
        private Items items;
        private int numOfRows;
        private int pageNo;
        private int totalCount;
    }

    @Data
    public static class Items {
        private List<Item> item;
    }

    @Data
    public static class Item {
        private String aod;
        private String arp;
        private String congestYn;
        private String hh;
        private int pcg;
        private int pct;
        private int sdt;
        private String tof;
    }

    // Getter 메서드 추가
    public List<Item> getItems() {
        return this.response.getBody().getItems().getItem();
    }
}