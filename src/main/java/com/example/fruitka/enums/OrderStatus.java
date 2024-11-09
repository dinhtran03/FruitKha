package com.example.fruitka.enums;

public enum OrderStatus {
    PENDING(), PROCESSING(), SHIPPING(), DELIVERED(), CANCELLED();


    public static OrderStatus getStatus(String status) {
        switch (status) {
            case "PROCESSING":
                return PROCESSING;
            case "SHIPPING":
                return SHIPPING;
            case "DELIVERED":
                return DELIVERED;
            case "CANCELLED":
                return CANCELLED;
            default:
                return PENDING;
        }
    }
}
