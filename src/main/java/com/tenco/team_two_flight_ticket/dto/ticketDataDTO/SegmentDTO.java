package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.AirCraftDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.ArrivalDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DepartureDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class SegmentDTO {
    private DepartureDTO departure;
    private ArrivalDTO arrival;
    private String carrierCode;
    private AirCraftDTO aircraft;
}