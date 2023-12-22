package com.tenco.team_two_flight_ticket.coupon;

import com.tenco.team_two_flight_ticket.coupon.dto.CouponDetailDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponExpiredListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponSMSDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CouponRepository {
    public int insert(Coupon coupon);

    public List<CouponListDTO> findCouponAll();
    public List<CouponSMSDTO> findCouponSMS(Integer userId);
    public List<CouponListDTO> findCouponId(Integer id);
    public List<Coupon> findCouponUserId(Integer id);
    public List<CouponExpiredListDTO> findByExpiredCouponId(Integer userId);
    public List<CouponExpiredListDTO> findCouponExpiredAll();
    public int deleteByCouponUserId(Integer id);

//    public List<CouponExpiredListDTO> findCouponExpiredUserId(Integer id);

	public List<CouponExpiredListDTO> findCouponExpiredAllByUserId(int id);

	public int useCoupon(Long couponId);


    public List<CouponListDTO> findCouponByUserId(Integer id);

}
