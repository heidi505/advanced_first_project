package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;

@Mapper
public interface ReservationRepository {

	List<Reservation> getMyTravel(int id, StatusEnum statusEnum); // 내 여행 목록 가져오기
		
		
	
}
