package com.tenco.team_two_flight_ticket.coupon;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
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
                .username(dto.getUsername())
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
//            couponSMS(dto.getUserId());
        } else {
            throw new MyBadRequestException("쿠폰 등록을 실패하였습니다.");
        }
        return resultRowCount;
    }

    public List<CouponListDTO> couponListAll() {
        return couponRepository.findCouponAll();
    }

    public List<CouponListDTO> couponDetailList(Integer id) {

        List<CouponListDTO> coupons = couponRepository.findCouponId(id);
        return coupons;
    }

    public List<CouponDetailDTO> couponExpiredDetailList(Integer id) {
        User principal = (User) session.getAttribute("principal");
        List<CouponDetailDTO> coupons = couponRepository.findByExpiredCouponId(principal.getId());
        for (CouponDetailDTO coupon : coupons) {
            if (coupon.getIsUsed()) {
                coupon.setCreatedValue("만료됨");
            } else {
                coupon.setExpiredValue("만료안됨");
            }
        }
        return coupons;
    }


    public List<CouponExpiredListDTO> couponExpiredListAll() {
        List<CouponExpiredListDTO> coupons = couponRepository.findCouponExpiredAll();
        return coupons;
    }

    @Transactional
    public void couponDelete(Integer id, Integer userid) {
        couponRepository.deleteByCouponUserId(id);
    }

    public SingleMessageSentResponse couponSMS(Integer id) {
        User principal = (User) session.getAttribute(Define.PRINCIPAL);

        // CouponSMSDTO 가져오기
        List<CouponSMSDTO> couponSMSs = couponRepository.findCouponSMS(id);

        // CouponListDTO 가져오기
        Coupon coupons = couponRepository.findCouponUserId(id);

        DefaultMessageService defaultMessageService = NurigoApp.INSTANCE.initialize(Define.SMSKEY, Define.SMSSECRETKEY, "https://api.coolsms.co.kr");
        SingleMessageSentResponse response = null;

        // coupons와 couponSMSs를 userId로 매칭하여 SMS를 보내기
        for (CouponSMSDTO couponSMS : couponSMSs) {
                if (coupons.getUserId() == couponSMS.getUserId()) {
                    System.out.println(coupons.getId() + "ddddddddddddd");
                    Message message = new Message();
                    message.setFrom("01030184609");
                    message.setTo(couponSMS.getPhoneNumber());
                    message.setText("안녕하세요 " + couponSMS.getUsername() + "님, " + couponSMS.getCouponName() + "을 발급해드렸습니다. " + couponSMS.getExpiredAt() + "까지");

                    response = defaultMessageService.sendOne(new SingleMessageSendingRequest(message));
                    System.out.println(response + "문자내용");
                    // 같은 userId를 가진 경우 SMS를 보내고 나면 break하여 중복 전송을 방지
                    break;
                }
            }

        return response;
    }
}
