package com.tenco.team_two_flight_ticket.ticket;

import com.tenco.team_two_flight_ticket._middle._entity.City;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DataDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.PriceDTO;
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
import java.util.ListIterator;
import java.util.Random;
import java.util.stream.Collectors;

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


        //좌석 등급 바꾸기
        if(dto.getTravelClass().equals("일반석")){
            dto.setTravelClass("ECONOMY");
        }else if(dto.getTravelClass().equals("비즈니스석")){
            dto.setTravelClass("BUSINESS");
        }else if(dto.getTravelClass().equals("일등석")){
            dto.setTravelClass("FIRST");
        }

        //요청할 랜덤 숫자 생성
        Random random = new Random();
        int max = random.nextInt(11) + 10;

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
                .queryParam("max", max)
                .build()
                .toUriString());

        HttpEntity<MultiValueMap<String, String>> requestMsg2 = new HttpEntity<>(headers2);

        ResponseEntity<TicketResponse.FlightSearchDTO> response2 = rt2.exchange(uri, HttpMethod.GET, requestMsg2, TicketResponse.FlightSearchDTO.class);

        TicketResponse.FlightSearchDTO responseDTO = new TicketResponse.FlightSearchDTO(response2.getBody());

//        dataDTOList.stream()
//                .collect(Collectors.groupingBy(dataDTO -> dataDTO.getPrice().getGrandTotal()));
//
//
//
//        ListIterator<DataDTO> dataDTOListIterator = dataDTOList.listIterator();
////
////
//        for (int i = 0; i < dataDTOList.size(); i++) {
//            if(dataDTOList.get(i).getPrice().getGrandTotal() == list.get(i)){
//                dataDTOList.remove(i);
//            }
//        }
//
//        responseDTO.setData(dataDTOList);

        return responseDTO;
    }
}
