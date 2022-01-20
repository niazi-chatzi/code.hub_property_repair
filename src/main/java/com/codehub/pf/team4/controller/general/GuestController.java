package com.codehub.pf.team4.controller.general;

import com.codehub.pf.team4.enums.Roles;
import com.codehub.pf.team4.service.UserService;
import com.codehub.pf.team4.utils.StatusProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class GuestController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "")
    public String guestPage(){
        if(StatusProvider.getLoggedInRole().equals(Roles.ADMIN.toString())) return "redirect:/admin";
        if(StatusProvider.getLoggedInRole().equals(Roles.USER.toString())) return "redirect:/home";
        return "user/guest";
    }
}
