package com.tenco.team_two_flight_ticket.reservation;

<<<<<<< HEAD

=======
>>>>>>> 0244cd24ea1af2862743aea431a140122ee8a5fc
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
