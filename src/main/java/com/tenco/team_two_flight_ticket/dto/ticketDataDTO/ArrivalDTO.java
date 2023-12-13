package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
@ToString
@NoArgsConstructor
public class ArrivalDTO {
    private String iataCode;
    private String terminal;
    private String at;

    public ArrivalDTO(ArrivalDTO dto) {
        this.iataCode = dto.getIataCode();
        this.terminal = dto.getTerminal();

        LocalDateTime dateTime = LocalDateTime.parse(dto.getAt(), DateTimeFormatter.ISO_DATE_TIME);
        int hour = dateTime.getHour();
        int minute = dateTime.getMinute();

        this.at = hour + ":" + minute;

    }
}