package com.tenco.team_two_flight_ticket.ticket;

import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._middle._entity.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping("/ticket")
@Controller
public class TicketController {

    @Autowired
    private TicketService ticketService;

    @GetMapping("/flight-search")
    public String flightSearch(Model model) {
        String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
        String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};

        for (int i = 0; i < regions.length; i++) {
            model.addAttribute(values[i],ticketService.getCities(regions[i]));
        }
        return "flightTicket/flightSearch";
    }



    //각 버튼 누르면 string 전달되면서 where 절에 넣고 각 데이터 돌려줌
    @GetMapping("/cities-list")
    public ResponseEntity<ApiUtils.ApiResult<List<City>>> citiesList(@RequestParam(defaultValue = "대한민국") String region){
        List<City> cities = ticketService.getCities(region);
        return ResponseEntity.ok().body(ApiUtils.success(cities));
    }
}
