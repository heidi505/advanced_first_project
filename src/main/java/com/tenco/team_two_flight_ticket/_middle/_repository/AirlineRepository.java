package com.tenco.team_two_flight_ticket._middle._repository;

import jakarta.validation.constraints.Max;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AirlineRepository {
    public String findAirlineName(String code);
}
