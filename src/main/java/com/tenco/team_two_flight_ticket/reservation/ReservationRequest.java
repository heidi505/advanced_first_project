package com.tenco.team_two_flight_ticket.reservation;

import java.util.List;

import lombok.Data;

public class ReservationRequest {

    @Data
    public static class SaveFormDto{
        private String resName;
        private String email;
        private String phoneNum;
        private String firstName;
        private String lastName;
        private String gender;
        private String birthDate;
        private String reservationNum;
        private Long reservationPrice;
    }
    
    @Data
	public static class CancelReservationDTO{
		private List<Integer> numList;
	}
    

}