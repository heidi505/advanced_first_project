package com.tenco.team_two_flight_ticket.admin.banner;

import com.tenco.team_two_flight_ticket._middle._entity.enums.BannerTypeEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "banner_tb")
public class Banner {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Enumerated(EnumType.STRING)
    private BannerTypeEnum bannerType;
    //DTO로 들어가야할 듯
//    private String departureCity;
//    private String arrivalCity;
//    private Timestamp departureDate;
//    private Timestamp arrivalDate;
//    private Long Price;


}
