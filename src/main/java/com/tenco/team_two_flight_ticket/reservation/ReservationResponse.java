package com.tenco.team_two_flight_ticket.reservation;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
}
