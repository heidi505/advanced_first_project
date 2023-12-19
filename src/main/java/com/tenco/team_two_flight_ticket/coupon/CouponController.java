package com.tenco.team_two_flight_ticket.coupon;

import com.tenco.team_two_flight_ticket.coupon.dto.CouponDetailDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponExpiredListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponListDTO;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponSaveDTO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
    public String adminCouponList(Model model, Integer id) {
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
        String timeDate = Coupon.dayDate(couponList.get(0).getExpiredAt(), couponList.get(0).getCreatedAt());

        System.out.println(timeDate);
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
        List<CouponDetailDTO> couponDetailList = couponService.couponDetailList(1);
        model.addAttribute("couponDetailList", couponDetailList);
        return "admin/couponDetail";
    }
}
