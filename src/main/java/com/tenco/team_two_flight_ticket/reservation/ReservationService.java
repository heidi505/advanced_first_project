package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTravelDto;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;


	public List<GetMyTravelDto> getMyTravel(int userId, UserRequest.GetMyTravelListDTO dto) {
		
		return null;
	}

}
