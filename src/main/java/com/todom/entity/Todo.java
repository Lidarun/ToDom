package com.todom.entity;

import lombok.*;
import lombok.experimental.FieldDefaults;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "tb_todos")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Todo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    String description;
    String ownerUsername;
    Date date;
    Boolean status = Boolean.FALSE;

//
//    public Todo(String description, String ownerUsername, Date date, Boolean status) {
//        this.description = description;
//        this.ownerUsername = ownerUsername;
//        this.date = date;
//        this.status = status;
//    }
}