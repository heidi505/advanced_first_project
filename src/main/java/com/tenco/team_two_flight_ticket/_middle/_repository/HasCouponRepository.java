package com.tenco.team_two_flight_ticket._middle._repository;

import com.tenco.team_two_flight_ticket._middle._entity.HasCoupon;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HasCouponRepository {
    public List<HasCoupon> findByUserId(int id);
}
