package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tenco.team_two_flight_ticket._middle._entity.Passenger;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetMyTripDetailDTO;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetPayedInfoDTO;
import com.tenco.team_two_flight_ticket.ticket.Ticket;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTravelDTO;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTripCountDTO;
import org.apache.ibatis.annotations.ResultMap;

@Mapper
public interface ReservationRepository {

    @ResultMap("reservationPaymentResultMap")
    List<ReservationResponse.ReservationPaymentDTO> reservationPayment(@Param("userId") int userId);

    // 내 여행 목록 가져오기
    List<GetMyTravelDTO> getMyTravel(@Param("userId") int userId, @Param("statusEnum") StatusEnum statusEnum, @Param("sort") String sort);

    // 내 여행 목록 개수 가져오기
    int getMyTripCount(@Param("userId") int userId, @Param("statusEnum") StatusEnum statusEnum, @Param("sort") String sort);
    // 예약하기

    public int insertR(Reservation reservationR);

    Reservation findByReservationNum(String reservationNum);

    // 내 여행 상세 정보 가져오기
    GetMyTripDetailDTO getMyTripDetail(@Param("userId") int userId, @Param("reservationNum") Long reservationNum);

    // 내 여행 예약 취소하기
    int cancelReservation(Long reservationNum);

	List<GetPayedInfoDTO> getPayedInfo(Long reservationNum);

	// 지난 여행 전환
	void setLastTrip();

}
