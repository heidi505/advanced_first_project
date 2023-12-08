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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.tenco.team_two_flight_ticket._core.utils.Define;

@RequestMapping("/airport")
@Controller
public class AirportController {

	// http://localhost:8080/airport/airport-info
	@GetMapping("/airport-info")
	public String parkingArea(Model model) {
		
		// 공항을 인자로 받아야 함 
		String airport = "GMP";
		
		URI uri = null;
		String url = "http://openapi.airport.co.kr/service/rest/AirportParkingFee/parkingfee?serviceKey="
				+ Define.SERVICEKEY
				+ "&schAirportCode=" + airport
				+ "&type=json";
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
		model.addAttribute("list",response.getBody());
		
		
		return "airport/airportInfo";
	}
	
	
}
