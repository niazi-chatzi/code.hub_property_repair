package com.codehub.pf.team4.domains;
import com.codehub.pf.team4.enums.HouseType;
import com.codehub.pf.team4.enums.Roles;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "Users", uniqueConstraints = {@UniqueConstraint(columnNames = "afm"), @UniqueConstraint(columnNames = "email")})
@Data
public class User {

    @Id
    @Column(name = "user_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "afm", length = 9, nullable = false)
    private String afm;

    @Column(name = "first_name", nullable = false)
    private  String firstName;

    @Column(name = "last_name", nullable = false)
    private  String lastName;

    @Column(name = "address", nullable = false)
    private  String address;

    @Column(name = "phone_number", length=10, nullable = false)
    private  Long phoneNumber;

    @Column(name = "password", nullable = false)
    private  String password;

    @OneToMany(mappedBy = "user", targetEntity = Property.class, fetch = FetchType.LAZY)
    @JsonIgnore
    private List<Property> properties;

    @Column( name= "email", nullable = false)
    private String email;

    @Enumerated(EnumType.STRING)
    @Column (name="roles", nullable = false)
    private Roles roles;

    @OneToMany(mappedBy = "user", targetEntity = Repair.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonIgnore
    private List<Repair> repairs;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", afm=" + afm +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", address='" + address + '\'' +
                ", phoneNumber=" + phoneNumber +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", roles=' " + roles + '\''+
                '}';
    }

    @Override //  auto created by intelliJ idea
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return getId().equals(user.getId()) && getAfm().equals(user.getAfm()) && Objects.equals(getFirstName(), user.getFirstName()) && Objects.equals(getLastName(), user.getLastName()) && Objects.equals(getAddress(), user.getAddress()) && getPhoneNumber().equals(user.getPhoneNumber()) && getPassword().equals(user.getPassword())  && getEmail().equals(user.getEmail());
    }
}
