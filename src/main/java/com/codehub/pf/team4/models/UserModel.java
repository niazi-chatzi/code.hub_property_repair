package com.codehub.pf.team4.models;

import com.codehub.pf.team4.enums.HouseType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserModel {
    private Long id;
    private String afm;
    private String firstName;
    private String lastName;
    private String address;
    private Long phoneNumber;
    private String email;
    private String password;
    private HouseType houseType;

    public UserModel(Long id, String email, String afm) {
        this.id = id;
        this.email = email;
        this.afm = afm;
    }

}
