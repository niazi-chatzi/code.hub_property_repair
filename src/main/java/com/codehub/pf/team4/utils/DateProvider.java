package com.codehub.pf.team4.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public abstract class DateProvider {
    public static DateTimeFormatter getFormat() {
        return DateTimeFormatter.ofPattern("yyyy-MM-dd");
    }

    public static LocalDate getLocalDate(String date) {
        return LocalDate.parse(date, getFormat());
    }

    public static LocalDate getToday() {
        return LocalDate.now();
    }
}
