package com.todom.controller;

import com.todom.entity.User;
import com.todom.service.RoleService;
import com.todom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    private String roleAdmin = "ROLE_ADMIN";

    //    //POST
    @PostMapping()
    public String becameAdmin(@ModelAttribute("roleForm") @Valid User password,
                          BindingResult bindingResult,
                          ModelMap model) {

        if(password.getPassword().equals(roleService.getPasswordByRoleName(roleAdmin))) {
            User user = (User) userService.loadUserByUsername(getLoggedInUserName(model));
            userService.addRoleAdmin(user);
            return "redirect:/logout";
        }else {
            model.addAttribute("passwordRoleError", "Passwords don't match");
            return "role-password";
        }
    }

    //GET
    @GetMapping()
    public String showRolePasswordPage(ModelMap model) {
        model.addAttribute("roleForm", new User());

        return "role-password";
    }

    private String getLoggedInUserName(ModelMap model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            return ((UserDetails) principal).getUsername();
        }

        return principal.toString();
    }

}
