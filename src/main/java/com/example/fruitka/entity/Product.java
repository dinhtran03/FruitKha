package com.example.fruitka.entity;

import java.util.Date;

public class Product {
    private int id;
    private String name;
    private String slug;
    private int price;
    private int salePrice;
    private int quantity;
    private String description;
    private String image;
    private Category category;
    private Date createdAt;

    public Product(int id, String name, String slug, int price, int salePrice, int quantity, String description,
                   String image, Category category, Date createdAt) {
        super();
        this.id = id;
        this.name = name;
        this.slug = slug;
        this.price = price;
        this.salePrice = salePrice;
        this.quantity = quantity;
        this.description = description;
        this.image = image;
        this.category = category;
        this.createdAt = createdAt;
    }

    public Product() {
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

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Category getCategory() {
        return this.category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Category getGetCategory() {
        return this.category;
    }
}
