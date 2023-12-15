package com.tenco.team_two_flight_ticket.auth.authresponse;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PushAlertFail {
	private String userId;
	private String pushToken;
	private Long date;
	private String newPushToken;
}
