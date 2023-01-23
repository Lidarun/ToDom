package com.todom.service.impl;

import com.todom.entity.Todo;
import com.todom.repository.TodoRepository;
import com.todom.repository.UserRepository;
import com.todom.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;

@Service
public class TodoServiceImpl implements TodoService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private TodoRepository todoRepo;

    @Override
    public Todo getById(long id) {
        return todoRepo.findById(id).orElseThrow(() -> new NoSuchElementException());
    }

    @Override
    public void addTodo(Todo todo) {
        todoRepo.save(todo);
    }

//    @Override
//    public void addNewTodo(String description, String ownerUsername, Date date, Boolean status) {
//        todoRepo.save(new Todo(description, ownerUsername, date, status));
//    }

    @Override
    public void deleteTodo(long id) {
        todoRepo.deleteById(id);
    }

    @Override
    public void updateTodo(Todo todo) {
        todoRepo.save(todo);
    }

    @Override
    public void todoCompleted(long id) {
        Todo todo = todoRepo.findById(id).orElseThrow(() -> new NoSuchElementException());
        todo.setStatus(true);
        todoRepo.save(todo);
    }

    @Override
    public List<Todo> listNotCompletedTodos(String username) {
        return todoRepo.findAllByOwnerUsernameAndStatusIsFalse(username);
    }


    @Override
    public List<Todo> listCompletedTodos(String username) {
        return todoRepo.findAllByOwnerUsernameAndStatusIsTrue(username);
    }


}
