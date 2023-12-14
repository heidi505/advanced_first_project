package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;

import com.tenco.team_two_flight_ticket._middle._entity.Passenger;
import com.tenco.team_two_flight_ticket.ticket.Ticket;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetMyTripDetailDTO;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTravelDTO;

@Mapper
public interface ReservationRepository {


    // 내 여행 목록 가져오기
    List<GetMyTravelDTO> getMyTravel(@Param("userId") int userId, @Param("statusEnum") StatusEnum statusEnum, @Param("sort") String sort);

    // 내 여행 목록 개수 가져오기
    int getMyTripCount(@Param("userId") int userId, @Param("statusEnum") StatusEnum statusEnum, @Param("sort") String sort);
    // 예약하기
    public int insertT(Ticket ticket);

    public int insertR(Reservation reservationR);

    public int insertP(Passenger passenger);

	GetMyTripDetailDTO getMyTripDetail(@Param("userId") int userId,@Param("reservationNum") Long reservationNum);
    
}
