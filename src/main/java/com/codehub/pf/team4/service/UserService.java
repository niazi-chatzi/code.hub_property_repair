package com.codehub.pf.team4.service;

import com.codehub.pf.team4.forms.UserForm;
import com.codehub.pf.team4.models.PropertyModel;
import com.codehub.pf.team4.models.RepairModel;
import com.codehub.pf.team4.models.UserModel;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface UserService {

    // get all users
    List<UserModel> getAllUsers();

    // find user by id
    Optional<UserModel> findUserById(Long id);

    // find user by id return a form
    Optional<UserForm> findUserByIdAsUserForm(Long id);

    // find user by id as a form
    // Optional<UserModel> updateUserModel(UserForm user);

    // find user by afm
    Optional<UserModel> findUserByAfm(String afm);

    // find user by email
    Optional<UserModel> findUserByEmail(String email);

    // add user
    Optional<UserModel> addUser(UserForm user);

    // update user
    Optional<UserModel> updateUser(UserForm user);

    // delete user by id
    boolean deleteById(Long id);

    // given a user id, find all repairs for that user
    List<RepairModel> getRepairsByUserId(Long id);

    // given an afm number, get all repairs related with the user
    List<RepairModel> getRepairsByUserAfm(String afm);

    // given an email, get all repairs related with the user
    List<RepairModel> getRepairsByUserEmail(String email);

    Page<UserModel> findAllAsPage(int page);

    List<PropertyModel> getPropertiesByUserAfm(String afm);
}
