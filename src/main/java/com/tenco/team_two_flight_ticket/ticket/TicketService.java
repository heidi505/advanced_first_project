package com.tenco.team_two_flight_ticket.ticket;

import com.tenco.team_two_flight_ticket._middle._entity.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.List;

@Service
public class TicketService {
    @Autowired
    private TicketRepository ticketRepository;
    public List<City> getCities(String region) {
        List<City> cities = ticketRepository.getCities(region);
        return cities;
    }

    public TicketResponse.FlightSearchDTO getTickets(TicketRequest.TicketSearchDTO dto) throws URISyntaxException {
        String date = dto.getStartDate().replace(",","");
        dto.setStartDate(date);
        //날짜 파싱
        if (date.contains("~")){
            String[] parsedDate = date.split(" ~ ");
            String startDate = parsedDate[0];
            String endDate = parsedDate[1];

            dto.setStartDate(startDate);
            dto.setEndDate(endDate);
        }
        System.out.println("출발일:" + dto.getStartDate());
        System.out.println("도착일:" + dto.getEndDate());


        //좌석 등급 바꾸기
        if(dto.getTravelClass().equals("일반석")){
            dto.setTravelClass("ECONOMY");
        }else if(dto.getTravelClass().equals("비즈니스석")){
            dto.setTravelClass("BUSINESS");
        }else if(dto.getTravelClass().equals("일등석")){
            dto.setTravelClass("FIRST");
        }

        //api 요청 - access token 받기
        RestTemplate rt1 = new RestTemplate();

        //헤더
        HttpHeaders headers1 = new HttpHeaders();
        headers1.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        //바디
        MultiValueMap<String, String> params1 = new LinkedMultiValueMap<>();
        params1.add("grant_type","client_credentials");
        params1.add("client_id", "dM5mxGRWiLFG2iWt1gq2fqeAKugUwK8Z");
        params1.add("client_secret", "lHo1KyBlRG6UG3wE");

        HttpEntity<MultiValueMap<String, String>> requestMsg1 = new HttpEntity<>(params1, headers1);

        ResponseEntity<TicketRequest.AccessToken> response1 = rt1.exchange("https://test.api.amadeus.com/v1/security/oauth2/token", HttpMethod.POST, requestMsg1, TicketRequest.AccessToken.class);

        //api 요청 - 데이터 받기
        RestTemplate rt2 = new RestTemplate();

        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer "+response1.getBody().getAccessToken());

        System.out.println("+++++++++++++++++++++++++"+dto.getStartDate());
        URI uri = new URI(UriComponentsBuilder
                .fromUriString("https://test.api.amadeus.com/v2/shopping/flight-offers")
                .queryParam("originLocationCode", dto.getOriginLocationCode())
                .queryParam("destinationLocationCode", dto.getDestinationLocationCode())
                .queryParam("departureDate", dto.getStartDate())
                .queryParam("returnDate", dto.getEndDate())
                .queryParam("adults", dto.getAdults())
                .queryParam("children", dto.getChildren())
                .queryParam("infants", dto.getInfants())
                .queryParam("travelClass", dto.getTravelClass())
                .queryParam("currencyCode", dto.getCurrencyCode())
                .queryParam("nonStop", true)
                .queryParam("max", 10)
                .build()
                .toUriString());

        HttpEntity<MultiValueMap<String, String>> requestMsg2 = new HttpEntity<>(headers2);

        ResponseEntity<TicketResponse.FlightSearchDTO> response2 = rt2.exchange(uri, HttpMethod.GET, requestMsg2, TicketResponse.FlightSearchDTO.class);

        TicketResponse.FlightSearchDTO responseDTO = response2.getBody();

//        responseDTO.getData().stream().map(e->e.getItineraries().stream().filter(e->e.getSegments().ge))

        return responseDTO;
    }
}
