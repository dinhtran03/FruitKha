package com.example.fruitka.entity;

import com.example.fruitka.enums.OrderStatus;

import java.util.Date;

public class Order {
    private int id;
    private String paymentMethod;
    private int totalPrice;
    private String note;
    private OrderStatus status;
    private User customer;
    private ShippingAddress shippingAddress;
    private Date createdAt;

    public Order(int id, String paymentMethod, int totalPrice, String note, OrderStatus status, User customer, ShippingAddress shippingAddress, Date createdAt) {
        super();
        this.id = id;
        this.paymentMethod = paymentMethod;
        this.totalPrice = totalPrice;
        this.note = note;
        this.status = status;
        this.customer = customer;
        this.shippingAddress = shippingAddress;
        this.createdAt = createdAt;
    }

    public Order() {
        super();
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public ShippingAddress getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(ShippingAddress shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
