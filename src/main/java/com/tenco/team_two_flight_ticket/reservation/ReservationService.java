package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTravelDTO;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;

	public List<GetMyTravelDTO> getMyTravel(int userId, UserRequest.GetMyTravelListDTO dto) {
		//dto에서 id도 가져와야 함
		List<GetMyTravelDTO> tripList = null;
		StatusEnum statusEnum = dto.getStatusEnum();
		if(statusEnum==null) {
			statusEnum = StatusEnum.예정;
		}
		String sort = dto.getSort();
		if(!statusEnum.equals(StatusEnum.예정)&&!statusEnum.equals(StatusEnum.취소)) {
			if(!statusEnum.equals(StatusEnum.지난)) {
				throw new MyBadRequestException("잘못된 값이 입력되었습니다");
			}
		}
		
		try {
			tripList = reservationRepository.getMyTravel(userId, statusEnum, sort);
		} catch (Exception e) {
			throw new MyServerError("서버 에러입니다");
		}
		return tripList;
	}

}
