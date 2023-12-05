package com.tenco.team_two_flight_ticket.airport;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/airport")
@Controller
public class AirportController {

	// http://localhost:8080/airport/airport-info
	@GetMapping("/airport-info")
	public String parkingArea() {
		return "airport/airportInfo";
	}
	
}
