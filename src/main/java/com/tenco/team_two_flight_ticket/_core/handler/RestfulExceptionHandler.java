package com.tenco.team_two_flight_ticket._core.handler;

import com.tenco.team_two_flight_ticket._core.handler.exception.*;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class RestfulExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public String badArgument(MethodArgumentNotValidException e){
        BindingResult result = e.getBindingResult();
        System.out.println("에러에러에러에러");
        StringBuffer sb = new StringBuffer();

        for (FieldError error : result.getFieldErrors()) {
            sb.append("<script>");
            sb.append("alert( '" + error.getDefaultMessage()+"');");
            sb.append("history.back();");
            sb.append("</script>");

        }

        return sb.toString();
    }

    @ExceptionHandler(MyBadRequestException.class)
    public String badRequest(MyBadRequestException e){
        System.out.println("에러에러에러에러");
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert( '" + e.getMessage() + "   에러코드:" + e.getStatus() + "' );");
        sb.append("history.back();");
        sb.append("</script>");

        return sb.toString();
    }

    @ExceptionHandler(MyForbiddenException.class)
    public String forbidden(MyForbiddenException e){
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert( '" + e.getMessage() + "   에러코드:" + e.getStatus() + "' );");
        sb.append("history.back();");
        sb.append("</script>");

        return sb.toString();

    }

    @ExceptionHandler(MyNotFoundException.class)
    public String notFound(MyNotFoundException e){
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert( '" + e.getMessage() + "   에러코드:" + e.getStatus() + "' );");
        sb.append("history.back();");
        sb.append("</script>");
        return sb.toString();
    }

    @ExceptionHandler(MyUnAuthorizedException.class)
    public String unAuthorized(MyUnAuthorizedException e){
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert( '" + e.getMessage() + "   에러코드:" + e.getStatus() + "' );");
        sb.append("history.back();");
        sb.append("</script>");
        return sb.toString();
    }
    @ExceptionHandler(MyServerError.class)
    public String internalServerError(MyServerError e){
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert( '" + e.getMessage() + "   에러코드:" + e.getStatus() + "' );");
        sb.append("history.back();");
        sb.append("</script>");
        return sb.toString();
    }
}
