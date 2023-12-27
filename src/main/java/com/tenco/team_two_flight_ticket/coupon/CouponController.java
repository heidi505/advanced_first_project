package com.tenco.team_two_flight_ticket.coupon;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._core.vo.PageVO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponDetailDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponExpiredListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponSaveDTO;
import com.tenco.team_two_flight_ticket.user.User;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

import static io.lettuce.core.pubsub.PubSubOutput.Type.message;

@Slf4j
@Controller
public class CouponController {

    @Autowired
    private HttpSession session;

    @Autowired
    private CouponService couponService;


    //    쿠폰 등록 기능
    @GetMapping("/admin/coupon-save")
    public String adminCouponSaveForm(Model model) {

        return "admin/couponSave";
    }

    @PostMapping("/admin/coupon-save")
    public String adminCouponSave(CouponSaveDTO dto, Integer id, Model model) {
        List<CouponListDTO> couponList = couponService.couponDetailList(id);
        model.addAttribute("couponList", couponList);
        couponService.couponSave(dto);
        return "redirect:/admin/coupon-list";
    }

    @ResponseBody
    @PostMapping("/api/admin/couponSMS")
    public ResponseEntity<ApiUtils.ApiResult<String>> adminCouponSMS(@RequestBody CouponListDTO couponData) {
        SingleMessageSentResponse messageResponse = couponService.couponSMS(couponData);
        String message = messageResponse.toString();
        return ResponseEntity.ok().body(ApiUtils.success(message));
    }



    //    쿠폰 목록 기능
    @GetMapping("/admin/coupon-list")
    public String adminCouponList(Model model,@RequestParam(defaultValue = "1") int page) {
//        현재 쿠폰 목록
        List<CouponListDTO> couponList = couponService.couponListAll(page, 3);

        int totalCount = couponService.couponCount(); // 총 개수

        PageVO pagevo = new PageVO();
        pagevo.setCurrentPage(page);
        pagevo.setCountPerPage(3);
        pagevo.setLastPage((int) Math.ceil((double)totalCount / 3));
        pagevo.setCountSize(5);
        pagevo.setFirstPage(1);


        //        만료된 쿠폰 목록
        List<CouponExpiredListDTO> couponExpiredList = couponService.couponExpiredListAll(page, 3);
        model.addAttribute("couponList", couponList);
        model.addAttribute("couponExpiredList", couponExpiredList);
        model.addAttribute("pagevo", pagevo);

        for (CouponExpiredListDTO coupon : couponExpiredList) {
            if (coupon.getIsUsed()) {
                coupon.setCreatedValue("만료됨");
            } else {
                coupon.setExpiredValue("만료안됨");
            }
        }
//        String timeDate = Coupon.dayDate(couponList.get(0).getExpiredAt(), couponList.get(0).getCreatedAt());
//
//        System.out.println(timeDate);
        return "admin/couponList";
    }

    @ResponseBody
    @GetMapping("/api/admin/coupon-expired-list")
    public ResponseEntity<ApiUtils.ApiResult<?>> apiAdminCouponExpiredList(Model model,@RequestParam(name="page", defaultValue = "1") int page) {

        int totalCount = couponService.couponCount(); // 총 개수

        PageVO pagevo = new PageVO();
        pagevo.setCurrentPage(page);
        pagevo.setCountPerPage(3);
        pagevo.setLastPage((int) Math.ceil((double)totalCount / 3));
        pagevo.setCountSize(3);
        pagevo.setFirstPage(1);

        List<CouponExpiredListDTO> couponExpiredList = couponService.couponExpiredListAll(page, 3);
        model.addAttribute("couponExpiredList", couponExpiredList);
        model.addAttribute("pagevo", pagevo);

        for (CouponExpiredListDTO coupon : couponExpiredList) {
            if (coupon.getIsUsed()) {
                coupon.setCreatedValue("만료됨");
            } else {
                coupon.setExpiredValue("만료안됨");
            }
        }

        return ResponseEntity.ok().body(ApiUtils.success(couponExpiredList));
    }

    @ResponseBody
    @GetMapping("/api/admin/coupon-list")
    public ResponseEntity<ApiUtils.ApiResult<?>> apiAdminCouponList(Model model,@RequestParam(name="page", defaultValue = "1") int page) {

        int totalCount = couponService.couponCount(); // 총 개수

        PageVO pagevo = new PageVO();
        pagevo.setCurrentPage(page);
        pagevo.setCountPerPage(3);
        pagevo.setLastPage((int) Math.ceil((double)totalCount / 3));
        pagevo.setCountSize(3);
        pagevo.setFirstPage(1);

        List<CouponListDTO> couponList = couponService.couponListAll(page, 3);
        model.addAttribute("couponList", couponList);
        model.addAttribute("pagevo", pagevo);

        for (CouponListDTO coupon : couponList) {
            if (coupon.getIsUsed()) {
                coupon.setCreatedValue("만료됨");
            } else {
                coupon.setExpiredValue("만료안됨");
            }
        }

        return ResponseEntity.ok().body(ApiUtils.success(couponList));
    }





    //     만료된 쿠폰 상세 기능
    @GetMapping("/admin/coupon-expired-detail/{id}")
    public String adminCouponExpiredDetail(@PathVariable Integer id, Model model) {

        List<CouponExpiredListDTO> couponExpiredList = couponService.couponExpiredDetailList(id);
        model.addAttribute("couponExpiredList", couponExpiredList);
        return "admin/couponExpiredDetail";
    }


    //    현재 쿠폰 상세 기능
    @GetMapping("/admin/coupon-detail/{id}")
    public String adminCouponDetail(@PathVariable Integer id, Model model) {

        List<CouponListDTO> couponList = couponService.couponDetailList(id);
        model.addAttribute("couponList", couponList);
        return "admin/couponDetail";
    }


    //    만료된 쿠폰 삭제 기능
    @PostMapping("/admin/{id}/delete")
    public String delete(@PathVariable Integer id) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new MyBadRequestException("인증되지 않았습니다");
        }
        couponService.couponDelete(id, principal.getId());
        return "redirect:/admin/coupon-list";
    }


}