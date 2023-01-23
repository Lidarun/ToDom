package com.todom.repository;

import com.todom.entity.Todo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TodoRepository extends JpaRepository<Todo, Long> {
    List<Todo> findAllByOwnerUsernameAndStatusIsFalse(String username);
    List<Todo> findAllByOwnerUsernameAndStatusIsTrue(String username);

}
