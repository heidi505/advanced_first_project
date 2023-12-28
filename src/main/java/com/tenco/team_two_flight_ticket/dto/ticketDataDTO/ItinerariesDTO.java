package com.tenco.team_two_flight_ticket.dto.ticketDataDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Data
@ToString
@NoArgsConstructor
public class ItinerariesDTO {
    //총 소요시간
    private String duration;
    //한 항공권에 포함된 비행편 정보. ex 서울-도쿄 왕복이면 서울 출발-도쿄 도착, 도쿄 출발- 서울 도착 이렇게 비행편이 총 2개. 그럼 segment의 size는 2임.
    //편도면 size가 1.
    //경유일 경우 더 늘어나지만 우리 프로젝트는 경유 고려 x
    private List<SegmentDTO> segments;


    //시간이랑 날짜를 따로 떼서 보기 좋게 파싱하려고 만든 생성자
    public ItinerariesDTO(ItinerariesDTO dto) {
        String time = dto.getDuration().substring(2);
        int indexOfH = time.indexOf("H");
        if (time.contains("M")) {
            int indexOfM = time.indexOf("M");

            String hour = time.substring(0, indexOfH);
            String minute = time.substring(indexOfH + 1, indexOfM);
            this.duration = hour + "시간 " + minute + "분";
        } else {
            String hour = time.substring(0, 1);
            this.duration = hour + "시간 ";
        }

        this.segments = dto.getSegments().stream()
                .map(e -> new SegmentDTO(e))
                .collect(Collectors.toList());
    }

    //segment만 필요할 때가 많은데 뷰에서 리스트 타고타고들어가기 힘들어서 생성자 만들어놓음
    public List<SegmentDTO> segments() {

        List<SegmentDTO> segment = this.getSegments();

        return segment;
    }


}