package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DataDTO{
    private String type;
    private String id;
    private boolean oneWay;
    private int numberOfBookableSeats;
    private List<ItinerariesDTO> itineraries;
    private PriceDTO price;
    private List<TravelerPricingDTO> travelerPricings;

}