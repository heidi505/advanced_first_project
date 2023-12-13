package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;
import java.util.stream.Collectors;

@Data
@ToString
@NoArgsConstructor
public class ItinerariesDTO {
    private String duration;
    private List<SegmentDTO> segments;


    public ItinerariesDTO(ItinerariesDTO dto) {
        String time = dto.getDuration().substring(2);
        if(time.length() > 2){
            String hour = time.substring(0, 1);
            String minute = time.substring(2, 4);
            this.duration = hour+"시간 "+minute+"분";
        }else{
            String hour = time.substring(0,1);
            this.duration = hour+"시간 ";
        }

        this.segments = dto.getSegments().stream()
                .map(e->new SegmentDTO(e))
                .collect(Collectors.toList());
    }
}