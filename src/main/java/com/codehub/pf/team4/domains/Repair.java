package com.codehub.pf.team4.domains;

import com.codehub.pf.team4.enums.RepairType;
import com.codehub.pf.team4.enums.State;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Objects;

@Table(name = "Repair")
@Data
@Entity
public class Repair {
    @Id
    @Column(name = "repair_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "date")
    @DateTimeFormat
    private LocalDate date;

    @Enumerated(EnumType.STRING)
    @Column(name = "state")
    private State state;

    @Enumerated(EnumType.STRING)
    @Column(name = "repair_type")
    private RepairType repairType;

    @Column(name = "cost")
    private Long cost;

    @Column(name = "address")
    private String address;

    @JsonIgnore
    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id")//, referencedColumnName = "user_id")
    private User user;

    @Column(name = "description")
    private String description;

    @Override
    public String toString() {
        return "Repair{" +
                "id=" + id +
                ", date =" + date +
                ", state ='" + state + '\'' +
                ", repair_type ='" + repairType + '\'' +
                ", cost ='" + cost + '\'' +
                ", address =" + address +
                ", description =" + description +
                ", userId =" + user.getId() +
                '}';
    }

    @Override // auto generated from intelliJ idea
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Repair repair = (Repair) o;
        return getId().equals(repair.getId()) && getDate().equals(repair.getDate()) && getState() == repair.getState() && getRepairType() == repair.getRepairType() && getCost().equals(repair.getCost()) && Objects.equals(getAddress(), repair.getAddress()) && Objects.equals(getDescription(), repair.getDescription());
    }
}
