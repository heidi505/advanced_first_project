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
    //이거 3개는 무시
    private String type;
    private String id;
    private boolean oneWay;
    //예약할 수 있는 좌석 수(최대 9개)
    private int numberOfBookableSeats;
    //여정. 왕복이면 itinerary의 size가 2, 편도면 1.
    //경유일 경우 더 늘어날 수도 있는데, 우리 프로젝트에서는 경유 고려 X
    private List<ItinerariesDTO> itineraries;
    //항공권 가격에 대한 정보
    private PriceDTO price;
    //한명이 여러개의 항공권을 검색할 수 있음 ex 아빠가 애기 2 데리고 탈 항공권 총 3개 검색
    //이 리스트의 요소 1개가 탑승객 1명에 대한 정보. ex 위의 경우, 이 리스트의 size는 3.
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

    //성인, 아동, 유아가 각각 섞여있을 경우 각각의 정보를 map에 담는 메소드
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

    //왕복일 경우 각각의 비행편 정보를 map에 담은 메소드
    public Map<String, ItinerariesDTO> roundTrip(){
        Map<String, ItinerariesDTO> newMap = new HashMap<>();

        ItinerariesDTO first = this.getItineraries().get(0);
        ItinerariesDTO last = this.getItineraries().get(1);

        newMap.put("가는 편", first);
        newMap.put("오는 편", last);

        return newMap;
    }

    //성인, 아동, 유아가 섞여있을 경우 각각의 인원 수가 필요해서 만든 메소드
    public String adultAnd(){
        List<TravelerPricingDTO> adultList = this.getTravelerPricings().stream().filter(e->e.getTravelerType().equals("ADULT")).collect(Collectors.toList());
        List<TravelerPricingDTO> childList = this.getTravelerPricings().stream().filter(e->!e.getTravelerType().equals("ADULT")).collect(Collectors.toList());

        if (childList.size() == 0){
            return "성인 " + adultList.size() + " 명";
        }else{
            return "성인 " + adultList.size() + " 외 " + childList.size() + " 명";
        }

    }

    public ItinerariesDTO onewayOrRound(String value){
        if(value.equals("oneway")){
            return  this.getItineraries().get(0);
        }
        return this.getItineraries().get(1);
    }


}