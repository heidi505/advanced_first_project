package com.tenco.team_two_flight_ticket.kakaopay.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class KakaoPayNewDTO {
    private int reservationId;
    private int reservationNum;
    private int originalPrice;
    private int couponPrice;
    private int finalPrice;
    private String resName;
}
