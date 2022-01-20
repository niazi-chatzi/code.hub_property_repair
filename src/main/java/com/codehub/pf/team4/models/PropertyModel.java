package com.codehub.pf.team4.models;

import com.codehub.pf.team4.enums.HouseType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PropertyModel {
    private Long id;
    private String propertyId;
    private String address;
    private String yearOfConstruction;
    private HouseType houseType;
    private String user;
    private Long userId;
}
