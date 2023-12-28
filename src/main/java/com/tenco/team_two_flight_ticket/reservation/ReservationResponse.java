package com.tenco.team_two_flight_ticket.reservation;

import com.tenco.team_two_flight_ticket._middle._entity.Passenger;
import com.tenco.team_two_flight_ticket.ticket.Ticket;
import com.tenco.team_two_flight_ticket.user.UserResponse;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import com.tenco.team_two_flight_ticket._core.utils.DateFormat;
import com.tenco.team_two_flight_ticket._middle._entity.enums.PassengerTypeEnum;
import com.tenco.team_two_flight_ticket._middle._entity.enums.SeatTypeEnum;
import com.tenco.team_two_flight_ticket._middle._entity.enums.StatusEnum;

import lombok.Data;

public class ReservationResponse {
	
	 @Data
	 public static class GetMyTravelDTO {
		private int id;
	    private Boolean isPayed;
	    private Timestamp createdAt;
	    private Timestamp paymentDeadline;
	    private int reservationNum;
	    private StatusEnum statusEnum;
	    private String airline;
	    private String arrivalCity;
	    private String departureAirport;
	    private String departureCity;
	    private String flightName;
	    private Timestamp departureTime;
	    private Timestamp arrivalTime;
	        
	    private String koreanDepartureAirport;
	    private String koreanArrivalAirport;
	    private String koreanAirline;
	    private String koreanDepartureCity;
	 }
	 
	 
	 @Data
	 public static class GetMyTripCountDTO {
		private int allTripCount;
	    private int payedTripCount;
	    private int notPayedTripCount;
	 }
	
	

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
		private int originalPrice;

//		public String departureTime() {
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			String formattedDate = sdf.format(new Date(this.departureTime.getTime()));
//			return formattedDate;
//		};
	}
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
		
		private String departureDate;
		private String arrivalDate;
		private String cuttedPaymentDeadline;
		private String phoneNumber;
		
	    private String koreanArrivalAirport;
	    private String koreanAirline;
	    private String koreanDepartureAirport;
		
		
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
		private String birthdate;
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

	@Data
	public static class SaveResultDTO {
		private Reservation reservation;
		private List<PassengerDTO> passenger;
		private List<TicketDTO> ticket;

		public SaveResultDTO(Reservation reservations, List<Passenger> passenger, List<Ticket> ticket) {
			this.reservation = reservations;
			this.passenger = passenger.stream()
					.map(PassengerDTO::new)
					.collect(Collectors.toList());
			this.ticket = ticket.stream()
					.map(TicketDTO::new)
					.collect(Collectors.toList());
		}

		@Data
		public static class ReservationDTO {
			private Integer id;
			private StatusEnum statusEnum;

			public ReservationDTO(Reservation reservation) {
				this.id = reservation.getId();
				this.statusEnum = reservation.getStatusEnum();
			}
		}

		@Data
		public static class PassengerDTO {
			private Integer id;
			private String firstName;
			private String lastName;
			private PassengerTypeEnum passengerType;
			private String birthDate;

			public PassengerDTO(Passenger passenger) {
				this.id = passenger.getId();
				this.firstName = passenger.getFirstName();
				this.lastName = passenger.getLastName();
				this.passengerType = passenger.getPassengerType();
				this.birthDate = passenger.getBirthDate();
			}
		}

		@Data
		public static class TicketDTO {
			private Integer id;
			private Long airFare;
			private Long fuelSurcharge;
			private Long taxes;
			private Long ticketingFee;
			private Long totalPrice;

			public TicketDTO(Ticket ticket) {
				this.id = ticket.getId();
				this.airFare = ticket.getAirFare();
				this.fuelSurcharge = ticket.getFuelSurcharge();
				this.taxes = ticket.getTaxes();
				this.ticketingFee = ticket.getTicketingFee();
				this.totalPrice = ticket.getTotalPrice();
			}
		}
	}
	 @Data
	    public static class GetMyTripYearDTO{
	    	private String minYear;
	    	private String maxYear;
	    }
}
