package com.codehub.pf.team4.mappers;

import com.codehub.pf.team4.domains.User;
import com.codehub.pf.team4.enums.HouseType;
import com.codehub.pf.team4.enums.Roles;
import com.codehub.pf.team4.forms.UserForm;
import org.springframework.stereotype.Component;

@Component
public class UserFormMapper {

    public static User mapToUser(UserForm userForm) {
        if (userForm == null) return null;

        User user = new User();
        user.setAfm(userForm.getAfm());
        user.setEmail(userForm.getEmail());
        user.setFirstName(userForm.getFirstName());
        user.setLastName(userForm.getLastName());
        user.setAddress(userForm.getAddress());
        user.setPhoneNumber(Long.parseLong(userForm.getPhoneNumber()));
        user.setRoles(Roles.valueOf(userForm.getRoles()));

        if (userForm.getId() != null) {
            if (!userForm.getId().isEmpty()) {
                user.setId(Long.parseLong(userForm.getId()));
            }
        }

        if (userForm.getPassword() != null) {
            if (!userForm.getPassword().isBlank()) {
                user.setPassword(userForm.getPassword());
            }
        }

        return user;
    }

    public static UserForm mapToUserForm(User user) {
        if (user == null) return null;

        UserForm userForm = new UserForm();
        userForm.setAfm(user.getAfm().toString());
        userForm.setEmail(user.getEmail());
        userForm.setFirstName(user.getFirstName());
        userForm.setLastName(user.getLastName());
        userForm.setAddress(user.getAddress());
        userForm.setPhoneNumber(user.getPhoneNumber().toString());
        userForm.setId(user.getId().toString());
        userForm.setRoles(user.getRoles().toString());

        return userForm;
    }
}
