package com.example.fruitka.entity;

public class New {
    private int id;
    private String title;
    private String content;
    private String image;
    private User user;
    private String createdAt;

    public New(int id, String title, String content, String image, User user, String createdAt) {
        super();
        this.id = id;
        this.title = title;
        this.content = content;
        this.image = image;
        this.user = user;
        this.createdAt = createdAt;
    }

    public New() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
