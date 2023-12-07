package com.tenco.team_two_flight_ticket.ticket;

import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/ticket")
@Controller
public class TicketController {

    @GetMapping("/flight-search")
    public String flightSearch() {
        return "flightTicket/flightSearch";
    }

    //각 버튼 누르면 string 전달되면서 where 절에 넣고 각 데이터 돌려줌
    @GetMapping("/cities-list")
    public ResponseEntity<ApiUtils.ApiResult<String>> citiesList(@RequestParam(defaultValue = "대한민국") String region){

        return null;
    }
}
