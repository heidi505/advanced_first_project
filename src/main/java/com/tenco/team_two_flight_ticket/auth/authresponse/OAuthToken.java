package com.tenco.team_two_flight_ticket.auth.authresponse;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Data;
@Data
// JSON 형식에 코딩 컨벤션의 스네이크 케이스를 자바 카멜 노테이션으로 변환처리
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
//이렇게 하면 access_token 을 accessToken으로 바꿔준다
public class OAuthToken {
	private String access_token;
	private String token_type;
	private String refresh_token;
	private String expires_in;
	private String scope;
	private String refresh_token_expires_in;
}
