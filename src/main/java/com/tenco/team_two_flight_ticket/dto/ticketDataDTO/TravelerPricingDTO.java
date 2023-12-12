package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.FareDetailsBySegmentDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TravelerPricingDTO {
    private String travelerId;
    private String fareOption;
    private String tralvelerType;
    private List<FareDetailsBySegmentDTO> fareDetailsBySegment;
}
