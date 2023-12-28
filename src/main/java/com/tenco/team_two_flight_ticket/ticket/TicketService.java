package com.tenco.team_two_flight_ticket.ticket;


import java.util.*;

import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.PriceDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket._middle._entity.City;
import com.tenco.team_two_flight_ticket._middle._entity.enums.SeatTypeEnum;

import java.net.URI;
import java.net.URISyntaxException;

import java.util.List;
import java.util.stream.Collectors;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;
import java.util.Random;
import java.util.stream.Collectors;


import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.tenco.team_two_flight_ticket._middle._repository.AirlineRepository;
import com.tenco.team_two_flight_ticket._middle._repository.AirportRepository;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DataDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.ItinerariesDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.SegmentDTO;

import com.tenco.team_two_flight_ticket.search.SearchedResponse.SearchCityDTO;
import com.tenco.team_two_flight_ticket.ticket.TicketRequest.TicketSearchDTO;
import com.tenco.team_two_flight_ticket.ticket.TicketResponse.GetTicketDateDTO;


import javax.xml.crypto.Data;

import jakarta.validation.Valid;


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

        //도착지의 공항을 국가 이름으로 파싱한 list

        List<String> newDeparture = responseDTO.getData().stream()
                .flatMap(e->e.getItineraries().stream())
                .flatMap(e->e.getSegments().stream())
                .map(e->airportRepository.findCityName(e.getDeparture().getIataCode()))
                .collect(Collectors.toList());

        //목적지의 공항을 국가 이름으로 파싱한 list
        List<String> newArrival = responseDTO.getData().stream()
                .flatMap(e->e.getItineraries().stream())
                .flatMap(e->e.getSegments().stream())
                .map(e->airportRepository.findCityName(e.getArrival().getIataCode()))
                .collect(Collectors.toList());

        //
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
    
    /**
     * 
     * @param userId
     * @return GetTicketDateDTO dto
     */
	public GetTicketDateDTO getTicketDate(int userId) {
		GetTicketDateDTO dto = null;
		try {
			dto = ticketRepository.getTicketDate(userId);
			if(dto != null) {
				dto.timeCheck();
				dto.cutDepartureTime();
			}
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		return dto;
	}



    public List<DataDTO> ticketDetail(int ticketId) {

        List<DataDTO> dto = responseDTO.getData().stream().filter(e->e.getId().equals(String.valueOf(ticketId))).collect(Collectors.toList());

        return dto;

    }


    public TicketRequest.TicketSearchDTO parsingReq(TicketRequest.TicketSearchDTO dto) {

        TicketRequest.TicketSearchDTO newDto = dto;

        String originName = ticketRepository.getCity(dto.getOriginLocationCode());
        String destinationName = ticketRepository.getCity(dto.getDestinationLocationCode());
        int added = dto.getAdults() + dto.getChildren() + dto.getInfants();

        newDto.setOriginLocationName(originName);
        newDto.setDestinationLocationName(destinationName);
        newDto.setAllPassengers(String.valueOf(added));


        System.out.println("================" + added);
        return newDto;
    }

    public TicketResponse.FlightSearchDTO onewayOptionSearch(TicketRequest.OptionDTO optionDTO) {

        if(optionDTO.getAirlineOption().isEmpty() && optionDTO.getOnewayDepTimeOption().isEmpty() && optionDTO.getOnewayArrTimeOption().isEmpty()){
            throw new MyBadRequestException("검색할 옵션을 선택해주세요");
        }


        List<DataDTO> respDto = responseDTO.getData().stream()
                .filter(e -> e.getItineraries().stream()
                        .anyMatch(itinerary -> itinerary.getSegments().stream()
                                .anyMatch(segment ->
                                        (optionDTO.getAirlineOption().isEmpty() ||
                                        optionDTO.getAirlineOption().stream()
                                                .anyMatch(airlineOption -> segment.getAirlineName().equals(airlineOption)))
                                                &&
                                                (optionDTO.getOnewayDepTimeOption().isEmpty() || optionDTO.getOnewayDepTimeOption().stream()
                                                        .anyMatch(d -> segment.getDeparture().depSearch(d)))
                                                && (optionDTO.getOnewayArrTimeOption().isEmpty() ||
                                                        optionDTO.getOnewayArrTimeOption().stream()
                                                .anyMatch(a -> segment.getArrival().arrSearch(a)))

                                )
                        )
                )
                .collect(Collectors.toList());




        responseDTO.setData(respDto);
        responseDTO.getMeta().setCount(respDto.size());

        return responseDTO;

    }

    public TicketResponse.FlightSearchDTO optionSearch(TicketRequest.OptionDTO optionDTO) {
        if(optionDTO.roundOptionsAreEmpty(optionDTO)){
            throw new MyBadRequestException("검색할 옵션을 선택해주세요");
        }


        List<DataDTO> removedDto = new ArrayList<>();

//        for(int i = 0; i < dataDTO.size(); i++) {
//            SegmentDTO segDto = dataDTO.get(i).getItineraries().get(0).getSegments().get(0);
//            for (int j = 0; j < optionDTO.getOnewayDepTimeOption().size(); j++) {
//                if(segDto.getDeparture().depSearch(optionDTO.getOnewayDepTimeOption().get(j))){
//                    removedDto.add(dataDTO.get(i));
//                    break;
//                }
//            }
//        }
//
//        System.out.println("가는날 출발:" + removedDto.size());
//
//        for(int i = 0; i < dataDTO.size(); i++) {
//            SegmentDTO segDto = dataDTO.get(i).getItineraries().get(0).getSegments().get(0);
//            for (int j = 0; j < optionDTO.getOnewayArrTimeOption().size(); j++) {
//                if(segDto.getArrival().arrSearch(optionDTO.getOnewayArrTimeOption().get(j))){
//                    if(!removedDto.contains(dataDTO.get(i))){
//                        removedDto.add(dataDTO.get(i));
//                        break;
//                    }
//                }
//            }
//        }
//
//        System.out.println("가는날 도착:" + removedDto.size());
//
//        for (int i = 0; i < dataDTO.size(); i++) {
//            SegmentDTO segDto = dataDTO.get(i).getItineraries().get(1).getSegments().get(0);
//            // 제공해주는 정보 - segDto(dataDTO의 i번지 내용)
//            for (int j = 0; j < optionDTO.getRoundDepTimeOption().size(); j++) {
//                // 사용자가 선택한 시간 List - optionDTO
//                if(segDto.getDeparture().depSearch(optionDTO.getRoundDepTimeOption().get(j))){
//                    // segDto에 optionDTO가 있다면
//                    if(!removedDto.contains(dataDTO.get(i))){
//                        // removeDto에 포함되어 있지 않다면
//                        removedDto.add(dataDTO.get(i));
//                        // removeDto에 추가하고 멈춰
//                        break;
//                    }
//                }
//            }
//        }
//
//        System.out.println("오는날 출발:" + removedDto.size());
//
//        for (int i = 0; i < dataDTO.size(); i++) {
//            SegmentDTO segDto = dataDTO.get(i).getItineraries().get(1).getSegments().get(0);
//            for (int j = 0; j < optionDTO.getRoundArrTimeOption().size(); j++) {
//                if(segDto.getArrival().arrSearch(optionDTO.getRoundArrTimeOption().get(j))){
//                    if(!removedDto.contains(dataDTO.get(i))){
//                        removedDto.add(dataDTO.get(i));
//                        break;
//                    }
//
//                }
//            }
//        }
//
//        System.out.println("오는날 도착" + removedDto.size());
//
//        dataDTO = dataDTO.stream().filter(e->removedDto.stream().anyMatch(i->i.getId().equals(e.getId()))).collect(Collectors.toList());
//
//        responseDTO.setData(dataDTO);
//        responseDTO.getMeta().setCount(dataDTO.size());

        return responseDTO;


    }

    // 간편 항공권 검색 조건 채우기
 	public TicketSearchDTO getSearchDTO(@Valid TicketRequest.TicketLightSearchDTO dto) {
 		// 검색 조건 dto
 		TicketSearchDTO searchDto = new TicketSearchDTO(); 				
 		String keyword = dto.getKeyword();
 		List<City> cities = ticketRepository.getCitiesFromKeyword(keyword);
 		Random random = new Random();
 		// 나라 이름이나 유사명으로 검색된 경우 랜덤하게 도시 선택
 		int r = random.nextInt(cities.size() == 0 ? cities.size()-1 : cities.size());
 		if(cities.size() >= 1) {
 			searchDto.setDestinationLocationCode(cities.get(r).getCityCode());
 		}
 		// 출발지는 한국의 랜덤한 공항
 		List<City> koreanCity = ticketRepository.getKoreanCity();
 		int r2 = random.nextInt(koreanCity.size() == 0 ? koreanCity.size()-1 : koreanCity.size());
 		searchDto.setOriginLocationCode(koreanCity.get(r2).getCityCode());
 		// 인원은 어른 1명으로 고정
 		searchDto.setAdults(1);
 		// 현재 날짜 + 30일
 		LocalDate departureDate = LocalDate.now().plusDays(30);
 		String startDate = String.valueOf(departureDate);
 		searchDto.setStartDate(startDate);
 		// 좌석은 일반석
 		searchDto.setTravelClass("일반석");
 		return searchDto;
 	}

 	/**
 	 * 
 	 * @param dto
 	 * @return cities
 	 */
 	//검색어로 도시 조회
 	public List<City> getCitiesFromKeyword(@Valid TicketRequest.SearchCityDTO dto) {
 		List<City> cities = null;
 		try {
 			cities = ticketRepository.getCitiesFromKeyword(dto.getKeyword());
 		} catch (Exception e) {
 			throw new MyServerError("서버 에러가 발생했습니다");
 		}
 		return cities;
 	}

 	// 가장 빠른 출발지 공항 조회
	public String findDepartureAirport(int id) {
		String airport = null;
		try {
			airport = ticketRepository.findDepartureAirport(id);
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		return airport;
	}

}
