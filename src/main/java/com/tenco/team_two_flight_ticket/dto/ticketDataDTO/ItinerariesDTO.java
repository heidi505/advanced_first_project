package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Data
@ToString
@NoArgsConstructor
public class ItinerariesDTO {
    private String duration;
    private List<SegmentDTO> segments;


    public ItinerariesDTO(ItinerariesDTO dto) {
        String time = dto.getDuration().substring(2);
        int indexOfH = time.indexOf("H");
        if(time.contains("M")){
            int indexOfM = time.indexOf("M");

            String hour = time.substring(0, indexOfH);
            String minute = time.substring(indexOfH+1, indexOfM);
            this.duration = hour+"시간 "+minute+"분";
        }else{
            String hour = time.substring(0,1);
            this.duration = hour+"시간 ";
        }

        this.segments = dto.getSegments().stream()
                .map(e->new SegmentDTO(e))
                .collect(Collectors.toList());
    }

    public List<SegmentDTO> segments(){

        List<SegmentDTO> segment = this.getSegments();

        return segment;
    }
}