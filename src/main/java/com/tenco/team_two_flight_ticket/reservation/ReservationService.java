package com.tenco.team_two_flight_ticket.reservation;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import com.tenco.team_two_flight_ticket._middle._entity.HasCoupon;
import com.tenco.team_two_flight_ticket._middle._repository.HasCouponRepository;
import com.tenco.team_two_flight_ticket._middle._repository.PassengerRepository;
import com.tenco.team_two_flight_ticket.coupon.Coupon;
import com.tenco.team_two_flight_ticket.coupon.CouponRepository;
import com.tenco.team_two_flight_ticket.coupon.dto.CouponListDTO;
import com.tenco.team_two_flight_ticket.ticket.TicketRepository;
import com.tenco.team_two_flight_ticket.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
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
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;


@Slf4j
@Service
public class ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;
    @Autowired
    private TicketRepository ticketRepository;
    @Autowired
    private PassengerRepository passengerRepository;
    @Autowired
    private HasCouponRepository hasCouponRepository;
    @Autowired
    private CouponRepository couponRepository;

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
     * @param userId
     * @param dto
     * @return tripList
     */
    public List<GetMyTravelDTO> getMyTravel(int userId, UserRequest.GetMyTravelListDTO dto) {
        StatusEnum statusEnum = dto.getStatusEnum();

        String stringSort = dto.getSort();
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
            int notPayedTripCnt = reservationRepository.getMyTripCount(userId, statusEnum, "false");
            tripCnt.setAllTripCount(allTripCnt);
            tripCnt.setPayedTripCount(payedTripCnt);
            tripCnt.setNotPayedTripCount(notPayedTripCnt);
        } catch (Exception e) {
            throw new MyServerError("서버 에러가 발생했습니다");
        }

        return tripCnt;
    }


    public GetMyTripDetailDTO getMyTripDetail(int userId, Long reservationNum) {
        GetMyTripDetailDTO dto = null;
        if (reservationNum == null) {
            throw new MyBadRequestException("잘못된 예약번호입니다");
        }
        try {
            dto = reservationRepository.getMyTripDetail(userId, reservationNum);
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
        if (reservationNum == null) {
            throw new MyBadRequestException("취소할 예약 번호가 없습니다");
        }
        try {
            int updateResult = reservationRepository.cancelReservation(reservationNum);
            if (updateResult == 0) {
                throw new MyBadRequestException("잘못된 예약 번호가 입력되었습니다");
            }
        } catch (Exception e) {
            throw new MyServerError("서버 에러가 발생했습니다");
        }
    }

    public List<GetPayedInfoDTO> getPayedInfo(Long reservationNum) {
        List<GetPayedInfoDTO> payedInfoList = null;
        if (reservationNum == null) {
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

    @Transactional
    public String kakaoMessage(int i, String kakaoAccessToken, ReservationResponse.SaveResultDTO saveResultDTO) {
        // https://kapi.kakao.com/v2/api/talk/memo/default/send

        String access_token = kakaoAccessToken;

        RestTemplate rt1 = new RestTemplate();
        HttpHeaders headers1 = new HttpHeaders();
        headers1.add("Content-type", "application/x-www-form-urlencoded");
        headers1.add("Authorization", "Bearer " + access_token);

        // body 구성
        String reservationMessage =
                "안녕하세요 여행자님,\n" +
                        "나다운 진짜 여행 님부스에어라인입니다.\n\n" +
                        "예약이 완료되었어요!\n" +
                        "항공권 요금의 확정 여부를 확인 후 안내해 드릴게요. 감사합니다.\n\n" +
                        "예약번호 : " + saveResultDTO.getReservation().getReservationNum() + "\n\n" +
                        "*여권 정보 미 입력 시 발권 진행이 불가하며\n" +
                        "결제금액이 인상 또는 예약이 취소될 수 있어요.\n" +
                        "*결제 마감 시한까지 미결제 시 예약이 취소될 수 있어요.";

        MultiValueMap<String, String> params1 = new LinkedMultiValueMap<>();
        String templateObject = "{" +
                "\"object_type\":\"text\"," +
                "\"text\":\"[님부스에어라인]\\n" + reservationMessage.replace("\n", "\\n") + "\"," +
                "\"link\":{" +
                "\"web_url\":\"http://localhost:8080/main\"," +
                "\"mobile_web_url\":\"http://localhost:8080/main\"" +
                "}" +
                "}";
        params1.add("template_object", templateObject);

        HttpEntity<MultiValueMap<String, String>> requestMsg1 = new HttpEntity<>(params1, headers1);
        System.out.println("메시지 테스트 : " + requestMsg1);

        // 카카오톡 메시지 보내기 요청
        String sendMessageUrl = "https://kapi.kakao.com/v2/api/talk/memo/default/send";

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.postForEntity(sendMessageUrl, requestMsg1, String.class);

        // 응답 확인
        System.out.println("Response: " + responseEntity.getBody());
        System.out.println("카카오톡 메세지 보내기 성공");
        return null;
    }


    public List<CouponListDTO> getCouponList(User principal) {
        // 2. 보유 쿠폰 번호를 통해 쿠폰 검색 (coupon)
        List<CouponListDTO> coupons = couponRepository.findCouponByUserId(principal.getId());

        return coupons;
    }
}
