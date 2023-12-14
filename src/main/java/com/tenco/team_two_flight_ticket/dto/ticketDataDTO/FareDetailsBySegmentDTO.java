package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import com.tenco.team_two_flight_ticket._middle._entity.enums.TravelClass;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class FareDetailsBySegmentDTO {
    private String segmentId;
    @Enumerated(EnumType.STRING)
    private TravelClass cabin;
    private IncludedCheckedBagsDTO includedCheckedBags;

}
