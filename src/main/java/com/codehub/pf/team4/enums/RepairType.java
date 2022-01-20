package com.codehub.pf.team4.enums;

public enum RepairType {

    PAINTING("Βάψιμο"),
    INSULATION("Μόνωση"),
    FRAMES("Κουφώματα"),
    PLUMBING("Υδραυλικές Εργασίες"),
    ELECTRICAL_WORK("Ηλεκτρολογικές Εργασίες");

    private String repairType;

    RepairType(String repairType) {
        this.repairType = repairType;
    }

    public String getRepairType() {
        return repairType;
    }
}
