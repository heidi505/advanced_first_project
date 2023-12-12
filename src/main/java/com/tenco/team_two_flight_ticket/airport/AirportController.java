package com.tenco.team_two_flight_ticket.airport;

import java.util.Map;

import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.airport.parkingspace.ParkingStatusResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/airport")
@Controller
public class AirportController {
    public static final String SERVICEKEY = Define.SERVICEKEY;

    @Autowired
    private AirportService airportService;
    
    // http://localhost:8080/airport/airport-info
    // 인천공항 주차정보 api
    // 주차요금 api
    // 탑승 수속 대기시간 api x
    @GetMapping("/airport-info")
    public String parkingArea(Model model) {
    	// 전국공항 주차요금 api
    	Map list = airportService.getParkingFeeAPI();
        model.addAttribute("list", list);

        // 인청공항 주차정보 api
        ParkingStatusResponse parkingStatusResponse = airportService.getParkingAreaInfoAPI();
        // Model에 DTO를 추가하여 JSP로 전달
        model.addAttribute("parkingStatusResponse", parkingStatusResponse);

        return "airport/airportInfo";
    }

}