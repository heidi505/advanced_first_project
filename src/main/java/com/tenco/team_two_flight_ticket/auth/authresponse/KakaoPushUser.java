package com.tenco.team_two_flight_ticket.auth.authresponse;

import java.time.LocalDateTime;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class KakaoPushUser {
	private String uuid;
	private String deviceId;
	private String pushType;
	private String pushToken;
	private LocalDateTime createAt;
	private LocalDateTime updateAt;	
}
