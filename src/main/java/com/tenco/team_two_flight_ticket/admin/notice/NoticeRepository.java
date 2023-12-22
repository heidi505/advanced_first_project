package com.tenco.team_two_flight_ticket.admin.notice;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeRepository {
    public int noticeSave(NoticeRequestDTO.NoticeSaveDTO dto);

    public List<NoticeResponseDTO.NoticeListDTO> findAll();

    NoticeResponseDTO.NoticeDetailDTO getDetail(int id);

    public int update(NoticeRequestDTO.NoticeUpdateDTO dto);

    public int delete(int id);
}
