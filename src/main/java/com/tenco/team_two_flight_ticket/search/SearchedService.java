package com.tenco.team_two_flight_ticket.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket.search.SearchedResponse.GetRecentSearchDTO;
import com.tenco.team_two_flight_ticket.ticket.TicketRequest;

import jakarta.validation.Valid;

@Service
public class SearchedService {

	@Autowired
	private SearchedRepository searchedRepository;
	
	
	// 최근 검색 목록 조회
	public List<GetRecentSearchDTO> getRecentSearch(int id) {
		List<GetRecentSearchDTO> searchedList = null;

			searchedList = searchedRepository.getRecentSearch(id);
			for (GetRecentSearchDTO dto : searchedList) {
				dto.cutDate();
				dto.stringIsOneWay();

		}
		return searchedList;
	}

	@Transactional
	public void saveRecentSearch(int id, TicketRequest.TicketSearchDTO dto) {
		
		Boolean isOneWay = true; // 기본적으로 편도
		String date = dto.getStartDate().replace(",","");
        dto.setStartDate(date);
        //날짜 파싱
        if (date.contains("~")){
            String[] parsedDate = date.split(" ~ ");
            String startDate = parsedDate[0];
            String endDate = parsedDate[1];

            dto.setStartDate(startDate);
            dto.setEndDate(endDate);
            isOneWay = false;
        }
		
		Searched searched = Searched.builder()
							.userId(id)
							.isOneWay(isOneWay)
							.departureCity(dto.getOriginLocationCode())
							.arrivalCity(dto.getDestinationLocationCode())
							.startDate(dto.getStartDate())
							.endDate(dto.getEndDate())
							.adults(dto.getAdults())
							.children(dto.getChildren())
							.infants(dto.getInfants())
							.travelClass(dto.getTravelClass())
							.build();
		try {
			searchedRepository.saveRecentSearch(searched);
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		
	}

	//검색 기록 삭제
	@Transactional
	public void deleteSearchLog(DeleteSearchLogDTO dto) {
		try {
			searchedRepository.deleteSearchLog(dto.getSearchId());
		} catch (Exception e) {
			throw new MyServerError("검색 기록 삭제에 실패했습니다");
		}
	}
	
	
	
}
