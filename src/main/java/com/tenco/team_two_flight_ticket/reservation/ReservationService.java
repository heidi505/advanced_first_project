package com.tenco.team_two_flight_ticket.reservation;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import com.tenco.team_two_flight_ticket._middle._repository.PassengerRepository;
import com.tenco.team_two_flight_ticket.ticket.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket._middle._entity.Passenger;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetMyTripDetailDTO;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse.GetPayedInfoDTO;
import com.tenco.team_two_flight_ticket.ticket.Ticket;
import com.tenco.team_two_flight_ticket.user.UserRequest;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTravelDTO;
import com.tenco.team_two_flight_ticket.user.UserResponse.GetMyTripCountDTO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;
    @Autowired
    private TicketRepository ticketRepository;
    @Autowired
    private PassengerRepository passengerRepository;

    @Transactional
    public ReservationResponse.SaveResultDTO save(ReservationRequest.SaveFormDto dto) {

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
                .passengerAmount(dto.getPassengerAmount())
                .paymentDeadline(null)
                .reservationPrice(dto.getReservationPrice())
                .build();


        int resultRowReservation = reservationRepository.insertR(reservationR);
        System.out.println("예약!");
        if (resultRowReservation != 1) {
            throw new MyBadRequestException("실패");
        }

        // 예약 결제상태
        Reservation reservationDTO = reservationRepository.findByReservationNum(reservationNum);
        System.out.println("테스트 00 : ");
        System.out.println(reservationDTO.getReservationNum());
        System.out.println(reservationDTO.getId());
        System.out.println("제에에발");

        //`birth_date`,`gender`,`passenger_type`,`created_at`)
        // passenger_tb
        Passenger passenger = Passenger.builder()
                .reservationId(reservationDTO.getId())
                .firstName(dto.getFirstName())
                .lastName(dto.getLastName())
                .birthDate(dto.getBirthDate())
                .gender(dto.getGender())
                .passengerType(dto.getPassengerType())
                .build();
        int resultRowPassenger = passengerRepository.insertP(passenger);
        System.out.println("승객!");
        if (resultRowPassenger != 1) {
            throw new MyBadRequestException("실패");
        }

        // ticket_tb
        Ticket ticket = Ticket.builder()
                .reservationId(reservationDTO.getId())
                .airFare(dto.getAirFare())
                .fuelSurcharge(dto.getFuelSurcharge())
                .taxes(dto.getTaxes())
                .ticketingFee(dto.getTicketingFee())
                .totalPrice(dto.getTotalPrice())
                .airline(dto.getAirline())
                .flightName(dto.getFlightName())
                .departureCity(dto.getDepartureCity())
                .arrivalCity(dto.getArrivalCity())
                .departureAirport(dto.getDepartureAirport())
                .arrivalAirport(dto.getArrivalAirport())
                .seatType(dto.getSeatType())
                .isOneWay(dto.isOneWay())
                .isNonStop(dto.isNonStop())
                .baggageAllowance(dto.getBaggageAllowance())
                .build();
        int resultRowTicket = ticketRepository.insertT(ticket);
        System.out.println("티켓!");
        if (resultRowTicket != 1) {
            throw new MyBadRequestException("실패");
        }

        // 방금 저장된 값 찾아서 담는 쿼리.
        // 승객 영문이름 타입 성별 생년월일
        Passenger passengerDTO = passengerRepository.findByReservationId(reservationDTO.getId());
        System.out.println("테스트 01 : ");
        System.out.println(passengerDTO.getId());
        System.out.println(passengerDTO.getReservationId());
        System.out.println("살려줘");
        // 티켓 항공요금 유류할증료 제세공과금 발권수수료 총액운임
        List<Ticket> ticketDTO = ticketRepository.findByReservationId(reservationDTO.getId());

        ReservationResponse.SaveResultDTO response =
                new ReservationResponse.SaveResultDTO(reservationDTO, passengerDTO, ticketDTO);

        System.out.println("----안담김?----");
        System.out.println(response.getReservation().getReservationNum());
        System.out.println(response.getPassenger().getReservationId());
        System.out.println("--------");
        return response;
    }

    /**
     * 
     * @param userId
     * @param dto
     * @return tripList
     */
    public List<GetMyTravelDTO> getMyTravel(int userId, UserRequest.GetMyTravelListDTO dto) {
        StatusEnum statusEnum = dto.getStatusEnum();

        String stringSort = dto.getSort();
        String sort = "전체";

        switch (stringSort) {
            case "전체": sort = "all"; break;
            case "결제전": sort = "false"; break;
            case "결제완료": sort = "true"; break;
            default: throw new MyBadRequestException("잘못된 값이 입력되었습니다");
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


	@Transactional
	public void cancelReservation(Long reservationNum) {
		if(reservationNum == null) {
			throw new MyBadRequestException("취소할 예약 번호가 없습니다");
		}
		try {
			int updateResult =  reservationRepository.cancelReservation(reservationNum);
			if(updateResult == 0) {
				throw new MyBadRequestException("잘못된 예약 번호가 입력되었습니다");
			}
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
	}
    
	public List<GetPayedInfoDTO> getPayedInfo(Long reservationNum) {
		List<GetPayedInfoDTO> payedInfoList = null;
		if(reservationNum == null) {
			throw new MyBadRequestException("예약 번호가 없습니다");
		}
		try {
			payedInfoList = reservationRepository.getPayedInfo(reservationNum);
			for (GetPayedInfoDTO dto : payedInfoList) {
				dto.changePrice();
			}
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		return payedInfoList;
	}
    
    
    
    
}
