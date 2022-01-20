package com.codehub.pf.team4.forms;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
public class PropertyForm {

    private static final String YEAR_OF_CONSTRUCTION_PATTERN = "^[0-9]*$";
    private static final String PROPERTY_ID_PATTERN = "^[0-9]*$";
    private static final String ID_PATTERN = "^[0-9]*$";
    private static final String USER_ID_PATTERN = "^[0-9]*$";

    @Pattern(regexp = YEAR_OF_CONSTRUCTION_PATTERN, message = "Year of construction pattern doesn't match")
    @NotEmpty(message = "Year of construction can't be empty")
    private String yearOfConstruction;

    //Validated in PropertyValidator
    @Pattern(regexp = ID_PATTERN, message = "Id pattern doesn't match")
    private String id;

    @NotEmpty
    @Size(min=9,max=9,message = "Property ID should have 9 digits")
    @Pattern(regexp = PROPERTY_ID_PATTERN, message = "Property ID pattern doesn't match")
    private String propertyId;

    @NotEmpty
    @Pattern(regexp = USER_ID_PATTERN, message = "User ID pattern doesn't match")
    private String userId;

    @NotEmpty
    private String houseType;

    // no validations needed
    @NotEmpty
    private String address;

}
