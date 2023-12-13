package com.tenco.team_two_flight_ticket._core.utils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateFormat {
    // yyyy-mm-dd 날짜 포맷 메소드
//    public static String formatDate(Date date) {
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        return sdf.format(date);
//    }

    public static String formatTime() {
        LocalDateTime dateTime = LocalDateTime.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String hourPart = dateTime.format(DateTimeFormatter.ofPattern("HH"));

        System.out.println(hourPart);

        return hourPart;
    }

    public static String formatYear() {
        String schDate = "20231210";

        // Define the formatter for the given pattern
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");

        // Parse the string into a LocalDate object
        LocalDate parsedDate = LocalDate.parse(schDate, formatter);

        // Output the parsed date
        System.out.println("Parsed Date: " + parsedDate);
        return null;

    }
}
