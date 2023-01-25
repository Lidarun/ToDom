package com.todom.service.impl;

import com.todom.entity.Role;
import com.todom.repository.RoleRepository;
import com.todom.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository repo;

    @Override
    public String getPasswordByRoleName(String name) {
        Role role = repo.findByName(name);
        return role.getPassword();
    }

    @Override
    public Role getRole(long id) {
        return repo.findById(id);
    }
}
