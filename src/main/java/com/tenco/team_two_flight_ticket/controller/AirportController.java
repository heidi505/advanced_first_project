package com.tenco.team_two_flight_ticket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/airport")
@Controller
public class AirportController {

	// http://localhost:8080/airport/parking-area
	@GetMapping("/parking-area")
	public String parkingArea() {
		return "airport/parkingArea";
	}
	
}
