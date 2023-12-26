package com.tenco.team_two_flight_ticket.airport.parkingFee;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class ParkingFeeResponseDTO {
	private Response response;
	
	@Data
	public static class Response{
		private Header header;
		private Body   body;
		
		@Data
		public static class Header{
			private String resultCode;
			private String resultMsg;
		}
		
		@Data
		public static class Body{
			private Items items;
			
			@Data
			public static class Items{
				private List<Item> item;
				
				@Data
				public static class Item{
					private int parkingBasicAccount;
					private int parkingBasicAccountd;
					private int parkingBasicM;
					private int parkingBasicMd;
					private int parkingCalTimeM;
					private int parkingCalTimeMd;
					private int parkingFreeM;
					private int parkingFreeMd;
					private int parkingHoliBasicAccount;
					private int parkingHoliBasicAccountd;
					private int parkingHoliBasicM;
					private int parkingHoliBasicMd;
					private int parkingHoliFreeM;
					private int parkingHoliFreeMd;
					private int parkingHoliMaxAccount;
					private int parkingHoliMaxAccountd;
					private int parkingHoliMinuteAccount;
					private int parkingHoliMinuteAccountd;
					private int parkingHoliMinuteM;
					private int parkingHoliMinuteMd;
					private int parkingMaxAccount;
					private int parkingMaxAccountd;
					private int parkingMinuteAccount;
					private int parkingMinuteAccountd;
					private int parkingMinuteM;
					private int parkingMinuteMd;
					private String parkingParkingName;
					private String siteName;
				}
				
			}
		}
		
	}
	
	
	
	

}
