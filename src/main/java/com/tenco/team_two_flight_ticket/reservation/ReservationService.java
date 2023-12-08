package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.user.User;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;


	public List<Reservation> getMyTravel(User principal, StatusEnum statusEnum) {
		
		List<Reservation> list = reservationRepository.getMyTravel(principal.getId(), statusEnum);

		
		
		return list;
	}
	
	
	
	
	
}
