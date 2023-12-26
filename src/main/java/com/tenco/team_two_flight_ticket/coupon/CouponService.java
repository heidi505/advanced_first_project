package com.tenco.team_two_flight_ticket.coupon;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponDetailDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponExpiredListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponSaveDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponUseDTO;

import org.mybatis.spring.MyBatisSystemException;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.coupon.dto.*;
import com.tenco.team_two_flight_ticket.user.User;
import jakarta.servlet.http.HttpSession;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
public class CouponService {

    @Autowired
    private CouponRepository couponRepository;

    @Autowired
    private HttpSession session;

    @Transactional
    public int couponSave(CouponSaveDTO dto) {

        UUID uuid = UUID.randomUUID();
        String uuidString = uuid.toString();
        String couponNumber = uuidString.substring(0, 8);

        Coupon coupon = Coupon.builder()
                .userId(dto.getUserId())
                .couponName(dto.getCouponName())
                .discountingPrice(dto.getDiscountingPrice())
                .couponContent(dto.getCouponContent())
                .couponNumber(couponNumber)
                .isUsed(dto.isUsed())
                .createdAt(dto.formatDate(dto.getCreatedAt()))
                .expiredAt(dto.formatDate(dto.getExpiredAt()))
                .build();

        int resultRowCount = couponRepository.insert(coupon);

        if (resultRowCount == 1) {

        } else {
            throw new MyBadRequestException("쿠폰 등록을 실패하였습니다.");
        }
        return resultRowCount;
    }

    public List<CouponListDTO> couponDetailList(Integer id) {

        List<CouponListDTO> coupons = couponRepository.findCouponId(id);
        for (CouponListDTO coupon : coupons) {
            if (coupon.getIsUsed()) {
                coupon.setCreatedValue("만료됨");
            } else {
                coupon.setExpiredValue("만료안됨");
            }
        }
        return coupons;
    }

    public List<CouponExpiredListDTO> couponExpiredDetailList(Integer id) {
        List<CouponExpiredListDTO> coupons = couponRepository.findByExpiredCouponId(id);
        for (CouponExpiredListDTO coupon : coupons) {
            if (coupon.getIsUsed()) {
                coupon.setCreatedValue("만료됨");
            } else {
                coupon.setExpiredValue("만료안됨");
            }
        }
        return coupons;
    }


    public List<CouponListDTO> couponListAll(int page, int size) {

        int offset = page * size - size;
        int limit = size;
        return couponRepository.findCouponAll(offset, limit);
    }

    public List<CouponExpiredListDTO> couponExpiredListAll(int page, int size) {
        int offset = page * size - size;
        int limit = size;

        List<CouponExpiredListDTO> coupons = couponRepository.findCouponExpiredAll(offset, limit);
        return coupons;
    }

    public int couponCount() {
        int count = couponRepository.couponCountAll();
        return count;
    }
    @Transactional
    public void couponDelete(Integer id, Integer userid) {
        couponRepository.deleteByCouponUserId(id);
    }

    public SingleMessageSentResponse couponSMS(CouponListDTO dto) {
        User principal = (User) session.getAttribute(Define.PRINCIPAL);

        // CouponSMSDTO 가져오기
        List<CouponSMSDTO> couponSMSs= couponRepository.findCouponSMS(dto.getUserId());

        // CouponListDTO 가져오기
//        List<Coupon> coupons = couponRepository.findCouponUserId(dto.getId());

        DefaultMessageService defaultMessageService = NurigoApp.INSTANCE.initialize(Define.SMSKEY, Define.SMSSECRETKEY, "https://api.coolsms.co.kr");
        SingleMessageSentResponse response = null;

//         coupons와 couponSMSs를 userId로 매칭하여 SMS를 보내기
        for (CouponSMSDTO coupon : couponSMSs) {
                    Message message = new Message();
                    message.setFrom("01030184609");
                    message.setTo(coupon.getPhoneNumber());
                    message.setText("안녕하세요 " + coupon.getUsername() + "님, \\n" + coupon.getCouponName() + "을 발급해드렸습니다. \\n" + coupon.getExpiredAt() + "까지");

                    response = defaultMessageService.sendOne(new SingleMessageSendingRequest(message));
                    System.out.println(response + "문자내용");
                    // 같은 userId를 가진 경우 SMS를 보내고 나면 break하여 중복 전송을 방지
                    break;
                }

        return response;
    }

    // 내 쿠폰 목록(유효) 조회
	public List<CouponListDTO> findCouponByUserId(int id) {
		List<CouponListDTO> couponList = null;
		try {
			couponList = couponRepository.findCouponByUserId(id);
			for (CouponListDTO couponListDTO : couponList) {
				couponListDTO.calculateRemaingingDays();
				couponListDTO.changePrice();
			}
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		return couponList;
	}


}
