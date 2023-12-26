package com.tenco.team_two_flight_ticket.admin.notice;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@RequestMapping("/admin")
@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;
    @GetMapping("/notice-list")
    public String adminNoticeList(Model model) {
        List<NoticeResponseDTO.NoticeListDTO> dto = noticeService.findAll();
        model.addAttribute("noticeList", dto);
        return "admin/noticeList";
    }

    @GetMapping("/notice-save")
    public String adminNoticeSave() {return "admin/noticeSave";}

    @PostMapping("/notice-save")
    public String adminNoticeSaveProc(NoticeRequestDTO.NoticeSaveDTO dto) {
        noticeService.noticeSave(dto);
        return "redirect:/admin/notice-list";}

    @GetMapping("/notice-update/{noticeId}")
    public String adminNoticeUpdate(@PathVariable int noticeId, Model model) {
        NoticeResponseDTO.NoticeDetailDTO dto = noticeService.noticeDetail(noticeId);
        model.addAttribute("notice", dto);
        return "admin/noticeUpdate";
    }

    @PostMapping("/notice-update")
    public String adminNoticeUpdateProc(NoticeRequestDTO.NoticeUpdateDTO dto, Model model) {
        noticeService.noticeUpdate(dto);
        return "redirect:/admin/notice-detail/"+dto.getNoticeId();
    }

    @GetMapping("/notice-delete/{noticeId}")
    public String adminNoticeDelete(@PathVariable int noticeId) {
        noticeService.delete(noticeId);

        return "redirect:/admin/notice-list";
    }

    @GetMapping("/notice-detail/{noticeId}")
    public String adminNoticeDetail(@PathVariable Integer noticeId, Model model) {
        NoticeResponseDTO.NoticeDetailDTO dto = noticeService.noticeDetail(noticeId);
        model.addAttribute("notice", dto);
        return "admin/noticeDetail";
    }


}
