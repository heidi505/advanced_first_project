package com.tenco.team_two_flight_ticket.search;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import com.tenco.team_two_flight_ticket._middle._entity.enums.PassengerTypeEnum;
import com.tenco.team_two_flight_ticket._middle._entity.enums.SeatTypeEnum;

import lombok.Data;

public class SearchedResponse {

	@Data
	public static class GetRecentSearchDTO{
		private int id;
	    private int userId;
	    private String keyword;
	    private boolean isOneWay;
	    private String departureCity;
	    private String arrivalCity;
	    private Timestamp departureDate;
	    private Timestamp arrivalDate;
	    private int passengerAmount;
	    private Long price;
	    private Timestamp createdAt;
	    private String koreanDepartureCity;
	    private String koreanArrivalCity;
	    private SeatTypeEnum seatType;
	    private PassengerTypeEnum passengerType;
	    
	    private String departureTime;
	    private String arrivalTime;
	    private String oneWayBoolean;
	    
	    void cutDate() {
	    	Date date = new Date(departureDate.getTime());
	    	SimpleDateFormat sdf = new SimpleDateFormat("MM월 dd일",Locale.KOREA);
	    	this.departureTime =  sdf.format(date);
	    	Date date2 = new Date(arrivalDate.getTime());
	    	this.arrivalTime =  sdf.format(date2);
		}
	    
	    // 임시 조치
	    void stringIsOneWay() {
	    	this.oneWayBoolean = String.valueOf(this.isOneWay);
	    }
	    
	}
	
}
