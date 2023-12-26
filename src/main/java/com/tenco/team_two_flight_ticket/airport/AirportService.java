package com.tenco.team_two_flight_ticket.airport;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

import com.tenco.team_two_flight_ticket._core.utils.DateFormat;
import com.tenco.team_two_flight_ticket.airport.airportTravelTime.AirportTravelTimeDTO;
import com.tenco.team_two_flight_ticket.airport.parkingFee.ParkingFeeResponseDTO;
import com.tenco.team_two_flight_ticket.airport.parkingspace.ParkingStatusResponse2;
import com.tenco.team_two_flight_ticket.ticket.Ticket;
import com.tenco.team_two_flight_ticket.ticket.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.airport.parkingspace.ParkingStatusResponse;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class AirportService {
    public static final String SERVICEKEY = Define.SERVICEKEY;

    public ParkingFeeResponseDTO getParkingFeeAPI(String airportCode) {
        // 주차요금 api
        URI uri = null;
        try {        
            uri = new URI(UriComponentsBuilder
                    .fromUriString("http://openapi.airport.co.kr/service/rest/AirportParkingFee/parkingfee")
                    .queryParam("serviceKey", Define.SERVICEKEY)
                    .queryParam("schAirportCode",airportCode)
                    .queryParam("type", "json")
                    .build()
                    .toUriString());
            
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();

        HttpEntity<MultiValueMap<String, String>> request
                = new HttpEntity<>(headers);

        ResponseEntity<ParkingFeeResponseDTO> response = restTemplate.exchange(uri, HttpMethod.GET, request, ParkingFeeResponseDTO.class);
        ParkingFeeResponseDTO list = response.getBody();
        return list;
    }

    public ParkingStatusResponse getParkingAreaInfoAPI() {
        // 인청공항 주차정보 api
        URI uri2 = null;
        String baseUrl = "https://apis.data.go.kr/B551177/StatusOfParking/getTrackingParking?";
        String serviceKey = SERVICEKEY;
        int numOfRows = 10;
        int pageNo = 1;
        String type = "json";

        String url2 = baseUrl + "serviceKey=" + serviceKey + "&numOfRows=" + numOfRows + "&pageNo=" + pageNo + "&type=" + type;
        try {
            uri2 = new URI(url2);
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }

        System.out.println("uri 주소 : ");
        System.out.println(uri2.toString());

        RestTemplate restTemplate2 = new RestTemplate();

        HttpHeaders headers2 = new HttpHeaders();

        HttpEntity<MultiValueMap<String, String>> request2 = new HttpEntity<>(headers2);

        ResponseEntity<ParkingStatusResponse> responseEntity = restTemplate2.exchange(uri2, HttpMethod.GET, request2, ParkingStatusResponse.class);
        ParkingStatusResponse parkingStatusResponse = responseEntity.getBody();
        // 응답 데이터를 콘솔에 출력
        System.out.println("응답 데이터 : ");
        System.out.println(parkingStatusResponse);


        return parkingStatusResponse;
    }

    @Autowired
    private TicketRepository ticketRepository;

    public AirportTravelTimeDTO koAirportTime(Integer userId) {


        List<Ticket> airportNames = ticketRepository.findByTicketJoinReservation(userId);
        System.out.println(airportNames.get(0).getDepartureAirport() + "airportName");

        String departureAirport = "";
        for (Ticket airportName : airportNames) {
            departureAirport = airportName.getDepartureAirport();
        }
        System.out.println(departureAirport + "내 도착지 공항은 어디");

        String airport = departureAirport;
        System.out.println(airport);
        String myServiceKey = Define.SERVICEKEY;
        String nowDay = DateFormat.formatYear();
        String nowTime = DateFormat.formatTime();
        System.out.println(nowTime);

        // URI 클래스를 사용하여 URL 생성
        URI uri = null;
        try {
            uri = new URI(UriComponentsBuilder
                    .fromUriString("http://openapi.airport.co.kr/service/rest/dailyExpectPassenger/dailyExpectPassenger")
                    .queryParam("ServiceKey", myServiceKey)
                    .queryParam("schAirport", airport)
                    .queryParam("schDate", nowDay)
                    .queryParam("schHH", nowTime)
                    .build()
                    .toUriString());
        } catch (URISyntaxException e) {
            throw new RuntimeException(e);
        }
        
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/json; charset=UTF-8");

        HttpEntity<Map<String, String>> requestMessage
                = new HttpEntity<>(headers);

        ResponseEntity<AirportTravelTimeDTO> response
                = restTemplate.exchange(uri, HttpMethod.GET, requestMessage,
                AirportTravelTimeDTO.class);

        AirportTravelTimeDTO airportTravelTimes = response.getBody();


        return airportTravelTimes;
    }

    public ParkingStatusResponse2 getParkingAreaInfoAPI2(String airportCode) {
        // 전국 공항 주차정보 api

        if (airportCode == "ICN") {
            return null;
        } else {
            String baseUrl = "http://openapi.airport.co.kr/service/rest/AirportParkingCongestion/airportParkingCongestionRT";
            String serviceKey = Define.SERVICEKEY;
            System.out.println("어디겡 : " + airportCode);
            int numOfRows = 10;
            int pageNo = 1;

            URI uri3 = null;
            try {
                uri3 = new URI(UriComponentsBuilder
                        .fromUriString("http://openapi.airport.co.kr/service/rest/AirportParkingCongestion/airportParkingCongestionRT")
                        .queryParam("schAirportCode", airportCode)
//                    .queryParam("schAirportCode", "PUS") // 테스트용
                        .queryParam("serviceKey", serviceKey)
                        .queryParam("numOfRows", numOfRows)
                        .queryParam("pageNo", pageNo)
                        .build()
                        .toUriString());
            } catch (URISyntaxException e) {
                throw new RuntimeException(e);
            }

            System.out.println("전국 URI: " + uri3.toString());

            RestTemplate restTemplate3 = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();

            headers.add("Content-type", "application/json; charset=UTF-8");
            HttpEntity<MultiValueMap<String, String>> request3 = new HttpEntity<>(headers);

            ResponseEntity<ParkingStatusResponse2> responseEntity = restTemplate3.exchange(
                    uri3,
                    HttpMethod.GET,
                    request3,
                    ParkingStatusResponse2.class
            );
            ParkingStatusResponse2 parkingStatusResponse2 = responseEntity.getBody();

            if (responseEntity.getStatusCode().is2xxSuccessful()) {
                System.out.println(responseEntity.getBody());
                return parkingStatusResponse2;
            } else {
                System.out.println("HTTP 요청 실패: " + responseEntity.getStatusCodeValue());
                return null;
            }
        }
    }
}
