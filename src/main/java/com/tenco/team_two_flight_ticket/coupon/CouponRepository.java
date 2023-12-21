package com.tenco.team_two_flight_ticket.coupon;

import com.tenco.team_two_flight_ticket.coupon.dto.CouponDetailDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponExpiredListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponListDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CouponRepository {
    public int insert(Coupon coupon);

    public List<CouponListDTO> findCouponAll();
    public List<CouponDetailDTO> findByCouponUserId(Integer userId);
    public List<CouponExpiredListDTO> findCouponExpiredAll();

    public int deleteByCouponUserId(Integer id);
//    public List<CouponExpiredListDTO> findCouponExpiredUserId(Integer id);
}
