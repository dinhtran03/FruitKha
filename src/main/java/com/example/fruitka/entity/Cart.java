package com.example.fruitka.entity;

import java.util.Date;
import java.util.List;

public class Cart {
    private int id;
    private User user;
    private List<CartItem> cartItems;
    private int subTotal;
    private Date createdAt;

    public Cart(int id, User user, List<CartItem> cartItems, int subTotal, Date createdAt) {
        super();
        this.id = id;
        this.user = user;
        this.cartItems = cartItems;
        this.subTotal = subTotal;
        this.createdAt = createdAt;
    }

    public Cart() {
        super();
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public int getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(int subTotal) {
        this.subTotal = subTotal;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

}
