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
    private String oilPrice;
    private String tax;
    private String fee;
    private int peopleCount;


    public PriceDTO(PriceDTO dto) {

        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        this.grandTotal = decimalFormat.format(Double.parseDouble(dto.getGrandTotal()));
        this.base = decimalFormat.format(Double.parseDouble(dto.getBase()));
        this.oilPrice = decimalFormat.format(((Double.parseDouble(dto.getGrandTotal()) - Double.parseDouble(dto.getBase())) * 0.7));
        this.tax = decimalFormat.format(((Double.parseDouble(dto.getGrandTotal()) - Double.parseDouble(dto.getBase())) * 0.2));
        this.fee = decimalFormat.format(((Double.parseDouble(dto.getGrandTotal()) - Double.parseDouble(dto.getBase())) * 0.1));
    }
}
