package com.codehub.pf.team4.mappers;

import com.codehub.pf.team4.domains.User;
import com.codehub.pf.team4.forms.UserForm;
import com.codehub.pf.team4.models.UserModel;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public abstract class UserMapper {

    public static UserModel mapToUserModel(User user) {
        if (user == null) return null;
        UserModel userModel = new UserModel();
        userModel.setFirstName(user.getFirstName());
        userModel.setLastName(user.getLastName());
        userModel.setEmail(user.getEmail());
        userModel.setId(user.getId());
        userModel.setAfm(user.getAfm());
        userModel.setAddress(user.getAddress());
        userModel.setPhoneNumber(user.getPhoneNumber());
        userModel.setPassword(user.getPassword());
        return userModel;
    }

    public static List<UserModel> mapToUserModelList(List<User> users) {
        if (users.isEmpty()) return new ArrayList();
        return users.stream()
                .map(UserMapper::mapToUserModel)
                .collect(Collectors.toList());
    }

    public static Optional<UserModel> mapToUserModelOptional(User user) {
        if (user == null) return Optional.empty();
        return Optional.of(mapToUserModel(user));
    }
}
