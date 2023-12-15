package com.tenco.team_two_flight_ticket.kakaopay.service;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.kakaopay.dto.KakaoPayApprovalDTO;
import com.tenco.team_two_flight_ticket.kakaopay.dto.KakaoPayReadyDTO;
import com.tenco.team_two_flight_ticket.kakaopay.dto.cancelResponse.KaKaoCancelDTO;
import com.tenco.team_two_flight_ticket.reservation.ReservationRepository;
import com.tenco.team_two_flight_ticket.reservation.ReservationResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class KakaoPayService {

    private KakaoPayReadyDTO kakaoPayReadyDTO;
    private KakaoPayApprovalDTO kakaoPayApprovalDTO;
    private KaKaoCancelDTO kaKaoCancelDTO;

    @Autowired
    private ReservationRepository reservationRepository;


    //    결제 준비
    public String kakaoPayReady(Integer userId) {

//        예약한 상세와 결제내역 정보
        List<ReservationResponse.ReservationPaymentDTO> reservationPaymentDTO = reservationRepository.reservationPayment(userId);
        ReservationResponse.ReservationPaymentDTO reservationPaymentLists = null;

        for (ReservationResponse.ReservationPaymentDTO reservationPayment : reservationPaymentDTO) {
            reservationPaymentLists = reservationPayment;
        }

        RestTemplate restTemplate = new RestTemplate();

        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + Define.ADMINKEY);
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        String reservationNum = Long.toString(reservationPaymentLists.getReservationNum());
        String passengerAmount = Integer.toString(reservationPaymentLists.getPassengerAmount() - 1);

        Long couponPriceLong = reservationPaymentLists.getCouponDiscountingPrice();

        Long totalPrice = reservationPaymentLists.getTotalPrice();
        Long finalPriceLong = totalPrice - couponPriceLong;
        String couponPrice = Long.toString(couponPriceLong);
        String finalPrice = Long.toString(finalPriceLong);
        System.out.println(finalPrice + "할인 된 금액 ");

        String fullname = reservationPaymentLists.getPassengerLastName() + reservationPaymentLists.getPassengerFirstName();
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", reservationNum);
        params.add("partner_user_id", reservationPaymentLists.getUsername());
        params.add("item_name", fullname + " 외 " + passengerAmount + " 명");
        params.add("quantity", "1");
        params.add("tax_free_amount", couponPrice);
        params.add("total_amount", finalPrice);
        params.add("approval_url", "http://localhost:8080/payed");
        params.add("cancel_url", "http://localhost:8080/kakaoPay/cancel");
        params.add("fail_url", "http://localhost:8080/kakaoPay/fail");

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        try {
            kakaoPayReadyDTO = restTemplate.postForObject(new URI("https://kapi.kakao.com/v1/payment/ready"), body, KakaoPayReadyDTO.class);

            System.out.println("카카오 준비 tid" + kakaoPayReadyDTO.getTid());

            return kakaoPayReadyDTO.getNext_redirect_pc_url();

        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }

        return "/main";

    }

    public KakaoPayApprovalDTO kakaoPayInfo(String pg_token, Integer userId) {
        List<ReservationResponse.ReservationPaymentDTO> reservationPaymentDTO = reservationRepository.reservationPayment(userId);

        ReservationResponse.ReservationPaymentDTO reservationPaymentLists = null;
        for (ReservationResponse.ReservationPaymentDTO reservationPayment : reservationPaymentDTO) {
            reservationPaymentLists = reservationPayment;
        }

        RestTemplate restTemplate = new RestTemplate();

        String reservationNum = Long.toString(reservationPaymentLists.getReservationNum());
        Long couponPrice = reservationPaymentLists.getCouponDiscountingPrice();
        Long totalPrice = reservationPaymentLists.getTotalPrice();

        Long finalPriceLong = totalPrice - couponPrice;
        String finalPrice = Long.toString(finalPriceLong);
        System.out.println(finalPrice + "할인 된 금액 ");

        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + Define.ADMINKEY);
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyDTO.getTid());
        params.add("partner_order_id", reservationNum);
        params.add("partner_user_id", reservationPaymentLists.getUsername());
        params.add("pg_token", pg_token);
        params.add("total_amount", finalPrice);

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity(params, headers);

        try {
            kakaoPayApprovalDTO = restTemplate.postForObject(new URI("https://kapi.kakao.com/v1/payment/approve"), body, KakaoPayApprovalDTO.class);

            System.out.println("카카오승인 결제 tid" + kakaoPayApprovalDTO.getTid());

            return kakaoPayApprovalDTO;

        } catch (RestClientException e) {
        } catch (URISyntaxException e) {
        }

        return null;
    }

    public ReservationResponse.ReservationPaymentDTO reservationInfo(Integer userId) {
        List<ReservationResponse.ReservationPaymentDTO> reservationPaymentDTO = reservationRepository.reservationPayment(userId);

        ReservationResponse.ReservationPaymentDTO reservationPaymentLists = null;
        for (ReservationResponse.ReservationPaymentDTO reservationPayment : reservationPaymentDTO) {
            reservationPaymentLists = reservationPayment;
        }

////        날짜 포맷 데이터
//        java.sql.Timestamp departureTime = reservationPaymentLists.getDepartureTime();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        String formattedDate = sdf.format(new Date(departureTime.getTime()));
//        System.out.println("Timestamp as String: " + formattedDate);

        return reservationPaymentLists;
    }


    public KaKaoCancelDTO kakaoPayCancel() {

        RestTemplate restTemplate = new RestTemplate();

        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + Define.ADMINKEY);
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        String amountPrice = Integer.toString(kakaoPayApprovalDTO.getAmount().getTotal());
        System.out.println("가격" + amountPrice);
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyDTO.getTid());
        params.add("status", "CANCEL_PAYMENT");
        params.add("cancel_amount", "1000");
        params.add("cancel_tax_free_amount", "50");

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity(params, headers);

        try {
            kaKaoCancelDTO = restTemplate.postForObject(new URI("https://kapi.kakao.com/v1/payment/cancel"), body, KaKaoCancelDTO.class);
            kaKaoCancelDTO.setStatus("SUCCESS_PAYMENT");
            String status = kaKaoCancelDTO.getStatus();
            System.out.println("Cancel Status: " + status);
            return kaKaoCancelDTO;

        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        return null;
    }

}