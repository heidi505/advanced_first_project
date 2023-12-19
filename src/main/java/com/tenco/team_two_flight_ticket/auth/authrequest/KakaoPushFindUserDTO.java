package com.tenco.team_two_flight_ticket.auth.authrequest;

import java.util.List;

import lombok.Data;

@Data
public class KakaoPushFindUserDTO {
	private List<String> uuids;
}
