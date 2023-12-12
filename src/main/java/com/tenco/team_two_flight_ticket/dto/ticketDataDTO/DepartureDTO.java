package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.time.LocalDate;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DepartureDTO {
    private String iataCode;
    private String terminal;
    private Timestamp at;
}