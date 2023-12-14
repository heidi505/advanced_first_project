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
    private DepartureDTO departure;
    private ArrivalDTO arrival;
    private String carrierCode;
    private String airlineName;
    private AirCraftDTO aircraft;
    private List<StopDTO> stops;

    public SegmentDTO(SegmentDTO dto) {
        this.departure = new DepartureDTO(dto.getDeparture());
        this.arrival = new ArrivalDTO(dto.getArrival());
        this.carrierCode = dto.getCarrierCode();
        this.aircraft = dto.getAircraft();
    }
}