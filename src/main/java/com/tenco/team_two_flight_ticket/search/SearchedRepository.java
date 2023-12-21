package com.tenco.team_two_flight_ticket.search;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.team_two_flight_ticket.search.SearchedResponse.GetRecentSearchDTO;

@Mapper
public interface SearchedRepository {
	//최근 검색 목록 조회(수정 필요)
	List<GetRecentSearchDTO> getRecentSearch(int id);
	//최근 검색 목록 등록
	void saveRecentSearch(Searched searched);
	//최근 검색 목록 제거
	void deleteSearchLog(int searchId);
	
	
	
}
