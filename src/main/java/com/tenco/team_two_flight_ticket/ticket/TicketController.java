package com.tenco.team_two_flight_ticket.ticket;


import java.net.URISyntaxException;
import java.util.List;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.utils.ApiUtils;
import com.tenco.team_two_flight_ticket._core.utils.Define;
import com.tenco.team_two_flight_ticket._middle._entity.City;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DataDTO;
import com.tenco.team_two_flight_ticket.search.SearchedService;
import com.tenco.team_two_flight_ticket.user.User;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/ticket")
@Controller
public class TicketController {

    @Autowired
    private TicketService ticketService;
    @Autowired
    private HttpSession session;
    @Autowired
    private SearchedService searchedService;

    @PostMapping("/flight-search/option/{isRound}")
    public String optionSearch(@PathVariable int isRound, TicketRequest.OptionDTO optionDTO, TicketRequest.TicketSearchDTO reqDto, Model model){


        String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
        String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};

        for (int i = 0; i < regions.length; i++) {
            model.addAttribute(values[i],ticketService.getCities(regions[i]));
        }


        TicketRequest.TicketSearchDTO newReqDto = ticketService.parsingReq(reqDto);
        model.addAttribute("req", newReqDto);

        if (isRound == 1){
            TicketResponse.FlightSearchDTO respDTO = ticketService.onewayOptionSearch(optionDTO);
            model.addAttribute("count", respDTO.getMeta().getCount());

            List<DataDTO> dataDTOList = respDTO.getData();
            model.addAttribute("ticketList", dataDTOList);

            if (dataDTOList.isEmpty() || dataDTOList.size() == 0){
                throw new MyBadRequestException("해당하는 항공권이 없습니다");
            }

            model.addAttribute("isRound", isRound);

            return "flightTicket/flightSearch";

        }

       TicketResponse.FlightSearchDTO roundRespDTO = ticketService.optionSearch(optionDTO);
        model.addAttribute("count", roundRespDTO.getMeta().getCount());

        List<DataDTO> dataDTOList = roundRespDTO.getData();
        model.addAttribute("ticketList", dataDTOList);

        if (dataDTOList.isEmpty() || dataDTOList.size() == 0){
            throw new MyBadRequestException("해당하는 항공권이 없습니다");
        }

        model.addAttribute("isRound", isRound);

