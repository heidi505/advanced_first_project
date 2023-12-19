package com.tenco.team_two_flight_ticket.auth.authrequest;

import java.util.List;

import lombok.Data;

@Data
public class KakaoPushMessageDTO {
	private List<String> uuids;
	private String message;
}
