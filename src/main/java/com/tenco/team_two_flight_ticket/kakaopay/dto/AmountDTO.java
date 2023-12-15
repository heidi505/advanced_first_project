package com.tenco.team_two_flight_ticket.kakaopay.dto;

import lombok.Data;

@Data
public class AmountDTO {

    private Integer total;
    private Integer tax_free;
    private Integer vat;
    private Integer point;
    private Integer discount;
}