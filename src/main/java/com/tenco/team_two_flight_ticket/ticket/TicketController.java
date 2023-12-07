package com.tenco.team_two_flight_ticket.ticket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/ticket")
@Controller
public class TicketController {

    @GetMapping("/flight-search")
    public String flightSearch() {
        return "flightTicket/flightSearch";
    }
}
