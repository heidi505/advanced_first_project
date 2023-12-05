package com.tenco.team_two_flight_ticket._core.handler.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class MyServerError extends RuntimeException{

    private HttpStatus status;

    public MyServerError(String message){
        super(message);
        this.status = HttpStatus.INTERNAL_SERVER_ERROR;

    }
}
