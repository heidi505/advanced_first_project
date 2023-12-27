package com.tenco.team_two_flight_ticket.admin.banner;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@RequestMapping("/admin")
@Controller
public class BannerController {

    @GetMapping("/banner-list")
    public String adminBannerList() {
        return "admin/bannerList";
    }

    @GetMapping("/banner-save")
    public String adminBannerSave() {
        return "admin/bannerSave";
    }

    @GetMapping("/banner-update")
    public String adminBannerUpdate() {
        return "admin/bannerUpdate";
    }

    @GetMapping("/banner-detail")
    public String adminBannerDetail() {
        return "admin/bannerDetail";
    }
}
