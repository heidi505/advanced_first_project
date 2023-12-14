package com.tenco.team_two_flight_ticket.reservation;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Locale;

import com.tenco.team_two_flight_ticket._core.utils.DateFormat;
import com.tenco.team_two_flight_ticket._middle._entity.enums.PassengerTypeEnum;
import com.tenco.team_two_flight_ticket._middle._entity.enums.SeatTypeEnum;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;

import lombok.Data;

public class ReservationResponse {

	@Data
	public static class ReservationPaymentDTO {
		private String username;
		private Long reservationNum;
		private int passengerAmount;
		private Long taxes;
		private Long couponDiscountingPrice;
		private String passengerFirstName;
		private String passengerLastName;
		private Long totalPrice;
		@CreationTimestamp
		private Timestamp departureTime;

		public String departureTime() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = sdf.format(new Date(this.departureTime.getTime()));
			return formattedDate;
		};
	}
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
	        this.departureDate =  sdf.format(date);
		}
		void cutArrivalDate() {
			Date date = new Date(arrivalTime.getTime());
	        SimpleDateFormat sdf = new SimpleDateFormat("MM.dd ( E )",Locale.KOREA);
	        this.arrivalDate =  sdf.format(date);
		}
		void cutPaymentDeadline() {
			Date date = new Date(paymentDeadline.getTime());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) HH:mm",Locale.KOREA);
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
	
	@Data
	public static class GetPayedInfoDTO{
		private String firstName;
		private PassengerTypeEnum passengerTypeEnum;
		private String gender;
		private DateFormat birthdate;
		private Long airFare;
		private Long fuelSurcharge;
		private Long taxes;
		private Long ticketingFee;
		private Long totalPrice;
		private Boolean isPayed;
	}
}
