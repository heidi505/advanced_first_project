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
import java.time.LocalTime;
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
        this.at = dto.getAt();

    }

    public String date(){
        String date = LocalDateTime.parse(this.at).toLocalDate().toString();
        System.out.println(date + "여기다!!!!!!!!!!!!!!");
        String[] dateArr = date.split("-");

        return dateArr[1] + "월 " + dateArr[2] + "일";
    }

    public String time(){
        String time = LocalDateTime.parse(this.at).toLocalTime().toString();
        String[] timeArr = time.split(":");

        return timeArr[0] + ":" + timeArr[1];
    }
}