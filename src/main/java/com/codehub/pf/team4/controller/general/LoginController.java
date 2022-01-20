package com.codehub.pf.team4.controller.general;

import com.codehub.pf.team4.forms.UserForm;
import com.codehub.pf.team4.utils.GlobalAttributes;
import com.codehub.pf.team4.utils.StatusProvider;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/login")
public class LoginController {

    @GetMapping(value = "")
    public String loginPage(){
        if(StatusProvider.isLoggedIn()) return "redirect:";
        return "user/login";
    }

    @GetMapping(value = "/admin")
    public String loginConfirmation(){
            return "redirect:/admin";
    }

    @GetMapping(value = "/")
    public String loginBack(){
        return "redirect:";
    }

}
