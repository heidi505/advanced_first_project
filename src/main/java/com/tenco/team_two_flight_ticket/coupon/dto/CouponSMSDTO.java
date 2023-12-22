package com.tenco.team_two_flight_ticket.coupon.dto;


import lombok.Data;

@Data
public class CouponSMSDTO {
    private Integer userId;
    private String username;
    private String phoneNumber;
    private String couponNumber;
    private String couponName;
    private Long discountingPrice;
    private String expiredAt;
}
