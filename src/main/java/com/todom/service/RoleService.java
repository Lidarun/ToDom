package com.todom.service;

import com.todom.entity.Role;

public interface RoleService {
    String getPasswordByRoleName(String role);
    Role getRole(long id);
}
