package com.tenco.team_two_flight_ticket.ticket;

import com.tenco.team_two_flight_ticket._middle._entity.City;
import com.tenco.team_two_flight_ticket.ticket.TicketResponse.GetTicketDateDTO;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TicketRepository {
    public List<City> getCities(String region);
    public List<Ticket> findByTicketJoinReservation(Integer userId);
	public GetTicketDateDTO getTicketDate(int userId);
}
