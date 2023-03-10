package com.todom.service;

import com.todom.entity.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    UserDetails loadUserByUsername(String username);

    User findUserById(Long userId);

    List<User> allUsers();

    boolean saveUser(User user);

    boolean findUserByUsername(String username);

    boolean deleteUser(Long userId);

    List<User> userList(Long idMin);

    void addRoleAdmin(User user);
}