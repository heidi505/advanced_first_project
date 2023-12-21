package com.tenco.team_two_flight_ticket.ticket;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.DataDTO;
import com.tenco.team_two_flight_ticket.dto.ticketMetaDTO.MetaDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

public class TicketResponse {



    @Data
    @ToString
    @NoArgsConstructor
    public static class FlightSearchDTO{
		//검색 후 나온 총 항공권 갯수
        private MetaDTO meta;
		//검색 후 나온 항공권들의 정보가 담겨있음. 즉 리스트의 요소 1개가 하나의 항공권
        private List<DataDTO> data;

        public FlightSearchDTO(FlightSearchDTO dto) {
            this.meta = dto.getMeta();
            this.data = dto.getData().stream()
                    .map(e->new DataDTO(e))
                    .collect(Collectors.toList());
        }
    }


    //airline
    //time
    //nonstop
    //arrival departure time/date
    //소요시간
    //totalprice(자세한 요금)
    //bookableseats
    //seattype / baggageallowance
    
    @Data
	public static class GetTicketDateDTO{
		private Timestamp departureTime;
		private String departureCity;
		private String arrivalCity;
		private Long reservationNum;
		
		String cuttedDepartureTime;
		private Boolean alertCheck;
		

		void timeCheck() {
			LocalDateTime targetDateTime = departureTime.toLocalDateTime();
	        LocalDateTime currentDateTime = LocalDateTime.now();

	        // 두 LocalDateTime 간의 차이를 일수로 계산하여 1일(하루) 이내 여부 확인
	        long daysDifference = Math.abs(targetDateTime.atZone(ZoneId.systemDefault()).toLocalDate().toEpochDay()
	                - currentDateTime.atZone(ZoneId.systemDefault()).toLocalDate().toEpochDay());

	        this.alertCheck =  daysDifference <= 1;
		}
		
		void cutDepartureTime() {
				Date date = new Date(departureTime.getTime());
				SimpleDateFormat sdf = new SimpleDateFormat("MM-dd ( E ) HH:mm",Locale.KOREA);
				this.cuttedDepartureTime =  sdf.format(date);
		}
	}
    


}
