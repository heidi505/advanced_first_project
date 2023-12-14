package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.FareDetailsBySegmentDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;
import java.util.Map;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TravelerPricingDTO {
    private String travelerId;
    private String fareOption;
    private String travelerType;
    private PerPersonPriceDTO price;
    private List<FareDetailsBySegmentDTO> fareDetailsBySegment;

    public TravelerPricingDTO(TravelerPricingDTO dto) {
        this.travelerId = dto.getTravelerId();
        this.fareOption = dto.getFareOption();
        this.travelerType = dto.getTravelerType();
        this.price = new PerPersonPriceDTO(dto.getPrice());
        this.fareDetailsBySegment = dto.getFareDetailsBySegment();
    }


}
