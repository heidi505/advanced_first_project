package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@Data
@ToString
@NoArgsConstructor
public class ArrivalDTO {
    private String iataCode;
    private String terminal;
    private String at;
    private String cityName;


    public ArrivalDTO(ArrivalDTO dto) {
        this.iataCode = dto.getIataCode();
        this.terminal = dto.getTerminal();
        this.at = dto.getAt();
//        LocalDate date = LocalDateTime.parse(dto.getAt()).toLocalDate();
//        LocalDateTime dateTime = LocalDateTime.parse(dto.getAt(), DateTimeFormatter.ISO_DATE_TIME);
//        int hour = dateTime.getHour();
//        int minute = dateTime.getMinute();
//
//        this.at = hour + ":" + minute;

    }

    public String date(){
        String date = LocalDateTime.parse(this.at).toLocalDate().toString();
        String[] dateArr = date.split("-");

        return dateArr[1] + "월 " + dateArr[2] + "일";
    }

    public String time(){
        String time = LocalDateTime.parse(this.at).toLocalTime().toString();
        String[] timeArr = time.split(":");

        return timeArr[0] + ":" + timeArr[1];
    }

    public boolean arrSearch(String value){

        int time = LocalDateTime.parse(this.at).toLocalTime().getHour();


        String[] valueArr = value.split("~");

        int startValue = Integer.parseInt(valueArr[0]);
        int endValue = Integer.parseInt(valueArr[1]);



        return time >= startValue && time <= endValue;
    }
}