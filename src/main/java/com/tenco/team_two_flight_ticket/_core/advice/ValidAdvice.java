package com.tenco.team_two_flight_ticket._core.advice;

import com.tenco.team_two_flight_ticket.handler.exception.MyBadRequestException;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Aspect
@Component
public class ValidAdvice {

    @Pointcut("@annotation(org.springframework.web.bind.annotation.PostMapping)")
    public void postMapping() {}
    @Pointcut("@annotation(org.springframework.web.bind.annotation.PutMapping)")
    public void putMapping() {}

    @Before("postMapping() || putMapping()")
    public void checkValid(JoinPoint jp) throws Throwable{
        Object[] args = jp.getArgs();

        for(Object arg : args) {
            if (arg instanceof Errors){
                Errors errors = (Errors) arg;

                if (errors.hasErrors()){
                    List<FieldError> fieldErrors = errors.getFieldErrors();
                    throw new MyBadRequestException(
                            fieldErrors.get(0).getDefaultMessage() + ":" + fieldErrors.get(0).getField()
                    );
                }
            }
        }


    }






}
