package com.tenco.team_two_flight_ticket.ticket;

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
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import java.net.URISyntaxException;
import java.util.List;
import java.util.stream.Collectors;

@RequestMapping("/ticket")
@Controller
public class TicketController {

    @Autowired
    private TicketService ticketService;

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
        int isRound = dto.stream().map(e->e.getItineraries()).toList().size();

        model.addAttribute("ticket", dto.get(0));
        model.addAttribute("isRound", isRound);

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




}
