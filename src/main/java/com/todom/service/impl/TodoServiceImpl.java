package com.todom.service.impl;

import com.todom.entity.Todo;
import com.todom.repository.TodoRepository;
import com.todom.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class TodoServiceImpl implements TodoService {
    @Autowired
    private TodoRepository todoRepo;


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    @Override
    public Todo getById(long id) {
        return todoRepo.findById(id).orElseThrow(NoSuchElementException::new);
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
        Todo todo = todoRepo.findById(id).orElseThrow(NoSuchElementException::new);
        todo.setStatus(true);
        todo.setDate(new Date());
        todoRepo.save(todo);
    }

    @Override
    public void todoNotCompleted(long id) {
        Todo todo = todoRepo.findById(id).orElseThrow(NoSuchElementException::new);
        todo.setStatus(false);
        todo.setDate(new Date());
        todoRepo.save(todo);
    }

    @Override
    public List<Todo> listNotCompletedTodos(String username) {
        List<Todo> listTodos = todoRepo.findAllByOwnerUsernameAndStatusIsFalse(username);
        Collections.sort(listTodos);
        return listTodos;
    }

    @Override
    public List<Todo> listCompletedTodos(String username) {
        return todoRepo.findAllByOwnerUsernameAndStatusIsTrue(username);
    }

    @Override
    public void deleteAllTodoByStatus(String username) {
        List<Todo> listCompletedTodo = listCompletedTodos(username);
        listCompletedTodo.forEach(n -> todoRepo.deleteById(n.getId()));
    }

    @Override
    public void deleteAllByOwnerUsername(String username) {
        List<Todo> listTodos = todoRepo.findAllByOwnerUsername(username);
        listTodos.forEach(n -> todoRepo.deleteById(n.getId()));
    }

}
