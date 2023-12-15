package com.tenco.team_two_flight_ticket.kakaopay.dto;

import lombok.Data;
import lombok.ToString;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@ToString
public class KakaoPayApprovalDTO {

    //response
    private String aid;
    private String tid;
    private String cid;
    private String sid;
    private String partner_order_id;
    private String partner_user_id;
    private String payment_method_type;
    private AmountDTO amount;
    private CardDTO card_info;
    private String item_name;
    private String item_code;
    private String payload;
    private Integer quantity;
    private String tax_free_amount;
    private String vat_amount;
    private Date created_at;
    private String approved_at;

    public String date(){
        String date = LocalDateTime.parse(this.approved_at).toLocalDate().toString();
        System.out.println(date);
        String[] dateArr = date.split("-");

        return dateArr[0] + "년 " + dateArr[1] + "월 " + dateArr[2] + "일";
    }

    public String time(){
        String time = LocalDateTime.parse(this.approved_at).toLocalTime().toString();
        String[] timeArr = time.split(":");

        return timeArr[0] + ":" + timeArr[1];
    }

}
