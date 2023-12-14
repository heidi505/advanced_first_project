package com.tenco.team_two_flight_ticket._middle._repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AirportRepository {
    public String findCityName(String code);
}
