package com.tenco.team_two_flight_ticket.airport;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

import com.tenco.team_two_flight_ticket._core.utils.DateFormat;
import com.tenco.team_two_flight_ticket.airport.airportTravelTime.AirportTravelTimeDTO;
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
public class AirPortService {
    public static final String SERVICEKEY = Define.SERVICEKEY;

    public Map<String, String> getParkingFeeAPI() {
        // 주차요금 api
        URI uri = null;
        String url = "http://openapi.airport.co.kr/service/rest/AirportParkingFee/parkingfee?serviceKey=rrf%2Bmnq9ofBCLMm6ehZUvWu%2FZljoJtXJZKSVOIkz61hIbsnmpY3s3aeMuC3VfTlt9MVM8aSL1J3M%2Bzm3ad2%2BXg%3D%3D&schAirportCode=GMP&type=json";
        try {
            uri = new URI(url);
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();

        HttpEntity<MultiValueMap<String, String>> request
                = new HttpEntity<>(headers);

        ResponseEntity<Map> response = restTemplate.exchange(uri, HttpMethod.GET, request, Map.class);

        return response.getBody();
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

        return parkingStatusResponse;
    }

    @Autowired
    TicketRepository ticketRepository;

    public AirportTravelTimeDTO koAirportTime(Integer userId) {

        List<Ticket> airportNames = ticketRepository.findByTicketJoinReservation(userId);
        System.out.println(airportNames.get(0).getDepartureAirport() + "airportName");

        String departureAirport = "";
        for (Ticket airportName : airportNames) {
            departureAirport = airportName.getDepartureAirport();
        }
        System.out.println(departureAirport + "내 도착지 공항은 어디");

        String airport = departureAirport;

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


}