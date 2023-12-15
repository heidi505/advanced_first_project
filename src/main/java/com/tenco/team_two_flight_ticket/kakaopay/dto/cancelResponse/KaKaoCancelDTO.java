package com.tenco.team_two_flight_ticket.kakaopay.dto.cancelResponse;

import lombok.Data;

import java.util.Date;

@Data
public class KaKaoCancelDTO {
    private String aid;
    private String tid;
    private String cid;
    private String status;
    private String partner_order_id;
    private String partner_user_id;
    private String payment_method_type;
    private ApprovedCancelAmountDTO approved_cancel_amount;
    private String item_name;
    private String item_code;
    private Integer quantity;
    private String payload;
    private Date approved_at;
    private Date canceled_at;
    private Date created_at;

}
