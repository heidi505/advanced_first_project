package com.tenco.team_two_flight_ticket.airport;

import com.tenco.team_two_flight_ticket._core.utils.DateFormat;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.airport.airportTravelTime.AirportTravelTimeDTO;
import com.tenco.team_two_flight_ticket.ticket.Ticket;
import com.tenco.team_two_flight_ticket.ticket.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

@Service
public class AirPortService {

    @Autowired
    TicketRepository ticketRepository;

    public AirportTravelTimeDTO koAirportTime(Integer userId) {

        List<Ticket> airportNames =  ticketRepository.findByTicketJoinReservation(userId);
        System.out.println(airportNames.get(0).getDepartureAirport()+ "airportName");

        

        String departureAirport = "";
        for (Ticket airportName: airportNames) {
            departureAirport =  airportName.getDepartureAirport();
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
                    .queryParam("schDate",nowDay)
                    .queryParam("schHH",nowTime)
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
                =  restTemplate.exchange(uri, HttpMethod.GET, requestMessage,
                AirportTravelTimeDTO.class);

        AirportTravelTimeDTO airportTravelTimes = response.getBody();

        return airportTravelTimes;
    }

}
