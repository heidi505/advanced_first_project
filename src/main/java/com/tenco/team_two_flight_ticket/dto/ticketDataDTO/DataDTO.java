package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Data
@ToString
@NoArgsConstructor
public class DataDTO{
    private String type;
    private String id;
    private boolean oneWay;
    private int numberOfBookableSeats;
    private List<ItinerariesDTO> itineraries;
    private PriceDTO price;
    private List<TravelerPricingDTO> travelerPricings;

    public DataDTO(DataDTO dto) {
        this.type = dto.getType();
        this.id = dto.getId();
        this.oneWay = dto.oneWay;
        this.numberOfBookableSeats = dto.getNumberOfBookableSeats();
        this.itineraries = dto.getItineraries().stream()
                .map(e->new ItinerariesDTO(e))
                .collect(Collectors.toList());
        this.price = new PriceDTO(dto.getPrice());
        this.travelerPricings = dto.getTravelerPricings().stream().map(e->new TravelerPricingDTO(e)).collect(Collectors.toList());
    }

    public Map<String, PriceDTO> newTraveler(){

        Map<String, PriceDTO> newMap = new HashMap<>();

        List<TravelerPricingDTO> adultList = this.travelerPricings.stream().filter(e->e.getTravelerType().equals("ADULT")).toList();

        PriceDTO adultDto = new PriceDTO();

        String oilSum = String.valueOf(adultList.stream().mapToLong(e->Long.parseLong(e.getPrice().getOilPrice().replace(",",""))).sum());
        String baseSum = String.valueOf(adultList.stream().mapToLong(e->Long.parseLong(e.getPrice().getBase().replace(",",""))).sum());
        String totalSum = String.valueOf(adultList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTotal().replace(",",""))).sum());
        String taxSum = String.valueOf(adultList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTax().replace(",",""))).sum());
        String feeSum = String.valueOf(adultList.stream().mapToLong(e->Long.parseLong(e.getPrice().getFee().replace(",",""))).sum());

        DecimalFormat decimalFormat = new DecimalFormat("#,###");

        adultDto.setBase(baseSum);
        adultDto.setOilPrice(oilSum);
        adultDto.setFee(feeSum);
        adultDto.setTax(taxSum);
        adultDto.setGrandTotal(totalSum);
        adultDto.setPeopleCount(adultList.size());

        newMap.put("성인", adultDto);




        List<TravelerPricingDTO> childList = this.travelerPricings.stream().filter(e->e.getTravelerType().equals("CHILD")).toList();
        List<TravelerPricingDTO> infantList = this.travelerPricings.stream().filter(e->e.getTravelerType().equals("INFANT")).toList();


        if(childList.size() != 0){
            PriceDTO childrenDto = new PriceDTO();

            oilSum = String.valueOf(childList.stream().mapToLong(e->Long.parseLong(e.getPrice().getOilPrice().replace(",",""))).sum());
            baseSum = String.valueOf(childList.stream().mapToLong(e->Long.parseLong(e.getPrice().getBase().replace(",",""))).sum());
            totalSum = String.valueOf(childList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTotal().replace(",",""))).sum());
            taxSum = String.valueOf(childList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTax().replace(",",""))).sum());
            feeSum = String.valueOf(childList.stream().mapToLong(e->Long.parseLong(e.getPrice().getFee().replace(",",""))).sum());

            childrenDto.setBase(baseSum);
            childrenDto.setOilPrice(oilSum);
            childrenDto.setFee(feeSum);
            childrenDto.setTax(taxSum);
            childrenDto.setGrandTotal(totalSum);
            childrenDto.setPeopleCount(childList.size());

            newMap.put("아동", childrenDto);

        }


        if(infantList.size() != 0){

            PriceDTO infantDto = new PriceDTO();
            oilSum = String.valueOf(infantList.stream().mapToLong(e->Long.parseLong(e.getPrice().getOilPrice().replace(",",""))).sum());
            baseSum = String.valueOf(infantList.stream().mapToLong(e->Long.parseLong(e.getPrice().getBase().replace(",",""))).sum());
            totalSum = String.valueOf(infantList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTotal().replace(",",""))).sum());
            taxSum = String.valueOf(infantList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTax().replace(",",""))).sum());
            feeSum = String.valueOf(infantList.stream().mapToLong(e->Long.parseLong(e.getPrice().getFee().replace(",",""))).sum());

            infantDto.setBase(baseSum);
            infantDto.setOilPrice(oilSum);
            infantDto.setFee(feeSum);
            infantDto.setTax(taxSum);
            infantDto.setGrandTotal(totalSum);
            infantDto.setPeopleCount(infantList.size());

            newMap.put("유아", infantDto);
        }







        return newMap;
    }

    public Map<String, ItinerariesDTO> roundTrip(){
        Map<String, ItinerariesDTO> newMap = new HashMap<>();

        ItinerariesDTO first = this.getItineraries().get(0);
        ItinerariesDTO last = this.getItineraries().get(1);

        newMap.put("가는 편", first);
        newMap.put("오는 편", last);

        return newMap;
    }
}