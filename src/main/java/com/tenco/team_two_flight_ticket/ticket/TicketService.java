package com.tenco.team_two_flight_ticket.ticket;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket._middle._entity.City;
import com.tenco.team_two_flight_ticket.ticket.TicketResponse.GetTicketDateDTO;

@Service
public class TicketService {
    @Autowired
    private TicketRepository ticketRepository;
    public List<City> getCities(String region) {
        List<City> cities = ticketRepository.getCities(region);
        return cities;
    }
    
	public GetTicketDateDTO getTicketDate(int userId) {
		GetTicketDateDTO dto = null;
		try {
			dto = ticketRepository.getTicketDate(userId);
			dto.timeCheck();
			dto.cutDepartureTime();
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		return dto;
	}
}
