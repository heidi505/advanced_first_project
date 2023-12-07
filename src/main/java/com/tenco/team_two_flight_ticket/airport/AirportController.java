package com.tenco.team_two_flight_ticket.airport;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;



@RequestMapping("/airport")
@Controller
public class AirportController {

	// http://localhost:8080/airport/airport-info
	@GetMapping("/airport-info")
	public String parkingArea(Model model) {
		
		// 넘겨 받을 인자
		
		
		URI uri = null;
		String url = "http://openapi.airport.co.kr/service/rest/AirportParkingFee/parkingfee?serviceKey=rrf%2Bmnq9ofBCLMm6ehZUvWu%2FZljoJtXJZKSVOIkz61hIbsnmpY3s3aeMuC3VfTlt9MVM8aSL1J3M%2Bzm3ad2%2BXg%3D%3D&schAirportCode=GMP&type=json";
		//String url = "https://api.odcloud.kr/api/getAPRTWaitTime/v1/aprtWaitTime?page=1&perPage=10&serviceKey=rp%2FOYp5QVAorZk2egcSoYVtzhLAfDa5S4drH%2FDJ54A6VPhBLEndxKg8JDdwu%2B6rd64z%2BBIHlwMWAKaimrdUgBQ%3D%3D";
		try {
			uri = new URI(url);
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} 
				 
		
		System.out.println(uri.toString());
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
 
		HttpEntity<MultiValueMap<String, String>> request 
				= new HttpEntity<>(headers);
		
		//ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET, request, String.class);
		//System.out.println(response.getBody());
		ResponseEntity<Map> response = restTemplate.exchange(uri, HttpMethod.GET, request, Map.class);
		System.out.println(response.getBody());
	
		
		model.addAttribute("list",response.getBody());
		
		
		
		return "airport/airportInfo";
	}
	
}
