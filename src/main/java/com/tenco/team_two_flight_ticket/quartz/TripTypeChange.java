package com.tenco.team_two_flight_ticket.quartz;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import com.tenco.team_two_flight_ticket.reservation.ReservationService;

public class TripTypeChange implements Job {
	// 내 여행 목록의 statusEnum을 변경
	@Autowired
	private ReservationService reservationService;
	
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		// 현재 날짜에서 출발일이 지난 모든 예약('예정' 상태를)을 '지난'으로 변경
			reservationService.setLastTrip();
			reservationService.setCancelTrip();	
	}

}
