package com.tenco.team_two_flight_ticket.kakaopay.dto;

import lombok.Data;

import java.util.Date;

@Data
public class KakaoPayReadyDTO {

    //response
    private String tid;
    private String next_redirect_pc_url;
    private Date created_at;

}