package com.tenco.team_two_flight_ticket.ticket;

import com.tenco.team_two_flight_ticket._middle._entity.City;
import com.tenco.team_two_flight_ticket.ticket.TicketResponse.GetTicketDateDTO;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TicketRepository {
    public List<City> getCities(String region);

    public String getCity(String code);

    public List<Ticket> findByTicketJoinReservation(Integer userId);

    public List<String> findUserDestination(Integer userId);

    public GetTicketDateDTO getTicketDate(int userId);

    List<Ticket> findByReservationId(int id);

    public int insertT(Ticket ticket);

	public List<City> getCitiesFromKeyword(String keyword);

	public List<City> getKoreanCity();
	// 출발지 공항 조회
	public String findDepartureAirport(int id);


}
