package com.todom.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.Set;

@Data
@NoArgsConstructor
@Entity
@Table(name = "tb_role")
public class Role implements GrantedAuthority {
    @Id
    private Long id;
    private String name;
    private String password;

    @Transient
    @ManyToMany(mappedBy = "roles")
    private Set<User> users;



    public Role(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public String getAuthority() {
        return getName();
    }
}
