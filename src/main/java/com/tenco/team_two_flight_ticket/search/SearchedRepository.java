package com.tenco.team_two_flight_ticket.search;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.team_two_flight_ticket.search.SearchedResponse.GetRecentSearchDTO;

@Mapper
public interface SearchedRepository {

	List<GetRecentSearchDTO> getRecentSearch(int id);
	
	
	
}
