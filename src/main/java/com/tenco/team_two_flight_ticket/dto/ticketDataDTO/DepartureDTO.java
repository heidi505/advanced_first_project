package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
@ToString
@NoArgsConstructor
public class DepartureDTO {
    private String iataCode;
    private String terminal;
    private String at;

    public DepartureDTO(DepartureDTO dto) {
        this.iataCode = dto.getIataCode();
        this.terminal = dto.getTerminal();

        LocalDateTime dateTime = LocalDateTime.parse(dto.getAt(), DateTimeFormatter.ISO_DATE_TIME);
        int hour = dateTime.getHour();
        int minute = dateTime.getMinute();

        this.at = hour + ":" + minute;

    }
}