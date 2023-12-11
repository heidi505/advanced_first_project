package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTravelDTO;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;

	public List<GetMyTravelDTO> getMyTravel(int userId, UserRequest.GetMyTravelListDTO dto) {
		//dto에서 id도 가져와야 함
		StatusEnum statusEnum = dto.getSatusEnum();
		String sort = dto.getSort();
		List<GetMyTravelDTO> tripList = reservationRepository.getMyTravel(userId, statusEnum, sort);
		return tripList;
	}

}
