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
public class Todo implements Comparable<Todo>{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    String description;
    String ownerUsername;
    Date date;
    Boolean status = Boolean.FALSE;

    @Override
    public int compareTo(Todo o) {
        return this.getDate().compareTo(o.getDate());
    }
}
