package com.tenco.team_two_flight_ticket.coupon.dto;

import lombok.Data;

@Data
public class CouponListDTO {
    private Integer id;
    private String couponName;
    private Long discountingPrice;
    private String couponContent;
    private String couponNumber;
    private String createdAt;
    private String expiredAt;
}
