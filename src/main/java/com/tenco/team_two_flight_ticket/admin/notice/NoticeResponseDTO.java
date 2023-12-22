package com.tenco.team_two_flight_ticket.admin.notice;

import lombok.*;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.Calendar;

public class NoticeResponseDTO {
    @Getter
    @Setter
    @ToString
    @NoArgsConstructor
    @AllArgsConstructor
    public static class NoticeListDTO{
        private int id;
        private String title;
        private Timestamp createdAt;

        public LocalDate time(){
            LocalDate localDate = this.createdAt.toLocalDateTime().toLocalDate();

            return localDate;
        }
    }

    @Data
    @ToString
    public static class NoticeDetailDTO{
        private int id;
        private String title;
        private String content;
    }


}
