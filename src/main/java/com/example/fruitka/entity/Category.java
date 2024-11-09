package com.example.fruitka.entity;

import java.util.Date;

public class Category {
    private int id;
    private String name;
    private Date createdAt;

    public Category(int id, String name, Date createdAt) {
        super();
        this.id = id;
        this.name = name;
        this.createdAt = createdAt;
    }

    public Category() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}