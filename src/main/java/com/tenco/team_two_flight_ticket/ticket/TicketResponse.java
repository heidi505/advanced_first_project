package com.tenco.team_two_flight_ticket.ticket;

import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DataDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDictionariesDTO.DictionariesDTO;
import com.tenco.team_two_flight_ticket.dto.ticketMetaDTO.MetaDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

public class TicketResponse {

    @Data
    @ToString
    @NoArgsConstructor
    @AllArgsConstructor
    public static class FlightSearchDTO{
        private MetaDTO meta;
        private List<DataDTO> data;
    }


    //airline
    //time
    //nonstop
    //arrival departure time/date
    //소요시간
    //totalprice(자세한 요금)
    //bookableseats
    //seattype / baggageallowance

}
