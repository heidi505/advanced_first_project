package com.tenco.team_two_flight_ticket.ticket;


import java.net.URISyntaxException;
import java.util.List;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._middle._entity.City;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DataDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.ItinerariesDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.SegmentDTO;
import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket._middle._entity.City;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DataDTO;
import com.tenco.team_two_flight_ticket.search.SearchedService;
import com.tenco.team_two_flight_ticket.user.User;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@RequestMapping("/ticket")
@Controller
public class TicketController {

    @Autowired
    private TicketService ticketService;
    @Autowired
    private HttpSession session;
    @Autowired
    private SearchedService searchedService;



    @GetMapping("/preview/{ticketId}")
    public String preview(@PathVariable int ticketId, Model model){

        DataDTO dto = ticketService.ticketDetail(ticketId);
        int isRound = dto.getItineraries().size();

        model.addAttribute("ticket", dto);
        model.addAttribute("isRound", isRound);

        return "/reservation/preview";}

    @GetMapping("/flight-search")
    public String flightSearch(Model model) {
        String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
        String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};

        for (int i = 0; i < regions.length; i++) {
            model.addAttribute(values[i],ticketService.getCities(regions[i]));
        }

        return "flightTicket/flightSearch";
    }

    @PostMapping("/flight-search")
    public String flightSearchProc(@Valid TicketRequest.TicketSearchDTO dto, Model model) throws URISyntaxException {

        String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
        String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};

        for (int i = 0; i < regions.length; i++) {
            model.addAttribute(values[i],ticketService.getCities(regions[i]));
        }
        
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        searchedService.saveRecentSearch(principal.getId() ,dto);
        TicketResponse.FlightSearchDTO responseBody = ticketService.getTickets(dto);
        model.addAttribute("count", responseBody.getMeta().getCount());

        List<DataDTO> dataDTOList = responseBody.getData();
        model.addAttribute("ticketList", dataDTOList);

        if (dataDTOList.isEmpty() || dataDTOList.size() == 0){
            throw new MyBadRequestException("해당하는 항공권이 없습니다");
        }

        int isRound = dataDTOList.get(0).getItineraries().size();
        model.addAttribute("isRound", isRound);





        return "flightTicket/flightSearch";
    }
    
    @GetMapping("/flight-recent-search")
    public String flightRecentSearchProc(@Valid TicketRequest.TicketSearchDTO dto, Model model) throws URISyntaxException {
    	String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
    	String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};
    	
    	for (int i = 0; i < regions.length; i++) {
    		model.addAttribute(values[i],ticketService.getCities(regions[i]));
    	}

    	TicketResponse.FlightSearchDTO responseBody = ticketService.getTickets(dto);
    	model.addAttribute("count", responseBody.getMeta().getCount());
    	List<DataDTO> dataDTOList = responseBody.getData();
    	model.addAttribute("ticketList", dataDTOList);
    	
    	
    	return "flightTicket/flightSearch";
    }



    @GetMapping("/cities-list")
    public ResponseEntity<ApiUtils.ApiResult<List<City>>> citiesList(@RequestParam(defaultValue = "대한민국") String region){
        List<City> cities = ticketService.getCities(region);
        return ResponseEntity.ok().body(ApiUtils.success(cities));
    }
}
