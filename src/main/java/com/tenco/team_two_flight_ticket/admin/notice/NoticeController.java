package com.tenco.team_two_flight_ticket.admin.notice;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class NoticeController {
    @GetMapping("/notice-list")
    public String adminBannerList() {
        return "admin/noticeList";
    }

    @GetMapping("/notice-save")
    public String adminBannerSave() {
        return "admin/noticeSave";
    }

    @GetMapping("/notice-update")
    public String adminBannerUpdate() {
        return "admin/noticeUpdate";
    }

    @GetMapping("/notice-detail")
    public String adminBannerDetail() {
        return "admin/noticeDetail";
    }
}
