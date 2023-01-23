package com.todom.controller;

import com.todom.entity.Todo;
import com.todom.service.TodoService;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/todo")
public class TodoController {
    private final TodoService service;

    public TodoController(TodoService service) {
        this.service = service;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }


    //POST
    @PostMapping("/add")
    public String addTodo(ModelMap model, @Valid Todo todo, BindingResult result) {
        if (result.hasErrors()){
            return "todo";
        }

        todo.setOwnerUsername(getLoggedInUserName(model));
        service.addTodo(todo);
        return "redirect:/todo";
    }

    //?Update
    @PostMapping("/update")
    public String updateTodo(ModelMap model, @Valid Todo todo, BindingResult result) {

        if (result.hasErrors()) {
            return "todo";
        }

        todo.setOwnerUsername(getLoggedInUserName(model));
        service.updateTodo(todo);
        return "redirect:/todo";
    }

    //GET
    @GetMapping("/add")
    public String showAddTodoPage(ModelMap model) {
        model.addAttribute("todoForm", new Todo());
        return "add-todo";
    }

    @GetMapping("/update")
    public String showUpdateTodoPage(@RequestParam long id, ModelMap model) {
        Todo todo = service.getById(id);
        model.put("todoForm", todo);
        return "add-todo";
    }

    @GetMapping("/complete")
    public String completeTodo(@RequestParam long id) {
        service.todoCompleted(id);
        return "redirect:/todo";
    }

    @GetMapping
    public String getListNotCompletedTodos(ModelMap model){
        String username = getLoggedInUserName(model);
        model.addAttribute("todoList", service.listNotCompletedTodos(username));
        return "todo";
    }

    @GetMapping("/trash")
    public String getListCompletedTodos(ModelMap model) {
        String username = getLoggedInUserName(model);
        model.addAttribute("todoListTrash", service.listCompletedTodos(username));
        return "trash";
    }

    //DELETE
    @GetMapping("/delete")
    public String deleteTodo(@RequestParam long id) {
        service.deleteTodo(id);
        return "redirect:/todo";
    }

    //Get username
    private String getLoggedInUserName(ModelMap model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            return ((UserDetails) principal).getUsername();
        }

        return principal.toString();
    }
}
