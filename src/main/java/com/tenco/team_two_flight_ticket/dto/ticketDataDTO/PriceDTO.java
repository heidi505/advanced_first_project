package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.FeesDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.TaxesDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PriceDTO {
    //택스 포함
    private String grandTotal;
    //택스 미포함
    private String base;
    private List<FeesDTO> fees;
    private List<TaxesDTO> taxes;

}
