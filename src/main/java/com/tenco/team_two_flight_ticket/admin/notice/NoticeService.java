package com.tenco.team_two_flight_ticket.admin.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {

    @Autowired
    private NoticeRepository noticeRepository;
    public void noticeSave(NoticeRequestDTO.NoticeSaveDTO dto){
        noticeRepository.noticeSave(dto);
    }

    public List<NoticeResponseDTO.NoticeListDTO> findAll() {
        List<NoticeResponseDTO.NoticeListDTO> dto  = noticeRepository.findAll();
        return dto;
    }

    public NoticeResponseDTO.NoticeDetailDTO noticeDetail(Integer noticeId) {
        NoticeResponseDTO.NoticeDetailDTO dto = noticeRepository.getDetail(noticeId);
        return dto;
    }

    public void noticeUpdate(NoticeRequestDTO.NoticeUpdateDTO dto) {
        noticeRepository.update(dto);
    }

    public void delete(int noticeId) {
        noticeRepository.delete(noticeId);
    }
}
