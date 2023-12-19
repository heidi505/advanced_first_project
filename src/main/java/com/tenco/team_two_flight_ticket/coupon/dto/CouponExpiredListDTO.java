package com.tenco.team_two_flight_ticket.coupon.dto;

import lombok.Data;

@Data
public class CouponExpiredListDTO {
    private Integer id;
    private String couponName;
    private Long discountingPrice;
    private String couponContent;
    private String couponNumber;
    private String createdAt;
    private String expiredAt;
    private boolean isUsed;
    private String createdValue;
    private String expiredValue;

    public boolean getIsUsed() {
        return isUsed;
    }
}