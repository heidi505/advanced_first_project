package com.tenco.team_two_flight_ticket.ticket;

import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DataDTO;
import com.tenco.team_two_flight_ticket.dto.ticketMetaDTO.MetaDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;
import java.util.stream.Collectors;

public class TicketResponse {

    @Data
    @ToString
    @NoArgsConstructor
    public static class FlightSearchDTO{
        private MetaDTO meta;
        private List<DataDTO> data;

        public FlightSearchDTO(FlightSearchDTO dto) {
            this.meta = dto.getMeta();
            this.data = dto.getData().stream()
                    .map(e->new DataDTO(e))
                    .collect(Collectors.toList());
        }
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
