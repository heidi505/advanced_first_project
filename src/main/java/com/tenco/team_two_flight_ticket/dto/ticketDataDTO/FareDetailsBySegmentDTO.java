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
    //segment의 id
    private String segmentId;
    //좌석 등급 이름 - economy, business, first
    @Enumerated(EnumType.STRING)
    private TravelClass cabin;
    //포함된 수화물 정보
    private IncludedCheckedBagsDTO includedCheckedBags;

}
