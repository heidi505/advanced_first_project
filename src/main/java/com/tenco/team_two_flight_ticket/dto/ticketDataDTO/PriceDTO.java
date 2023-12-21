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
    //택스 포함 가격
    private String grandTotal;
    //택스 미포함 항공요금
    private String base;
    //유류할증료
    private String oilPrice;
    private String tax;
    private String fee;
    //총 인원 수 필요해서 제가 만든 항목 - DTO에는 없음
    private int peopleCount;


    //가격에서 소수점 떼고 천단위로 콤마 붙이려고 만든 생성자
    public PriceDTO(PriceDTO dto) {

        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        this.grandTotal = decimalFormat.format(Double.parseDouble(dto.getGrandTotal()));
        this.base = decimalFormat.format(Double.parseDouble(dto.getBase()));
        this.oilPrice = decimalFormat.format(((Double.parseDouble(dto.getGrandTotal()) - Double.parseDouble(dto.getBase())) * 0.7));
        this.tax = decimalFormat.format(((Double.parseDouble(dto.getGrandTotal()) - Double.parseDouble(dto.getBase())) * 0.2));
        this.fee = decimalFormat.format(((Double.parseDouble(dto.getGrandTotal()) - Double.parseDouble(dto.getBase())) * 0.1));
    }
}
