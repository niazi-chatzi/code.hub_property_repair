package com.codehub.pf.team4.service;


import com.codehub.pf.team4.domains.User;
import com.codehub.pf.team4.models.LoginResponse;
import com.codehub.pf.team4.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Arrays;
import java.util.Optional;

public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        // search for the user in the repo.
        // if user is found send a successful response.
        Optional<User> userOptional = userRepository.findByEmail(email);

        if (userOptional.isEmpty()) {
            throw new UsernameNotFoundException(email);
        }

        User user = userOptional.get();

        return new LoginResponse(user.getEmail(), user.getPassword(), Arrays.asList(new SimpleGrantedAuthority(user.getRoles().name())));
    }
}