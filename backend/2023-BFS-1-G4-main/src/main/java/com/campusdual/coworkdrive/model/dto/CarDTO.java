package com.campusdual.coworkdrive.model.dto;


public class CarDTO {
    
    private Integer id_car;
    
    
    private String car_brand;
    
    
    private Integer seats;
    
    private String model;
    
    private String car_registration;
    
    private Integer id_contact;
    
    public Integer getId_car() {
        return id_car;
    }
    
    public void setId_car(Integer id_car) {
        this.id_car = id_car;
    }
    
    public String getCar_brand() {
        return car_brand;
    }
    
    public void setCar_brand(String car_brand) {
        this.car_brand = car_brand;
    }
    
    public Integer getSeats() {
        return seats;
    }
    
    public void setSeats(Integer seats) {
        this.seats = seats;
    }
    
    public String getCar_registration() {
        return car_registration;
    }
    
    public void setCar_registration(String car_registration) {
        this.car_registration = car_registration;
    }
    
    public String getModel() {
        return model;
    }
    
    public void setModel(String model) {
        this.model = model;
    }
    
    public Integer getId_contact() {
        return id_contact;
    }
    
    public void setId_contact(Integer id_contact) {
        this.id_contact = id_contact;
    }
}
