package com.tenco.team_two_flight_ticket.coupon.dto;

import lombok.Data;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class CouponSaveDTO {
    private Integer id;
    private Integer userId;
    private String username;
    private String couponName;
    private Long discountingPrice;
    private String couponContent;
    private String couponNumber;
    private boolean isUsed;
    private String createdAt;
    private String expiredAt;

    public static Timestamp formatDate(String dateString) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date parsedDate = null;
        try {
            parsedDate = dateFormat.parse(dateString);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        return new Timestamp(parsedDate.getTime());
    }



}
