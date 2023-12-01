package com.tenco.team_two_flight_ticket.handler.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class MyNotFoundException extends RuntimeException{

    private HttpStatus status;

    public MyNotFoundException(String message){
        super(message);
        this.status = HttpStatus.NOT_FOUND;

    }
}
