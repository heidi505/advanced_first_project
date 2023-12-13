package com.tenco.team_two_flight_ticket.reservation;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import java.util.concurrent.ThreadLocalRandom;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._middle._entity.Passenger;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.ticket.Ticket;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTravelDTO;

import org.springframework.transaction.annotation.Transactional;

import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTripCountDTO;


@Slf4j
@Service
public class ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;

    @Transactional
    public void save(ReservationRequest.SaveFormDto dto) {

        /*  (추후 api에 따라 수정 필요) */

        // reservation_tb
        String datePrefix = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
        String randomSuffix = String.format("%03d", ThreadLocalRandom.current().nextInt(1000));
        String reservationNum = datePrefix + randomSuffix;

        Reservation reservationR = Reservation.builder()
                .userId(1)
                .resName(dto.getResName())
                .email(dto.getEmail())
                .phoneNum(dto.getPhoneNum())
                .reservationNum(reservationNum)
                .statusEnum(StatusEnum.valueOf("예정"))
                .passengerAmount(1)
                .paymentDeadline(null)
                .reservationPrice(dto.getReservationPrice())
                .build();


        int resultRowReservation = reservationRepository.insertR(reservationR);
        System.out.println("예약!");
        if (resultRowReservation != 1) {
            throw new MyBadRequestException("실패");
        }

        //`birth_date`,`gender`,`passenger_type`,`created_at`)
        // passenger_tb
        Passenger passenger = Passenger.builder()
                .reservationId(1)
                .firstName(dto.getFirstName())
                .lastName(dto.getLastName())
                .birthDate(null)
                .gender(dto.getGender())
                .passengerType(null)
                .build();
        int resultRowPassenger = reservationRepository.insertP(passenger);
        System.out.println("승객!");
        if (resultRowPassenger != 1) {
            throw new MyBadRequestException("실패");
        }

        // ticket_tb
        Ticket ticket = Ticket.builder()
                .reservationId(1)
                .airFare(null)
                .fuelSurcharge(null)
                .taxes(null)
                .ticketingFee(null)
                .totalPrice(null)
                .airline(null)
                .flightName(null)
                .departureCity(null)
                .arrivalCity(null)
                .departureAirport(null)
                .arrivalAirport(null)
                .seatType(null)
                .isOneWay(true)
                .isNonStop(false)
                .baggageAllowance(15)
                .build();
        int resultRowTicket = reservationRepository.insertT(ticket);
        System.out.println("티켓!");
        if (resultRowTicket != 1) {
            throw new MyBadRequestException("실패");
        }
    }

    public List<GetMyTravelDTO> getMyTravel(int userId, UserRequest.GetMyTravelListDTO dto) {

        //dto에서 id도 가져와야 함

        StatusEnum statusEnum = dto.getStatusEnum();

        String stringSort = dto.getSort();
        System.out.println(stringSort);
        String sort = "전체";

        switch (stringSort) {
            case "전체":
                sort = "all";
                break;
            case "결제전":
                sort = "false";
                break;
            case "결제완료":
                sort = "true";
                break;
            default:
                throw new MyBadRequestException("잘못된 값이 입력되었습니다");
        }

        List<GetMyTravelDTO> tripList = null;

        // 여행 목록 종류 유효성 검사
        if (statusEnum != StatusEnum.예정 && statusEnum != StatusEnum.지난) {
            if (statusEnum != StatusEnum.취소) {
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
            int notPayedTripCnt = reservationRepository.getMyTripCount(userId, statusEnum, "falut");
            tripCnt.setAllTripCount(allTripCnt);
            tripCnt.setPayedTripCount(payedTripCnt);
            tripCnt.setNotPayedTripCount(notPayedTripCnt);
        } catch (Exception e) {
            throw new MyServerError("서버 에러가 발생했습니다");
        }

        return tripCnt;
    }

}
