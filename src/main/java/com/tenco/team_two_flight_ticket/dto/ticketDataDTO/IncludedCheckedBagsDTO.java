package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class IncludedCheckedBagsDTO {
    private Integer quantity;
    private Integer weight;
    private String weightUnit;

    public String choose(){
        if (this.weight==null){
            return this.quantity + "개";
        }
        return this.weight + "KG";
    }
}