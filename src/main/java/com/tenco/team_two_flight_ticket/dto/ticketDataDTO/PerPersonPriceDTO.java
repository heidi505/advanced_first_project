package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.*;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PerPersonPriceDTO {
    private String total;
    //택스 미포함
    private String base;
    private String oilPrice;
    private String tax;
    private String fee;

    public PerPersonPriceDTO(PerPersonPriceDTO dto) {
        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        this.total = decimalFormat.format(Double.parseDouble(dto.getTotal()));
        this.base = decimalFormat.format(Double.parseDouble(dto.getBase()));
        this.oilPrice = decimalFormat.format(((Double.parseDouble(dto.getTotal()) - Double.parseDouble(dto.getBase())) * 0.7));
        this.tax = decimalFormat.format(((Double.parseDouble(dto.getTotal()) - Double.parseDouble(dto.getBase())) * 0.2));
        this.fee = decimalFormat.format(((Double.parseDouble(dto.getTotal()) - Double.parseDouble(dto.getBase())) * 0.1));
    }

}
