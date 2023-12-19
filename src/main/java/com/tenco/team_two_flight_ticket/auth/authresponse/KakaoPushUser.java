package com.tenco.team_two_flight_ticket.auth.authresponse;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class KakaoPushUser {
	private List<PushUser> list;
	private Long uuid;
	private String deviceId;
	private String pushType;
	private String pushToken;
	private LocalDateTime createAt;
	private LocalDateTime updateAt;	
	
	
	@Data
	@AllArgsConstructor
	@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
	public static class PushUser{
		private Long uuid;
		private String deviceId;
		private String pushType;
		private String pushToken;
		private LocalDateTime createAt;
		private LocalDateTime updateAt;	
	}
}
