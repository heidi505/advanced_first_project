package com.tenco.team_two_flight_ticket.ticket;

import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._middle._entity.City;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.net.URISyntaxException;
import java.util.List;
import java.util.stream.Collectors;

@RequestMapping("/ticket")
@Controller
public class TicketController {

    @Autowired
    private TicketService ticketService;

//    @GetMapping("/flight-search")
//    public String flightSearch(Model model) {
//        String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
//        String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};
//
//        for (int i = 0; i < regions.length; i++) {
//            model.addAttribute(values[i],ticketService.getCities(regions[i]));
//        }
//
//        return "flightTicket/flightSearch";
//    }

    @PostMapping("/flight-search")
    public String flightSearchProc(@Valid TicketRequest.TicketSearchDTO dto, Model model) throws URISyntaxException {
        String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
        String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};

        for (int i = 0; i < regions.length; i++) {
            model.addAttribute(values[i],ticketService.getCities(regions[i]));
        }


        TicketResponse.FlightSearchDTO responseBody = ticketService.getTickets(dto);
        model.addAttribute("count", responseBody.getMeta().getCount());
        model.addAttribute("ticketList", responseBody.getData());
        model.addAttribute("segments", responseBody.getData().stream().flatMap(e->e.getItineraries().stream()).flatMap(e->e.getSegments().stream()).collect(Collectors.toList()));
        model.addAttribute("price", responseBody.getData().stream().map(e->e.getPrice()).collect(Collectors.toList()));
        model.addAttribute("priceOptions", responseBody.getData().stream().map(e->e.getTravelerPricings()).collect(Collectors.toList()));

        System.out.println("==========================================================================================");

        System.out.println(responseBody.getData().stream().flatMap(e->e.getItineraries().stream()).map(e->e.getSegments().get(0).getDeparture().getAt()).collect(Collectors.toList()));
        System.out.println(responseBody.getData().stream().flatMap(e->e.getItineraries().stream()).map(e->e.getSegments().get(0).getDeparture().getIataCode()).collect(Collectors.toList()));
        System.out.println(responseBody.getData().stream().flatMap(e->e.getItineraries().stream()).map(e->e.getSegments().get(0).getDeparture().getTerminal()).collect(Collectors.toList()));

        System.out.println("========================================================================================");


        return "flightTicket/flightSearch";
    }



    @GetMapping("/cities-list")
    public ResponseEntity<ApiUtils.ApiResult<List<City>>> citiesList(@RequestParam(defaultValue = "대한민국") String region){
        List<City> cities = ticketService.getCities(region);
        return ResponseEntity.ok().body(ApiUtils.success(cities));
    }
}
