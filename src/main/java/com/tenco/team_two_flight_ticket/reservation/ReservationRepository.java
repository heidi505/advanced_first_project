package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTravelDto;

@Mapper
public interface ReservationRepository {
	
	// 내 여행 목록 가져오기
	List<GetMyTravelDto> getMyTravel(@Param("userId") int userId,@Param("statusEnum") StatusEnum statusEnum, @Param("sort") String sort); 
	
		
		
	
}
