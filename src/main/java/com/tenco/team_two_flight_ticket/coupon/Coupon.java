package com.tenco.team_two_flight_ticket.coupon;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "coupon_tb")
public class Coupon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int userId;

    private String couponName;
    private int couponPeriod;
    private Long discountingPrice;
    private String couponContent;
    private String couponNumber;

    private boolean isUsed;

    @Temporal(TemporalType.DATE)
    private Date createdAt;
    @Temporal(TemporalType.DATE)
    private Date expiredAt;


    @Builder
    public Coupon(int id, int userId, String couponName, int couponPeriod, Long discountingPrice, String couponContent, String couponNumber, boolean isUsed, Date createdAt, Date expiredAt) {
        this.id = id;
        this.userId = userId;
        this.couponName = couponName;
        this.couponPeriod = couponPeriod;
        this.discountingPrice = discountingPrice;
        this.couponContent = couponContent;
        this.couponNumber = couponNumber;
        this.isUsed = isUsed;
        this.createdAt = createdAt;
        this.expiredAt = expiredAt;
    }


    //    만료일 - 발급일 => 남은 일자
    public static String dayDate(String start, String end) {

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date startDate = dateFormat.parse(start);
            Date endDate = dateFormat.parse(end);

            long dayTime = Math.abs(endDate.getTime() - startDate.getTime());
            long days = dayTime / (24 * 60 * 60 * 1000);

            return String.valueOf(days);
        } catch (ParseException e) {
            e.printStackTrace();
            return "잘못된 날짜 형식입니다.";
        }
    }
}