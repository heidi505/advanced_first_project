package com.tenco.team_two_flight_ticket._middle._repository;

import com.tenco.team_two_flight_ticket._middle._entity.Passenger;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PassengerRepository {

    Passenger findByReservationId(int id);

    public int insertP(Passenger passenger);
}
