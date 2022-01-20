package com.codehub.pf.team4.enums;

public enum State {

    WAITING("Σε αναμονή"),
    ONGOING("Σε εξέλιξη"),
    DONE("Ολοκληρωμένη");

    private String state;

    State(String state) {
        this.state = state;
    }

    public String getState(){
        return state;
    }
}
