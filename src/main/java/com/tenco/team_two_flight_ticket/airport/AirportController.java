package com.tenco.team_two_flight_ticket.airport;

import java.util.List;
import com.tenco.team_two_flight_ticket._core.utils.DateFormat;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.airport.airportTravelTime.AirportTravelTimeDTO;
import com.tenco.team_two_flight_ticket.airport.parkingFee.ParkingFeeResponseDTO;
import com.tenco.team_two_flight_ticket.airport.parkingFee.ParkingFeeResponseDTO.Response.Body.Items.Item;
import com.tenco.team_two_flight_ticket.airport.parkingspace.ParkingStatusResponse;
import com.tenco.team_two_flight_ticket.airport.parkingspace.ParkingStatusResponse2;
import com.tenco.team_two_flight_ticket.ticket.TicketService;
import com.tenco.team_two_flight_ticket.user.User;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/airport")
@Controller
public class AirportController {
	
    @Autowired
    private HttpSession session;

    @Autowired
    private AirportService airportService;

    @Autowired
    private TicketService ticketService;
    
    // http://localhost:8080/airport/airport-info
    // 인천공항 주차정보 api
    // 주차요금 api
    // 탑승 수속 대기시간 api x
    @GetMapping("/airport-info")
    public String parkingAPI(Model model) {
    	
    	User principal = (User) session.getAttribute(Define.PRINCIPAL);
    	// 출발지 공항 코드 조회
    	String departureAirportCode = ticketService.findDepartureAirport(principal.getId());
    	
    	// 주차 요금 api
    	ParkingFeeResponseDTO list = airportService.getParkingFeeAPI(departureAirportCode);
        List<Item> parkingList = list.getResponse().getBody().getItems().getItem();
        model.addAttribute("list", parkingList);
        
        // 인청공항 주차정보 api
        ParkingStatusResponse parkingStatusResponse = airportService.getParkingAreaInfoAPI();
        model.addAttribute("parkingStatusResponse", parkingStatusResponse);
        //  ------------- 한국 공항

        //	한국 공항 혼잡도 api
        AirportTravelTimeDTO airportTravelTimes = airportService.koAirportTime(principal.getId());
        
        List<AirportTravelTimeDTO.Item> airportItems = airportTravelTimes.getItems();
        
        //도착지 공항
        String airPortName = " ";
        for (AirportTravelTimeDTO.Item airportItem : airportItems) {
            airPortName = airportItem.getArp();
            if (airportItem.getArp().equals("GMP")) {
                airPortName = "김포공항";
            }
            if (airportItem.getArp().equals("CJU")) {
                airPortName = "제주공항";
            }
            if (airportItem.getArp().equals("PUS")) {
                airPortName = "김해공항";
            }
        }

        int totalPct = 0;
        String nowTime = DateFormat.formatTime();

        for (AirportTravelTimeDTO.Item airportItem : airportItems) {
            String hh = airportItem.getHh(); // 시간대
            int pct = airportItem.getPct();  // 각 시간대의 총 승객 수

            if (nowTime.equals(hh)) {
                totalPct += pct;  // 총 승객 수
            }
            System.out.println("시간대: " + hh + ", 총 승객수: " + pct);
        }

        int onePersonTime = totalPct / 60;

        System.out.println(onePersonTime + "총 소요시간");
        model.addAttribute("airportItems", airportItems);
        model.addAttribute("onePersonTime", onePersonTime);
        model.addAttribute("airPortName", airPortName);
        
        // 전국공항 주차정보 api
        String airportCode = "";
        for (AirportTravelTimeDTO.Item airportItem : airportItems) {
            airportCode = airportItem.getArp();
            if (airportItem.getArp().equals("GMP")) {
                airportCode = "GMP";
            }
            if (airportItem.getArp().equals("CJU")) {
                airportCode = "CJU";
            }
            if (airportItem.getArp().equals("PUS")) {
                airportCode = "PUS";
            }
            System.out.println(airportCode + "도착지 공항코드");
        }

        ParkingStatusResponse2 parkingStatusResponse2 = airportService.getParkingAreaInfoAPI2(airportCode);
        model.addAttribute("parkingStatusResponse2", parkingStatusResponse2);
        return "airport/airportInfo";
    }  
}
