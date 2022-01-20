package com.codehub.pf.team4.service;

import com.codehub.pf.team4.domains.User;
import com.codehub.pf.team4.forms.UserForm;
import com.codehub.pf.team4.mappers.PropertyMapper;
import com.codehub.pf.team4.mappers.RepairMapper;
import com.codehub.pf.team4.mappers.UserFormMapper;
import com.codehub.pf.team4.mappers.UserMapper;
import com.codehub.pf.team4.models.PropertyModel;
import com.codehub.pf.team4.models.RepairModel;
import com.codehub.pf.team4.models.UserModel;
import com.codehub.pf.team4.repository.PropertyRepository;
import com.codehub.pf.team4.repository.RepairRepository;
import com.codehub.pf.team4.repository.UserRepository;
import com.codehub.pf.team4.utils.GlobalAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RepairRepository repairRepository;

    @Autowired
    private PropertyRepository propertyRepository;

    @Override
    public List<UserModel> getAllUsers() { return UserMapper.mapToUserModelList(userRepository.findAll()); }

    @Override
    public Page<UserModel> findAllAsPage(int page) {
       Page<User> usersPaged = userRepository.findAll(PageRequest.of(page, GlobalAttributes.PAGE_CONTENT_SIZE));

       if (usersPaged.isEmpty()) return Page.empty(); // if page object is empty with given page return empty page object

        List<UserModel> userModel = UserMapper.mapToUserModelList(usersPaged.getContent());
        return  new PageImpl(userModel, usersPaged.getPageable(), usersPaged.getTotalElements());
    }

    @Override
    public List<PropertyModel> getPropertiesByUserAfm(String afm) {
        return PropertyMapper.mapToPropertyModelList(userRepository.findPropertiesByAfm((afm)));
    }

    @Override
    public Optional<UserModel> findUserById(Long id) {
        return UserMapper.mapToUserModelOptional(userRepository.findById(id).orElse(null));
    }

    public Optional<UserForm> findUserByIdAsUserForm(Long id) {
        return Optional.ofNullable(UserFormMapper.mapToUserForm(userRepository.findById(id).orElse(null)));
    }

    @Override
    public Optional<UserModel> findUserByAfm(String afm) {
        return UserMapper.mapToUserModelOptional(userRepository.findByAfm(afm).orElse(null));
    }

    @Override
    public Optional<UserModel> updateUser(UserForm toBeUpdatedUserForm) {
        User toBeUpdatedUser = UserFormMapper.mapToUser(toBeUpdatedUserForm);
        User originalUser = userRepository.findById(toBeUpdatedUser.getId()).orElse(null);
        // get the original user and replace his password with the given user if no password is provided for update
        if(originalUser == null) return Optional.empty(); // if user not found something went wrong in the validation
        if(toBeUpdatedUser.getPassword() == null) toBeUpdatedUser.setPassword(originalUser.getPassword());
        if(toBeUpdatedUser.equals(originalUser)) return UserMapper.mapToUserModelOptional(toBeUpdatedUser); // if no changed were made dont update

        return UserMapper.mapToUserModelOptional(userRepository.save(toBeUpdatedUser));
    }

    @Override
    public Optional<UserModel> findUserByEmail(String email) {
        return UserMapper.mapToUserModelOptional(userRepository.findByEmail(email).orElse(null));
    }

    @Override
    public List<RepairModel> getRepairsByUserAfm(String afm) {
        return RepairMapper.mapToRepairModelList(userRepository.findRepairsByAfm(afm));
    }

    @Override
    public List<RepairModel> getRepairsByUserEmail(String email) {
        return RepairMapper.mapToRepairModelList(userRepository.findRepairsByUserEmail(email));
    }

    @Override
    public Optional<UserModel> addUser(UserForm newUser) {
        return UserMapper.mapToUserModelOptional(userRepository.save(UserFormMapper.mapToUser(newUser)));
    }

    @Override
    public boolean deleteById(Long id) {
        // if id is empty or user paired with this id doesn't exist
        Optional<User> toDeleteUser = userRepository.findById(id);
        if (id == null || toDeleteUser.isEmpty() ) {
            return false; // deletion unsuccessful
        }

        repairRepository.deleteAll(toDeleteUser.get().getRepairs());
        propertyRepository.deleteAll(toDeleteUser.get().getProperties());

        userRepository.deleteById(id);
        return true;
    }

    @Override
    public List<RepairModel> getRepairsByUserId(Long id) {
        return RepairMapper.mapToRepairModelList(userRepository.findRepairsByUserId(id));
    }
}
