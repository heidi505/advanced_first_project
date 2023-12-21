package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.AirCraftDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.ArrivalDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DepartureDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class SegmentDTO {
    private String id;
    //항공편 중 출발에 대한 정보
    private DepartureDTO departure;
    //항공편 중 도착에 대한 정보
    private ArrivalDTO arrival;
    //항공사 코드
    private String carrierCode;
    //항공사에서 제공해주는 무슨 비행편 넘버인듯
    private String number;
    //항공사 이름 - 코드를 이름으로 파싱하려고 만든 필드. 응답 dto에는 없음
    private String airlineName;
    //비행편에 대한 정보
    private AirCraftDTO aircraft;
    //경유 있을시 경유에 대한 정보. 우리 프로젝트는 고려 x
    private List<StopDTO> stops;

    public SegmentDTO(SegmentDTO dto) {
        this.departure = new DepartureDTO(dto.getDeparture());
        this.arrival = new ArrivalDTO(dto.getArrival());
        this.carrierCode = dto.getCarrierCode();
        this.aircraft = dto.getAircraft();
        this.number = dto.getNumber();
    }
}