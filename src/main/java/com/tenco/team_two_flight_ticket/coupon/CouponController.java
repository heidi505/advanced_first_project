package com.tenco.team_two_flight_ticket.coupon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CouponController {

    @GetMapping("/admin/coupon-list")
    public String adminBannerList() {
        return "admin/couponList";
    }

    @GetMapping("/admin/coupon-save")
    public String adminBannerSave() {
        return "admin/couponSave";
    }

    @GetMapping("/admin/coupon-detail")
    public String adminBannerDetail() {
        return "admin/couponDetail";
    }
}
