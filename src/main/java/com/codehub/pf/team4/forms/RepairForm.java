package com.codehub.pf.team4.forms;

import com.codehub.pf.team4.enums.Roles;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Data
public class RepairForm {
    private static final String DATE_PATTERN = "^[0-9]{4}\\-[01][0-9]\\-[0-3][0-9]$";
    private static final String COST_PATTERN = "^[0-9]*$";
    private static final String ID_PATTERN = "^[0-9]*$";
    private static final String USER_ID_PATTERN = "^[0-9]*$";

    @Pattern(regexp = DATE_PATTERN, message = "Date pattern doesn't match")
    @NotEmpty(message = "Date can't be empty")
    private String date;

    @Pattern(regexp = COST_PATTERN, message = "Cost pattern doesn't match")
    @NotEmpty(message = "Cost can't be empty")
    private String cost;

    //Validated in RepairValidator
    @Pattern(regexp = ID_PATTERN, message = "Id pattern doesn't match")
    private String id;

    @Pattern(regexp = USER_ID_PATTERN, message = "User ID pattern doesn't match")
    private String userId;

    private String state;
    private String repairType;

    // no validations needed
    private String address;
    private String description;
    private Roles roles;
}
