package com.codehub.pf.team4.controller.admin;


import com.codehub.pf.team4.models.RepairModel;
import com.codehub.pf.team4.service.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    RepairService repairService;

    // *************************************************** //
    // ======================= ADMIN ===================== //
    // *************************************************** //

    @GetMapping(value = {"", "home"})
    public String getAdminHome(Model model) throws Exception{
        List<RepairModel> activeRepairs = repairService.getOngoingRepairsOfTheDay();
        System.out.println("ACTIVE REPAIRS :    " + activeRepairs);
        model.addAttribute("activeRepairs", activeRepairs);
        return "pages/admin-home-view";
    }
}
