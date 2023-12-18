package com.tenco.team_two_flight_ticket.coupon;

import com.tenco.team_two_flight_ticket.coupon.dto.CouponDetailDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponExpiredListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponListDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CouponRepository {
    public int insert(Coupon coupon);

    public List<CouponListDTO> findAll();
    public List<CouponDetailDTO> findByUserId(Integer UserId);
    public List<CouponExpiredListDTO> findCouponExpiredAll();
}
