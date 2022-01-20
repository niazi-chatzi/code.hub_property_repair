package com.codehub.pf.team4.models;

import com.codehub.pf.team4.enums.RepairType;
import com.codehub.pf.team4.enums.State;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RepairModel {
    private Long id;
    private LocalDate date;
    private State state;
    private RepairType repairType;
    private Long cost;
    private String address;
    private String user;
    private Long userId;
    private String description;
}
