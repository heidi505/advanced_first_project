package com.tenco.team_two_flight_ticket.coupon.dto;

import java.text.NumberFormat;
import java.time.ZonedDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Locale;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CouponListDTO {
    private Integer id;
    private String username;
    private Integer userId;
    private String couponName;
    private Long discountingPrice;
    private String couponContent;
    private String couponNumber;
    private String createdAt;
    private String expiredAt;
    private boolean isUsed;
    private String createdValue;
    private String expiredValue;
    
    private String remainingDays;
    private String sDiscountingPrice;

    public boolean getIsUsed() {
        return isUsed;
    }
    
    // 만료 일수 계산
    public void calculateRemaingingDays() {
    	 // 만료일자의 타입 변경
    	 ZonedDateTime expiredAtTime = ZonedDateTime.parse(expiredAt+ "T00:00:00+09:00");
         // 현재 시각 가져오기 (한국 시간 기준)
         ZonedDateTime currentTime = ZonedDateTime.now();
         // 남은 일수 계산
         long remainingDays = ChronoUnit.DAYS.between(currentTime,expiredAtTime);
         this.remainingDays = String.valueOf(remainingDays);
    }
    
    // 할인 금액 편집
    String changeFormat(Long price) {
		NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.getDefault());
		String formattedNumber = numberFormat.format(price);
		return formattedNumber;
	}
    // 편집한 금액 저장
    public void changePrice() {
    	this.sDiscountingPrice = changeFormat(discountingPrice);
    }
    
}
