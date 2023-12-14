package com.tenco.team_two_flight_ticket._core.utils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateFormat {
    public static String formatTime() {
        LocalDateTime dateTime = LocalDateTime.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String hourPart = dateTime.format(DateTimeFormatter.ofPattern("HH"));

        System.out.println(hourPart);

        return hourPart;
    }

    public static String formatYear() {
        String schDate = "20231210";

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");

        LocalDate parsedDate = LocalDate.parse(schDate, formatter);

        System.out.println("Parsed Date: " + parsedDate);
        return null;

    }
}
