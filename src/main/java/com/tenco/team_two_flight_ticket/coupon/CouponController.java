package com.tenco.team_two_flight_ticket.coupon;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponDetailDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponExpiredListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponSaveDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponUseDTO;
import com.tenco.team_two_flight_ticket.user.User;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class CouponController {

    @Autowired
    private HttpSession session;

    @Autowired
    private CouponService couponService;

    @GetMapping("/admin/coupon-list")
    public String adminCouponList(Model model) {
        List<CouponListDTO> couponList = couponService.couponList();
        List<CouponExpiredListDTO> couponExpiredList = couponService.couponExpiredLists();
        model.addAttribute("couponList", couponList);
        model.addAttribute("couponExpiredList",couponExpiredList);
        for (CouponExpiredListDTO coupon : couponExpiredList) {
            System.out.println(coupon.getIsUsed());
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

    @GetMapping("/admin/coupon-save")
    public String adminCouponSaveForm() {
        return "admin/couponSave";
    }

    @PostMapping("/admin/coupon-save")
    public String adminCouponSave(CouponSaveDTO dto) {
        couponService.couponSave(dto);
        return "redirect:/admin/coupon-list";
    }

    @GetMapping("/admin/coupon-detail/{id}")
    public String adminCouponDetail(@PathVariable Integer id, Model model) {
        List<CouponDetailDTO> couponDetailList = couponService.couponDetailList(id);
        model.addAttribute("couponDetailList", couponDetailList);
        return "admin/couponDetail";
    }

    @PostMapping("/admin/{id}/delete")
    public String delete(@PathVariable Integer id) {
        System.out.println("========================"+id);
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new MyBadRequestException("인증되지 않았습니다");
        }
        couponService.couponDelete(id, principal.getId());
        return "redirect:/admin/coupon-list";
    }
    
    @ResponseBody
    @PostMapping("/coupon/use-coupon")
    public String useCoupon(@RequestBody CouponUseDTO dto) {
    	couponService.useCoupon(dto);
    	
    	
    	// 결과를 반환하면 됨
    	return null;
    }
    
    
        
}