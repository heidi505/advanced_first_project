package com.tenco.team_two_flight_ticket.search;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

public class SearchedResponse {

	@Data
	public static class GetRecentSearchDTO{
		private int id;
		private int userId;
		private boolean isOneWay;
		private String departureCity;
		private String arrivalCity;
		private String startDate;
		private String endDate;
		private String travelClass;
		private int adults;
		private int children;
		private int infants;
	    
	    private String departureTime;
	    private String arrivalTime;
	    private String oneWayBoolean;
	    
	    private String koreanDepartureCity;
	    private String koreanArrivalCity;
	    
	    void cutDate() {
	    	LocalDate date = LocalDate.parse(startDate);
	    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM월 dd일", Locale.KOREA);
	    	this.departureTime =  formatter.format(date);
	    	if(endDate != null) {
	    		LocalDate date2 = LocalDate.parse(endDate);
	    		this.arrivalTime =  formatter.format(date2);
	    	}
		}
	    
	    void stringIsOneWay() {
	    	this.oneWayBoolean = String.valueOf(this.isOneWay);
	    }
	    
	}
	
	@Data
    public static class SearchCityDTO{
    	@NotEmpty
    	private String keyword;
    }
	
	
	
}
