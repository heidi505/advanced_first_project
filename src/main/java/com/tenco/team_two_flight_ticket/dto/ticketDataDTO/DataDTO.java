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


        List<TravelerPricingDTO> adultList = this.travelerPricings.stream().filter(e->e.getTravelerType().equals("ADULT")).toList();
        List<TravelerPricingDTO> childList = this.travelerPricings.stream().filter(e->e.getTravelerType().equals("CHILD")).toList();
        List<TravelerPricingDTO> infantList = this.travelerPricings.stream().filter(e->e.getTravelerType().equals("INFANT")).toList();

        PriceDTO adultDto = new PriceDTO();
        PriceDTO childrenDto = new PriceDTO();
        PriceDTO infantDto = new PriceDTO();

        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        String oilSum = String.valueOf(adultList.stream().mapToLong(e->Long.parseLong(e.getPrice().getOilPrice().replace(",",""))).sum());
        String baseSum = String.valueOf(adultList.stream().mapToLong(e->Long.parseLong(e.getPrice().getBase().replace(",",""))).sum());
        String totalSum = String.valueOf(adultList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTotal().replace(",",""))).sum());
        String taxSum = String.valueOf(adultList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTax().replace(",",""))).sum());
        String feeSum = String.valueOf(adultList.stream().mapToLong(e->Long.parseLong(e.getPrice().getFee().replace(",",""))).sum());

        adultDto.setBase(decimalFormat.format(baseSum));
        adultDto.setOilPrice(decimalFormat.format(oilSum));
        adultDto.setFee(decimalFormat.format(feeSum));
        adultDto.setTax(decimalFormat.format(taxSum));
        adultDto.setGrandTotal(decimalFormat.format(totalSum));
        adultDto.setPeopleCount(adultList.size());

        oilSum = String.valueOf(childList.stream().mapToLong(e->Long.parseLong(e.getPrice().getOilPrice().replace(",",""))).sum());
        baseSum = String.valueOf(childList.stream().mapToLong(e->Long.parseLong(e.getPrice().getBase().replace(",",""))).sum());
        totalSum = String.valueOf(childList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTotal().replace(",",""))).sum());
        taxSum = String.valueOf(childList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTax().replace(",",""))).sum());
        feeSum = String.valueOf(childList.stream().mapToLong(e->Long.parseLong(e.getPrice().getFee().replace(",",""))).sum());



        childrenDto.setBase(decimalFormat.format(baseSum));
        childrenDto.setOilPrice(decimalFormat.format(oilSum));
        childrenDto.setFee(decimalFormat.format(feeSum));
        childrenDto.setTax(decimalFormat.format(taxSum));
        childrenDto.setGrandTotal(decimalFormat.format(totalSum));
        childrenDto.setPeopleCount(childList.size());

        System.out.println("==================================");
        System.out.println(childrenDto.getTax());
        System.out.println(childrenDto.getPeopleCount());
        System.out.println("==================================");


        oilSum = String.valueOf(infantList.stream().mapToLong(e->Long.parseLong(e.getPrice().getOilPrice().replace(",",""))).sum());
        baseSum = String.valueOf(infantList.stream().mapToLong(e->Long.parseLong(e.getPrice().getBase().replace(",",""))).sum());
        totalSum = String.valueOf(infantList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTotal().replace(",",""))).sum());
        taxSum = String.valueOf(infantList.stream().mapToLong(e->Long.parseLong(e.getPrice().getTax().replace(",",""))).sum());
        feeSum = String.valueOf(infantList.stream().mapToLong(e->Long.parseLong(e.getPrice().getFee().replace(",",""))).sum());

        infantDto.setBase(decimalFormat.format(baseSum));
        infantDto.setOilPrice(decimalFormat.format(oilSum));
        infantDto.setFee(decimalFormat.format(feeSum));
        infantDto.setTax(decimalFormat.format(taxSum));
        infantDto.setGrandTotal(decimalFormat.format(totalSum));
        infantDto.setPeopleCount(infantList.size());

        Map<String, PriceDTO> newMap = new HashMap<>();


        newMap.put("성인", adultDto);
        newMap.put("아동", childrenDto);
        newMap.put("유아", infantDto);

        return newMap;
    }
}