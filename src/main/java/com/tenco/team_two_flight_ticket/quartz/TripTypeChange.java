package com.tenco.team_two_flight_ticket.quartz;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyServerError;
import com.tenco.team_two_flight_ticket.reservation.ReservationRepository;

public class TripTypeChange implements Job {
	// 내 여행 목록의 statusEnum을 변경
	@Autowired
	private ReservationRepository reservationRepository;
	
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		// 현재 날짜 보다 전의 모든 예약(예정 상태를)을 지난으로 변경
		try {
			reservationRepository.setLastTrip();
			System.out.println("여행 상태 변경 완료");
		} catch (Exception e) {
			throw new MyServerError("서버 에러가 발생했습니다");
		}
		
	}

}
