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
    //탑승객 1명에 대한 정보. 아래 두개는 무시
    private String travelerId;
    private String fareOption;
    //성인, 아동, 유아 등으로 나뉨
    private String travelerType;
    //인당 항공요금, 유류할증료 등이 필요해서 제가 만든 필드. 응답 dto에는 없음.
    private PerPersonPriceDTO price;
    //하나의 segment당 해당하는 요금 정보
    private List<FareDetailsBySegmentDTO> fareDetailsBySegment;

    public TravelerPricingDTO(TravelerPricingDTO dto) {
        this.travelerId = dto.getTravelerId();
        this.fareOption = dto.getFareOption();
        this.travelerType = dto.getTravelerType();
        this.price = new PerPersonPriceDTO(dto.getPrice());
        this.fareDetailsBySegment = dto.getFareDetailsBySegment();
    }



}
