package com.tenco.team_two_flight_ticket.ticket;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Locale;

import lombok.Data;

public class TicketResponse {
	
	@Data
	public static class GetTicketDateDTO{
		private Timestamp departureTime;
		private String departureCity;
		private String arrivalCity;
		private Long reservationNum;
		
		String cuttedDepartureTime;
		private Boolean alertCheck;
		
		
		void timeCheck() {
			LocalDateTime targetDateTime = departureTime.toLocalDateTime();
	        LocalDateTime currentDateTime = LocalDateTime.now();

	        // 두 LocalDateTime 간의 차이를 일수로 계산하여 1일(하루) 이내 여부 확인
	        long daysDifference = Math.abs(targetDateTime.atZone(ZoneId.systemDefault()).toLocalDate().toEpochDay()
	                - currentDateTime.atZone(ZoneId.systemDefault()).toLocalDate().toEpochDay());

	        this.alertCheck =  daysDifference <= 1;
		}
		
		void cutDepartureTime() {
				Date date = new Date(departureTime.getTime());
				SimpleDateFormat sdf = new SimpleDateFormat("MM-dd ( E ) HH:mm",Locale.KOREA);
				this.cuttedDepartureTime =  sdf.format(date);
				System.out.println(cuttedDepartureTime);
		}
		
		
	}
	
	
}
