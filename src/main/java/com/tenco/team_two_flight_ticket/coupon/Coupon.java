package com.tenco.team_two_flight_ticket.coupon;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "coupon_tb")
public class Coupon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String couponName;
    private int couponPeriod;
    private Long discountingPrice;

    @Builder
    public Coupon(int id, String couponName, int couponPeriod, Long discountingPrice) {
        this.id = id;
        this.couponName = couponName;
        this.couponPeriod = couponPeriod;
        this.discountingPrice = discountingPrice;
    }
}
