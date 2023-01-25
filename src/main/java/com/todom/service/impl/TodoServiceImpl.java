package com.todom.service.impl;

import com.todom.entity.Todo;
import com.todom.repository.TodoRepository;
import com.todom.repository.UserRepository;
import com.todom.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;

@Service
public class TodoServiceImpl implements TodoService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private TodoRepository todoRepo;


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    @Override
    public Todo getById(long id) {
        return todoRepo.findById(id).orElseThrow(() -> new NoSuchElementException());
    }

    @Override
    public void addTodo(Todo todo) {
        todoRepo.save(todo);
    }

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
        todo.setDate(new Date());
        todoRepo.save(todo);
    }

    @Override
    public void todoNotCompleted(long id) {
        Todo todo = todoRepo.findById(id).orElseThrow(() -> new NoSuchElementException());
        todo.setStatus(false);
        todo.setDate(new Date());
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
