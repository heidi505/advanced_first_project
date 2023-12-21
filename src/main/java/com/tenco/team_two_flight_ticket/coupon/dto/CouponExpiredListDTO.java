package com.tenco.team_two_flight_ticket.coupon.dto;

import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;

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

    private String expiredAtYear;
    private String expiredAtMonth;
    private String expiredAtDays;
    
    private int remainingDays;
    
    public boolean getIsUsed() {
        return isUsed;
    }
    
    // 만료기간을 년월일로 자른다
    public void splitExpiredAt() {
    	String[] splitedString = expiredAt.split("-");
    	this.expiredAtYear = splitedString[0];
    	this.expiredAtMonth = splitedString[1];
    	this.expiredAtDays = splitedString[2];
    }
    
    // 남은 만료기간을 계산한다
    public void calculateExpiredAt() {
    	LocalDate currentDate = LocalDate.now(ZoneId.of("Asia/Seoul")); // 현재 날짜
    	LocalDate targetDate = LocalDate.parse(this.expiredAt); //만료 날짜
    	Period remainingPeriod = Period.between(currentDate, targetDate); //남은 기간
    	this.remainingDays = remainingPeriod.getDays();
    	System.out.println(remainingDays);
    }
    
}