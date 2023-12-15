package com.tenco.team_two_flight_ticket.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket.search.SearchedResponse.GetRecentSearchDTO;

@Service
public class SearchedService {

	@Autowired
	private SearchedRepository searchRepository;
	
	
	// 최근 검색 목록 조회
	public List<GetRecentSearchDTO> getRecentSearch(int id) {
		List<GetRecentSearchDTO> searchedList = null;
		try {
			searchedList = searchRepository.getRecentSearch(id);
			for (GetRecentSearchDTO dto : searchedList) {
				dto.cutDate();
				dto.stringIsOneWay();
			}
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		return searchedList;
	}
	
	
	
}
