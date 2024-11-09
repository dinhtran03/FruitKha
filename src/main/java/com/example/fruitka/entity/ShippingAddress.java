package com.example.fruitka.entity;

public class ShippingAddress {
    private int id;
    private String address;
    private String name;
    private String phone;
    private User user;
    private boolean isDefault;
    private boolean isDeleted;

    public ShippingAddress(int id, String name, String phone, String address, User user, boolean isDefault, boolean isDeleted) {
        super();
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.user = user;
        this.isDefault = isDefault;
        this.isDeleted = isDeleted;
    }

    public ShippingAddress() {
        super();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(boolean isDefault) {
        this.isDefault = isDefault;
    }

    public boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }
}
