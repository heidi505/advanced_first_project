package com.tenco.team_two_flight_ticket.search;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "searched_tb")
public class Searched {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private int userId;
    private boolean isOneWay;
    private String departureCity;
    private String arrivalCity;
    private String startDate;
    private String endDate;
    @CreationTimestamp
    private Timestamp createdAt;
    private String travelClass;
    private int adults;
    private int children;
    private int infants;

    @Builder
    public Searched(int id, int userId, boolean isOneWay, String departureCity, String arrivalCity, String startDate, String endDate, Timestamp createdAt, String travelClass, int adults, int children, int infants) {
        this.id = id;
        this.userId = userId;
        this.isOneWay = isOneWay;
        this.departureCity = departureCity;
        this.arrivalCity = arrivalCity;
        this.startDate = startDate;
        this.endDate = endDate;
        this.createdAt = createdAt;
        this.travelClass = travelClass;
        this.adults = adults;
        this.children = children;
        this.infants = infants;
    }
}
