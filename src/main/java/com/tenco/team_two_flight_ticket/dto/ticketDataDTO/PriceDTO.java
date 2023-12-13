package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.FeesDTO;
import com.tenco.team_two_flight_ticket.dto.ticketDataDTO.TaxesDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.text.DecimalFormat;
import java.util.List;

@Data
@ToString
@NoArgsConstructor
public class PriceDTO {
    //택스 포함
    private String grandTotal;
    //택스 미포함
    private String base;
    private List<FeesDTO> fees;
    private List<TaxesDTO> taxes;

    public PriceDTO(PriceDTO dto) {

        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        this.grandTotal = decimalFormat.format(Double.parseDouble(dto.getGrandTotal())) + "원";
        this.base = decimalFormat.format(Double.parseDouble(dto.getBase()));
        this.fees = dto.getFees();
        this.taxes = dto.getTaxes();
    }
}
