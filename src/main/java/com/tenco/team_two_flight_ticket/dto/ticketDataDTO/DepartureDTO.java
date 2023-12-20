package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.cglib.core.Local;
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
    //출발지 공항의 iata code ex 인천 - ICN
    private String iataCode;
    //출발하는 터미널 번호
    private String terminal;
    //출발하는 시간
    private String at;
    //출발지 이름 필요해서 만든 필드. 응답 dto에는 없음
    private String cityName;

    public DepartureDTO(DepartureDTO dto) {
        this.iataCode = dto.getIataCode();
        this.terminal = dto.getTerminal();
        this.at = dto.getAt();

    }

    //출발하는 시간 날짜랑 시간 파싱하려고 만든 메소드들
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

    public boolean depSearch(String value){
        System.out.println("value:" + value);
        int time = LocalDateTime.parse(this.at).toLocalTime().getHour();
        System.out.println("time:"+time);

        String[] valueArr = value.split("~");

        int startValue = Integer.parseInt(valueArr[0]);
        int endValue = Integer.parseInt(valueArr[1]);

        return time >= startValue && time <= endValue;
    }
}