        return "flightTicket/flightSearch";

    }
    @GetMapping("/preview/{ticketId}")
    public String preview(@PathVariable int ticketId, Model model){

        List<DataDTO> dto = ticketService.ticketDetail(ticketId);
        int isRound = dto.get(0).getItineraries().size();

        model.addAttribute("ticket", dto.get(0));
        model.addAttribute("isRound", isRound);
        System.out.println("뭐 담겼징");
        System.out.println(isRound);
        System.out.println(dto.get(0).roundTrip());
        System.out.println("여긴가12");
        return "/reservation/preview";
    }


    @PostMapping("/flight-search")
    public String flightSearchProc(@Valid TicketRequest.TicketSearchDTO dto, Model model, Errors errors) throws URISyntaxException {

        String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
        String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};

        for (int i = 0; i < regions.length; i++) {
            model.addAttribute(values[i],ticketService.getCities(regions[i]));
        }

        TicketRequest.TicketSearchDTO newReqDto = ticketService.parsingReq(dto);
        model.addAttribute("req", newReqDto);
        
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        if(principal != null) {
        	searchedService.saveRecentSearch(principal.getId() ,dto);       	
        }


        TicketResponse.FlightSearchDTO responseBody = ticketService.getTickets(dto);
        model.addAttribute("count", responseBody.getMeta().getCount());

        List<DataDTO> dataDTOList = responseBody.getData();
        model.addAttribute("ticketList", dataDTOList);
        for (DataDTO dataDTO : dataDTOList) {
            System.out.println("디티오아디");
            System.out.println("Ticket: " + dataDTO.getId());
            System.out.println("이티너리스");
            System.out.println("Ticket: " + dataDTO.getItineraries());
            System.out.println("타입");
            System.out.println("Ticket: " + dataDTO.getType());
            System.out.println("프라이스카운트");
            System.out.println("Ticket: " + dataDTO.getPrice().getPeopleCount());
            System.out.println("트레벌프라이싱");
            System.out.println("Ticket: " + dataDTO.getTravelerPricings());
            System.out.println("북에이블싯");
            System.out.println("Ticket: " + dataDTO.getNumberOfBookableSeats());

            // 추가 필드가 있다면 이와 같이 계속 출력합니다.
        }

        if (dataDTOList.isEmpty() || dataDTOList.size() == 0){
            throw new MyBadRequestException("해당하는 항공권이 없습니다");
        }

        int isRound = dataDTOList.get(0).getItineraries().size();
        model.addAttribute("isRound", isRound);
        System.out.println("여긴가123");
        return "flightTicket/flightSearch";
    }
    /**
     * 
     * @param dto
     * @param model
     * @return
     * @throws URISyntaxException
     */    
    @GetMapping("/flight-recent-search")
    public String flightRecentSearchProc(@Valid TicketRequest.TicketSearchDTO dto, Model model) throws URISyntaxException {
    	String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
    	String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};
    	
    	for (int i = 0; i < regions.length; i++) {
    		model.addAttribute(values[i],ticketService.getCities(regions[i]));
    	}
    	TicketRequest.TicketSearchDTO newReqDto = ticketService.parsingReq(dto);
        model.addAttribute("req", newReqDto);
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
    
    // 간편 항공권 검색
    /**
     * 
     * @param dto
     * @param model
     * @return
     * @throws URISyntaxException
     */
    @GetMapping("/flight-light-search")
    public String flightLightSearchProc(@Valid TicketRequest.TicketLightSearchDTO dto, Model model) throws URISyntaxException {
    	String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
    	String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};
    	
    	for (int i = 0; i < regions.length; i++) {
    		model.addAttribute(values[i],ticketService.getCities(regions[i]));
    	}
    	
    	// 검색어를 도착지로 하고 나머지는 랜덤으로 작성
    	TicketRequest.TicketSearchDTO searchDto = ticketService.getSearchDTO(dto);

        TicketRequest.TicketSearchDTO newReqDto = ticketService.parsingReq(searchDto);
        model.addAttribute("req", newReqDto);



        // 티켓 검색
    	TicketResponse.FlightSearchDTO responseBody = ticketService.getTickets(searchDto);


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

    @GetMapping("/test-search")
    public String testSearch(@Valid TicketRequest.TicketLightSearchDTO dto, Model model) throws URISyntaxException  {
    	// 검색어에 해당하는 도시나 나라 이름을 DB에서 검색해 해당하는 곳을 도착지로 선정하고 나머지는 랜덤으로 작성
    	TicketRequest.TicketSearchDTO searchDto = ticketService.getSearchDTO(dto);

    	return "flightTicket/flightSearch";
    }
    @GetMapping("/cities-list")
    public ResponseEntity<ApiUtils.ApiResult<List<City>>> citiesList(@RequestParam(defaultValue = "대한민국") String region){
        List<City> cities = ticketService.getCities(region);
        return ResponseEntity.ok().body(ApiUtils.success(cities));
    }

    @PostMapping("/tmk")
    public String flightSearchProc2(@Valid TicketRequest.TicketSearchDTO dto, Model model) throws URISyntaxException {
        String[] regions = {"대한민국","일본", "아시아", "미주", "유럽", "대양주/괌", "중동", "중남미", "아프리카", "중국"};
        String[] values = {"korea","japan" ,"asia","america","europe","oceania","middleEast","southAmerica","africa","china"};

        for (int i = 0; i < regions.length; i++) {
            model.addAttribute(values[i],ticketService.getCities(regions[i]));
        }

        TicketResponse.FlightSearchDTO responseBody = ticketService.getTickets(dto);
        model.addAttribute("count", responseBody.getMeta().getCount());

        List<DataDTO> dataDTOList = responseBody.getData();
        model.addAttribute("ticketList", dataDTOList);

        int isRound = dataDTOList.get(0).getItineraries().size();
        model.addAttribute("isRound", isRound);



        return "flightTicket/flightSearch";
    }

    @GetMapping("/tmk")
    public String tmk(){
        return "flightTicket/test";
    }

    /**
     * 
     * @param dto
     * @return cities
     */
    @ResponseBody
    @GetMapping("/search-city")
    public List<City> searchCity(@Valid TicketRequest.SearchCityDTO dto){
    	List<City> cities = ticketService.getCitiesFromKeyword(dto);
    	return cities;
    }

}
