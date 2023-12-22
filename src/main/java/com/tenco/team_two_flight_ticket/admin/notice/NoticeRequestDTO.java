package com.tenco.team_two_flight_ticket.admin.notice;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class NoticeRequestDTO {
    @Getter
    @Setter
    @ToString
    public static class NoticeSaveDTO{
        private String noticeTitle;
        private String noticeCont;
    }

    @Data
    @ToString
    public static class NoticeUpdateDTO{
        private int noticeId;
        private String noticeTitle;
        private String noticeCont;
    }
}
