package com.todom.service;

import com.todom.entity.Todo;
import java.util.Date;
import java.util.List;

public interface TodoService {
    Todo getById(long id);
    void addTodo(Todo todo);
    void deleteTodo(long id);
    void updateTodo(Todo todo);
    void todoCompleted(long id);
//    void addNewTodo(String description, String ownerUsername, Date date, Boolean status);
    List<Todo> listCompletedTodos(String username);
    List<Todo> listNotCompletedTodos(String username);}
