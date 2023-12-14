package com.tenco.team_two_flight_ticket.kakaopay.dto.cancelResponse;

import lombok.Data;

@Data
public class CancelAvailableAmountDTO {
    private Integer total;
    private Integer tax_free;
    private Integer vat;
    private Integer point;
    private Integer discount;
    private Integer green_deposit;
}
