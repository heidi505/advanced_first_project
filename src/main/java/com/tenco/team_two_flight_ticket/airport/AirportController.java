package com.tenco.team_two_flight_ticket.airport;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

import com.tenco.team_two_flight_ticket._core.utils.DateFormat;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket.airport.airportTravelTime.AirportTravelTimeDTO;
import com.tenco.team_two_flight_ticket.airport.parkingspace.ParkingStatusResponse;
import com.tenco.team_two_flight_ticket.airport.parkingspace.ParkingStatusResponse2;
import com.tenco.team_two_flight_ticket.user.User;
import com.tenco.team_two_flight_ticket.user.UserRepository;
import com.tenco.team_two_flight_ticket.user.UserRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

@RequestMapping("/airport")
@Controller
public class AirportController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private HttpSession session;

    @Autowired
    private AirPortService airPortService;

    public static final String SERVICEKEY = Define.SERVICEKEY;

    @Autowired
    private AirPortService airportService;

    // http://localhost:8080/airport/airport-info
    // 인천공항 주차정보 api
    // 주차요금 api
    // 탑승 수속 대기시간 api x
    @GetMapping("/airport-info")
    public String parkingArea(Model model) {
    	
    	
        // 주차요금 api
        URI uri = null;
        String url = "http://openapi.airport.co.kr/service/rest/AirportParkingFee/parkingfee?serviceKey=rrf%2Bmnq9ofBCLMm6ehZUvWu%2FZljoJtXJZKSVOIkz61hIbsnmpY3s3aeMuC3VfTlt9MVM8aSL1J3M%2Bzm3ad2%2BXg%3D%3D&schAirportCode=GMP&type=json";
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
        model.addAttribute("list", response.getBody());
        System.out.println(response.getBody());

        // 인청공항 주차정보 api
        ParkingStatusResponse parkingStatusResponse = airportService.getParkingAreaInfoAPI();
        // Model에 DTO를 추가하여 JSP로 전달
        model.addAttribute("parkingStatusResponse", parkingStatusResponse);

//        ------------- 한국 공항

        //		한국 공항
        User principal = (User) session.getAttribute(Define.PRINCIPAL);

        AirportTravelTimeDTO airportTravelTimes = airPortService.koAirportTime(1);

        List<AirportTravelTimeDTO.Item> airportItems = airportTravelTimes.getItems();

        String airPortName = "";
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
            System.out.println(airPortName + "도착지 공항");
        }
        System.out.println(airPortName);

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
        System.out.println(airportCode);
        ParkingStatusResponse2 parkingStatusResponse2 = airportService.getParkingAreaInfoAPI2(airportCode);
        model.addAttribute("parkingStatusResponse2", parkingStatusResponse2);
        return "airport/airportInfo";
    }

    @GetMapping("/asdtest")
    public String asdtese(Model model) {

//        ------------- 한국 공항

        //		한국 공항
        User principal = (User) session.getAttribute(Define.PRINCIPAL);

        AirportTravelTimeDTO airportTravelTimes = airPortService.koAirportTime(1);

        List<AirportTravelTimeDTO.Item> airportItems = airportTravelTimes.getItems();

        String airPortName = "";
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
            System.out.println(airPortName + "도착지 공항");
        }
        System.out.println(airPortName);

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
        System.out.println(airportCode);
        ParkingStatusResponse2 parkingStatusResponse2 = airportService.getParkingAreaInfoAPI2(airportCode);
        model.addAttribute("parkingStatusResponse2", parkingStatusResponse2);
        return "airport/asdtest";
    }
}
