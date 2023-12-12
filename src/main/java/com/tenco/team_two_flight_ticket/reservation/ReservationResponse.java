package com.tenco.team_two_flight_ticket.reservation;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import com.tenco.team_two_flight_ticket._middle._entity.enums.SeatTypeEnum;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;

import lombok.Data;

public class ReservationResponse {
	
	@Data
	public static class GetMyTripDetailDTO{
		private Long reservationNum;  
		private Boolean isPayed;
		private StatusEnum statusEnum;
		private Timestamp paymentDeadline;
		private String firstName;
		private String lastName;
		private String phoneNumber; 
		private String airline;      
		private String departureCity; 
		private String arrivalCity;   
		private Timestamp departureTime;  
		private Timestamp arrivalTime;  
		private SeatTypeEnum seatType;
		private Boolean isOneWay;
		// 편집한 값들
		private String departureDate;
		private String arrivalDate;
		private String cuttedPaymentDeadline;
		private String phoneNum;
		
		void cutDepartureDate() {
			Date date = new Date(departureTime.getTime());
	        SimpleDateFormat sdf = new SimpleDateFormat("MM.dd ( E )",Locale.KOREA);
	        System.out.println(sdf.format(date));
	        this.departureDate =  sdf.format(date);
		}
		void cutArrivalDate() {
			Date date = new Date(arrivalTime.getTime());
	        SimpleDateFormat sdf = new SimpleDateFormat("MM.dd ( E )",Locale.KOREA);
	        System.out.println(sdf.format(date));
	        this.arrivalDate =  sdf.format(date);
		}
		void cutPaymentDeadline() {
			Date date = new Date(paymentDeadline.getTime());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) HH:mm",Locale.KOREA);
			System.out.println(sdf.format(date));
			this.cuttedPaymentDeadline =  sdf.format(date);
		}
		void makePhoneNumber() {
		  String fNum = phoneNumber.substring(0,3);
		  String mNum = phoneNumber.substring(3,7);
		  String lNum = phoneNumber.substring(7);
		  String fullNumber = fNum + "-" + mNum + "-" + lNum;
		  this.phoneNum = fullNumber;
		}
		
	}

}
