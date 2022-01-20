package com.codehub.pf.team4.domains;

import com.codehub.pf.team4.enums.HouseType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.util.Objects;

@Table(name = "Property",uniqueConstraints = @UniqueConstraint(columnNames = "property_id"))
@Data
@Entity
public class Property {

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "property_id", nullable = false)
    private String propertyId;

    @Column(name ="address", nullable = false)
    private String address;

    @Column(name ="year_of_construction")
    private String yearOfConstruction;

    @Enumerated(EnumType.STRING)
    @Column(name = "house_type", nullable = false)
    private HouseType houseType;

    @JsonIgnore
    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id")//, referencedColumnName = "user_id")
    private User user;

    @Override
    public String toString() {
        return "Property{" +
                "id=" + id +
                ", property_ID_E9" + propertyId +
                ", house_type ='" + houseType + '\'' +
                ", year_of_construction ='" + yearOfConstruction + '\'' +
                ", address =" + address +
                ", userId =" + user.getId() +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Property property = (Property) o;
        return getId().equals(property.getId()) && getPropertyId().equals(property.getPropertyId()) && getAddress().equals(property.getAddress()) && Objects.equals(getYearOfConstruction(), property.getYearOfConstruction()) && getHouseType() == property.getHouseType();
    }
}
