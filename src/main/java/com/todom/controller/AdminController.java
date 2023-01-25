package com.todom.controller;

import com.todom.service.UserService;
import com.todom.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;

    //DELETE
    @GetMapping("/delete")
    public String deleteTodo(@RequestParam long id) {
        userService.deleteUser(id);
        return "redirect:/admin";
    }

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        return "admin";
    }

    @GetMapping("/gt/{userId}")
    public String  gtUser(@PathVariable("userId") Long userId, Model model) {
        model.addAttribute("allUsers", userService.userList(userId));
        return "admin";
    }
}
