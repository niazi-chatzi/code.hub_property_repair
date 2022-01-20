package com.codehub.pf.team4.controller.user;

import com.codehub.pf.team4.models.PropertyModel;
import com.codehub.pf.team4.models.RepairModel;
import com.codehub.pf.team4.models.UserModel;
import com.codehub.pf.team4.service.RepairService;
import com.codehub.pf.team4.service.UserService;
import com.codehub.pf.team4.utils.GlobalAttributes;
import com.codehub.pf.team4.utils.StatusProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/home")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RepairService repairService;

    @GetMapping("")
    public String getHomePage(Model model) {
        UserModel theUser = userService.findUserByEmail(StatusProvider.getLoggedInEmail()).orElse(null);
        if(theUser == null) return "redirect:/logout"; // if for some reason the user cant be located just redirect the logout

        model.addAttribute(GlobalAttributes.REPAIRS, userService.getRepairsByUserId(theUser.getId()));
        model.addAttribute(GlobalAttributes.PROPERTIES, userService.getPropertiesByUserAfm(theUser.getAfm().toString()));
        model.addAttribute(GlobalAttributes.USERNAME, theUser.getFirstName());
        return "pages/home";
    }

    @GetMapping("/repairs/{id}")
    public String getRepairForUser(@PathVariable Long id, Model model) {
        UserModel theUser = userService.findUserByEmail(StatusProvider.getLoggedInEmail()).orElse(null);
        if(theUser == null) return "redirect:/logout"; // if for some reason the user cant be located just redirect the logout

        Optional<RepairModel> theRepairs = userService.getRepairsByUserId(theUser.getId())
                .stream()
                .filter(repair -> repair.getId() == id)
                .findFirst();

        if(theRepairs.isEmpty()) return "redirect:/home";

        model.addAttribute(GlobalAttributes.REPAIRS, theRepairs.get());
        return "pages/user-repair-view";
    }

    @GetMapping("/properties/{id}")
    public String getPropertyForUser(@PathVariable Long id, Model model) {
        UserModel theUser = userService.findUserByEmail(StatusProvider.getLoggedInEmail()).orElse(null);
        if(theUser == null) return "redirect:/logout"; // if for some reason the user cant be located just redirect the logout

        Optional<PropertyModel> theProperties = userService.getPropertiesByUserAfm(theUser.getAfm())
                .stream()
                .filter(property -> property.getId() == id)
                .findFirst();

        if(theProperties.isEmpty()) return "redirect:/home";

        model.addAttribute(GlobalAttributes.PROPERTIES, theProperties.get());
        return "pages/user-property-view";
    }
}
