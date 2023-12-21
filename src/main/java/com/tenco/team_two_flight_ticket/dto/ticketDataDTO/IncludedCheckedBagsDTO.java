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
    //무료 수화물 갯수
    private Integer quantity;
    //무료 수화물 허용 무게
    private Integer weight;
    //무료 수화물 무게 단위(kg)
    private String weightUnit;

    public String choose(){
        if (this.weight==null){
            return this.quantity + "개";
        }
        return this.weight + "KG";
    }
}