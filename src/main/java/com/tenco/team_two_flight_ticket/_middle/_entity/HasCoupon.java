package com.tenco.team_two_flight_ticket._middle._entity;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "hascoupon_tb")
public class HasCoupon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private int userId;
    @Column(nullable = false)
    private int couponId;
    private boolean isUsed;
    private Long couponNumber;
    @CreationTimestamp
    private Timestamp createdAt;
    private Timestamp expiredAt;

    @Builder
    public HasCoupon(int id, int userId, int couponId, boolean isUsed, Long couponNumber, Timestamp createdAt, Timestamp expiredAt) {
        this.id = id;
        this.userId = userId;
        this.couponId = couponId;
        this.isUsed = isUsed;
        this.couponNumber = couponNumber;
        this.createdAt = createdAt;
        this.expiredAt = expiredAt;
    }
}
