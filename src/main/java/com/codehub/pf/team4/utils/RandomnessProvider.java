package com.codehub.pf.team4.utils;

import com.codehub.pf.team4.enums.HouseType;
import com.codehub.pf.team4.enums.RepairType;
import com.codehub.pf.team4.enums.Roles;
import com.codehub.pf.team4.enums.State;

import java.time.LocalDate;
import java.util.Random;

import static com.codehub.pf.team4.enums.Roles.ADMIN;
import static com.codehub.pf.team4.enums.Roles.USER;

public abstract class RandomnessProvider {
    // Generates a random int with exactly n digits
    public static int getRandomNumber(int numberOfDigits) {
        int newNumber = (int) Math.pow(10, numberOfDigits - 1);
        return newNumber + new Random().nextInt(9 * newNumber);
    }

    // Generates a random long with exactly n digits
    public static long getRandomNumber(long numberOfDigits) {
        long newNumber = (long) Math.pow(10, numberOfDigits - 1);
        return newNumber + (long)(Math.random()*(9 * newNumber));
    }

    // Generates a random long -> length of characters ranging from min to max
    public static Long getRandomNumber(int min, int max) {
        Long minNumber = (long) Math.pow(10, min - 1);
        Long maxNumber = (long) Math.pow(10, max - 1);
        return minNumber + (long) (Math.random() * (maxNumber - minNumber));
    }

    // Get a random integer between a range
    public static int getRandomNumberBetween(int minNumber, int maxNumber) {
        return minNumber + new Random().nextInt((maxNumber - minNumber) + 1);
    }

    // Get a random housetype
    public static HouseType getRandomHouseType() {
        int minNumber = 0;
        int maxNumber = 100;
        int value = getRandomNumberBetween(minNumber, maxNumber);
        if (value <= 33) return HouseType.DETACHED_HOUSE;
        else if (value <= 66) return HouseType.APARTMENT_BUILDING;
        else return HouseType.MAISONETTE;
    }

    // Get a random state
    public static State getRandomState() {
        int minNumber = 0;
        int maxNumber = 100;
        int value = getRandomNumberBetween(minNumber, maxNumber);
        if (value <= 33) return State.WAITING;
        else if (value <= 66) return State.ONGOING;
        else return State.DONE;
    }

    // Get a random repairtype
    public static RepairType getRandomRepairType() {
        int minNumber = 0;
        int maxNumber = 100;
        int value = getRandomNumberBetween(minNumber, maxNumber);
        if (value <= 20) return RepairType.PAINTING;
        else if (value <= 40) return RepairType.INSULATION;
        else if (value <= 60) return RepairType.FRAMES;
        else if (value <= 80) return RepairType.PLUMBING;
        else return RepairType.ELECTRICAL_WORK;
    }

    //Provides a day
    public static int getDayGiver() {
        int minDay = 1;
        int maxDay = 28;
        int value = getRandomNumberBetween(minDay,maxDay);
        return value;
    }

    //Provides a month
    public static int getMonthGiver() {
        int minMonth = 1;
        int maxMonth = 12;
        int value = getRandomNumberBetween(minMonth,maxMonth);
        return value;
    }

    //Provides Cost
    public static Long getCost() {
        long value = getRandomNumberBetween(5,150);
        value *= 10;
        return value;
    }

    //Provides roles to the users
    public static Roles getRoles() {
        int value = getRandomNumberBetween(1,100);
        if (value <= 79){
            return USER;
        } else {
            return ADMIN;
        }
    }
}
