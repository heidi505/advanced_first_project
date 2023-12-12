package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetMyTripDetailDTO;
import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTravelDTO;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTripCountDTO;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;

	public List<GetMyTravelDTO> getMyTravel(int userId, UserRequest.GetMyTravelListDTO dto) {
		
		//dto에서 id도 가져와야 함
		
		StatusEnum statusEnum = dto.getStatusEnum();

		String stringSort = dto.getSort();
		System.out.println(stringSort);
		String sort = "전체";
		
		switch(stringSort){
			case "전체":  sort="all"; break;
			case "결제전": sort = "false"; break;
			case "결제완료":  sort = "true"; break;
			default : throw new MyBadRequestException("잘못된 값이 입력되었습니다");
		}
		
		List<GetMyTravelDTO> tripList = null;
		
		// 여행 목록 종류 유효성 검사
		if(statusEnum != StatusEnum.예정 && statusEnum != StatusEnum.지난) {
			if(statusEnum != StatusEnum.취소) {
				throw new MyBadRequestException("잘못된 값이 입력되었습니다");
			}
		}

		try {
			tripList = reservationRepository.getMyTravel(userId, statusEnum, sort);
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		return tripList;
	}

	public GetMyTripCountDTO getMyTripCount(int userId, UserRequest.GetMyTravelListDTO dto) {
		StatusEnum statusEnum = dto.getStatusEnum();
		// 개수를 담을 객체
		GetMyTripCountDTO tripCnt = new GetMyTripCountDTO();
		try {
			int allTripCnt = reservationRepository.getMyTripCount(userId, statusEnum, "all");
			int payedTripCnt = reservationRepository.getMyTripCount(userId, statusEnum, "true");
			int notPayedTripCnt = reservationRepository.getMyTripCount(userId, statusEnum, "false");
			tripCnt.setAllTripCount(allTripCnt);
			tripCnt.setPayedTripCount(payedTripCnt);
			tripCnt.setNotPayedTripCount(notPayedTripCnt);
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		
		return tripCnt;
	}

	public GetMyTripDetailDTO getMyTripDetail(int userId , Long reservationNum) {
		GetMyTripDetailDTO dto = null;
		if(reservationNum == null) {
			throw new MyBadRequestException("잘못된 예약번호입니다");
		}
		try {
			dto = reservationRepository.getMyTripDetail(userId ,reservationNum);
			dto.makePhoneNumber();
			dto.cutDepartureDate();
			dto.cutArrivalDate();
			dto.cutPaymentDeadline();
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		return dto;
	}

}
