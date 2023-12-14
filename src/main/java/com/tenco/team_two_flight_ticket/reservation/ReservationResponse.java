package com.tenco.team_two_flight_ticket.reservation;

import java.sql.Timestamp;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import com.tenco.team_two_flight_ticket._core.utils.DateFormat;
import com.tenco.team_two_flight_ticket._middle._entity.enums.PassengerTypeEnum;
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
		private String resName;
		private String firstName;
		private String lastName;
		private String phoneNum; 
		private String airline;      
		private String departureCity; 
		private String arrivalCity;   
		private Timestamp departureTime;  
		private Timestamp arrivalTime;  
		private SeatTypeEnum seatType;
		private Boolean isOneWay;
		private String realName;
		// 편집한 값들
		private String departureDate;
		private String arrivalDate;
		private String cuttedPaymentDeadline;
		private String phoneNumber;
		
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
		  String fNum = phoneNum.substring(0,3);
		  String mNum = phoneNum.substring(3,7);
		  String lNum = phoneNum.substring(7);
		  String fullNumber = fNum + "-" + mNum + "-" + lNum;
		  this.phoneNumber = fullNumber;
		}
		
	}
	
	@Data
	public static class GetPayedInfoDTO{
		private String firstName;
		private String lastName;
		private PassengerTypeEnum passengerType;
		private String gender;
		private DateFormat birthdate;
		private Long airFare;
		private Long fuelSurcharge;
		private Long taxes;
		private Long ticketingFee;
		private Long totalPrice;
		private Boolean isPayed;
		
		private String sAirFare;
		private String sFuelSurcharge;
		private String sTaxes;
		private String sTicketingFee;
		private String sTotalPrice;
		
		String changeFormat(Long price) {
			NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.getDefault());
			String formattedNumber = numberFormat.format(price);
			return formattedNumber;
		}
		void changePrice() {
			 this.sAirFare = changeFormat(this.airFare);
			 this.sFuelSurcharge = changeFormat(this.fuelSurcharge);
			 this.sTaxes = changeFormat(this.taxes);
			 this.sTicketingFee = changeFormat(this.ticketingFee);
			 this.sTotalPrice = changeFormat(this.totalPrice);
		}
	}
	

}
