package com.codehub.pf.team4.enums;

public enum HouseType {

    DETACHED_HOUSE("Μονοκατοικία"),
    MAISONETTE("Μεζονέτα"),
    APARTMENT_BUILDING("Πολυκατοικία");

    private String houseType;

    HouseType(String houseType){
        this.houseType = houseType;
    }

    public String getHouseType() {
        return houseType;
    }
}
