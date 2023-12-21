package com.tenco.team_two_flight_ticket.coupon;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponDetailDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponExpiredListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponSaveDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
public class CouponService {

    @Autowired
    CouponRepository couponRepository;

    @Transactional
    public int couponSave(CouponSaveDTO dto) {

        UUID uuid = UUID.randomUUID();
        String uuidString = uuid.toString();
        String couponNumber = uuidString.substring(0, 8);

        Coupon coupon = Coupon.builder()
                .couponName(dto.getCouponName())
                .discountingPrice(dto.getDiscountingPrice())
                .couponContent(dto.getCouponContent())
                .couponNumber(couponNumber)
                .isUsed(dto.isUsed())
                .createdAt(dto.formatDate(dto.getCreatedAt()))
                .expiredAt(dto.formatDate(dto.getExpiredAt()))
                .build();

        int resultRowCount = couponRepository.insert(coupon);
        if(resultRowCount != 1) {
            throw new MyBadRequestException("쿠폰 등록을 실패하였습니다.");
        }
        return resultRowCount;
    }

    public List<CouponListDTO> couponList() {
        return couponRepository.findCouponAll();
    }

    public List<CouponDetailDTO> couponDetailList(Integer id) {

        List<CouponDetailDTO> coupons = couponRepository.findByCouponUserId(id);
        for (CouponDetailDTO coupon : coupons) {
            if (coupon.getIsUsed()) {
                coupon.setCreatedValue("만료됨");
            } else {
                coupon.setExpiredValue("만료안됨");
            }
        }
        return coupons;
    }

    public List<CouponExpiredListDTO> couponExpiredLists() {
        List<CouponExpiredListDTO> coupons = couponRepository.findCouponExpiredAll();
        return coupons;
    }

    public void couponDelete(Integer id, Integer userid) {
        couponRepository.deleteByCouponUserId(id);
    }

    // 특정 회원의 유효 쿠폰 조회
	public List<CouponExpiredListDTO> findCouponExpiredAllByUserId(int id) {
		List<CouponExpiredListDTO> couponList = couponRepository.findCouponExpiredAllByUserId(id);
		return couponList;
	}

}
