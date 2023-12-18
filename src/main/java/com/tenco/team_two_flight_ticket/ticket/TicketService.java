package com.tenco.team_two_flight_ticket.ticket;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

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

import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket._middle._entity.City;
import com.tenco.team_two_flight_ticket._middle._repository.AirlineRepository;
import com.tenco.team_two_flight_ticket._middle._repository.AirportRepository;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DataDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.ItinerariesDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.SegmentDTO;
import com.tenco.team_two_flight_ticket.ticket.TicketResponse.GetTicketDateDTO;

@Service
public class TicketService {
    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private AirlineRepository airlineRepository;
    @Autowired
    private AirportRepository airportRepository;
    private TicketResponse.FlightSearchDTO responseDTO;
    public List<City> getCities(String region) {
        List<City> cities = ticketRepository.getCities(region);
        return cities;
    }

    //티켓 검색 누르면 나오는 서비스 로직
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
                .queryParam("includedAirlineCodes", "7C,H1,KE,OZ,NH,ANA,VJ,JL,VN,MU,SQ,7G,TG,UO,TW,PR,CI,CS,MF,MH,CZ")
                .build()
                .toUriString());

        HttpEntity<MultiValueMap<String, String>> requestMsg2 = new HttpEntity<>(headers2);

        ResponseEntity<TicketResponse.FlightSearchDTO> response2 = rt2.exchange(uri, HttpMethod.GET, requestMsg2, TicketResponse.FlightSearchDTO.class);

        TicketResponse.FlightSearchDTO responseDTO = new TicketResponse.FlightSearchDTO(response2.getBody());

        //응답 DTO 항공사 코드를 이름으로 파싱

        List<String> newAirline = responseDTO.getData().stream()
                .flatMap(e->e.getItineraries().stream())
                .flatMap(e->e.getSegments().stream())
                .map(e->airlineRepository.findAirlineName(e.getCarrierCode()))
                .collect(Collectors.toList());

        //목적지, 도착지의 공항을 국가 이름으로 파싱

        List<String> newDeparture = responseDTO.getData().stream()
                .flatMap(e->e.getItineraries().stream())
                .flatMap(e->e.getSegments().stream())
                .map(e->airportRepository.findCityName(e.getDeparture().getIataCode()))
                .collect(Collectors.toList());

        List<String> newArrival = responseDTO.getData().stream()
                .flatMap(e->e.getItineraries().stream())
                .flatMap(e->e.getSegments().stream())
                .map(e->airportRepository.findCityName(e.getArrival().getIataCode()))
                .collect(Collectors.toList());

        List<SegmentDTO> newSeg = responseDTO.getData().stream()
                .flatMap(e->e.getItineraries().stream())
                .flatMap(e->e.getSegments().stream())
                .collect(Collectors.toList());

        List<ItinerariesDTO> newIt = responseDTO.getData().stream()
                .flatMap(e->e.getItineraries().stream())
                .toList();


        List<DataDTO> newData = responseDTO.getData().stream().toList();

        for (int i = 0; i < newData.size(); i++) {
            for (int j = 0; j < newIt.size(); j++) {
                for (int k = 0; k < newSeg.size(); k++) {
                    newSeg.get(k).setAirlineName(newAirline.get(k));
                    newSeg.get(k).getDeparture().setCityName(newDeparture.get(k));
                    newSeg.get(k).getArrival().setCityName(newArrival.get(k));

                }
            }
        }




        responseDTO.setData(newData);
        this.responseDTO = responseDTO;


        return responseDTO;
    }
    
    
	public GetTicketDateDTO getTicketDate(int userId) {
		GetTicketDateDTO dto = null;
		try {
			dto = ticketRepository.getTicketDate(userId);
			dto.timeCheck();
			dto.cutDepartureTime();
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		return dto;
	}


    public DataDTO ticketDetail(int ticketId) {
        DataDTO dataDTO = this.responseDTO.getData().get(ticketId);
        return dataDTO;
    }
}
