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
    boolean deleteUser(Long userId);
    public List<User> userList(Long idMin);
}
