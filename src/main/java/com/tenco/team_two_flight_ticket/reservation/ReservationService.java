package com.tenco.team_two_flight_ticket.reservation;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;


import com.tenco.team_two_flight_ticket._core.handler.RestfulExceptionHandler;
import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._middle._entity.Passenger;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.ticket.Ticket;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTravelDTO;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
public class ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;

    public List<GetMyTravelDTO> getMyTravel(int userId, UserRequest.GetMyTravelListDTO dto) {
        //dto에서 id도 가져와야 함
        StatusEnum statusEnum = dto.getSatusEnum();
        String sort = dto.getSort();
        List<GetMyTravelDTO> tripList = reservationRepository.getMyTravel(userId, statusEnum, sort);
        return tripList;
    }

    //INSERT INTO reservation_tb(`id`,`user_id`,`res_name`, `email`, `phone_num`, `reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)
    //INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)
    //INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
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
}
