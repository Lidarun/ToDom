package com.todom.controller;

import com.todom.service.TodoService;
import com.todom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private TodoService todoService;

    //DELETE
    @GetMapping("/delete")
    public String deleteUser(@RequestParam long id, ModelMap model) {
        String username = userService.findUserById(id).getUsername();
        String usernameAdmin = getLoggedInUserName(model);

        userService.deleteUser(id);
        todoService.deleteAllByOwnerUsername(username);

        if (userService.findUserByUsername(usernameAdmin)){
            return "redirect:/admin";
        }
        return "redirect:/logout";
    }

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        return "admin";
    }

    @GetMapping("/get/{userId}")
    public String  getUser(@PathVariable("userId") Long userId, Model model) {
        model.addAttribute("allUsers", userService.userList(userId));
        return "admin";
    }

    private String getLoggedInUserName(ModelMap model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            return ((UserDetails) principal).getUsername();
        }

        return principal.toString();
    }
}
