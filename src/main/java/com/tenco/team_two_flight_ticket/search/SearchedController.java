package com.tenco.team_two_flight_ticket.search;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class SearchedController {
	
	@Autowired
	private SearchedService searchedService;
	
	@ResponseBody
	@PostMapping("/searched/delete-search-log")
	public void deleteSearchLog(@RequestBody DeleteSearchLogDTO dto) {
		searchedService.deleteSearchLog(dto);
	}
	
}
