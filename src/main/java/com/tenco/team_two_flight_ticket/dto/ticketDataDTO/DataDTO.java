package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;
import java.util.stream.Collectors;

@Data
@ToString
@NoArgsConstructor
public class DataDTO{
    private String type;
    private String id;
    private boolean oneWay;
    private int numberOfBookableSeats;
    private List<ItinerariesDTO> itineraries;
    private PriceDTO price;
    private List<TravelerPricingDTO> travelerPricings;

    public DataDTO(DataDTO dto) {
        this.type = dto.getType();
        this.id = dto.getId();
        this.oneWay = dto.oneWay;
        this.numberOfBookableSeats = dto.getNumberOfBookableSeats();
        this.itineraries = dto.getItineraries().stream()
                .map(e->new ItinerariesDTO(e))
                .collect(Collectors.toList());
        this.price = new PriceDTO(dto.getPrice());
        this.travelerPricings = dto.getTravelerPricings();
    }
}