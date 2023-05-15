package com.campusdual.coworkdrive.model.dto;


public class ContactDTO {
   
    private Integer id_contact;
    
    
    private String first_name;
    
   
    private String last_name;
    
   
    private String second_last_name;
    
    
    private String email;
    
   
    private String password;
    
    public Integer getId_contact() {
        return id_contact;
    }
    
    public void setId_contact(Integer id_contact) {
        this.id_contact = id_contact;
    }
    
    public String getFirst_name() {
        return first_name;
    }
    
    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }
    
    public String getLast_name() {
        return last_name;
    }
    
    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }
    
    public String getSecond_last_name() {
        return second_last_name;
    }
    
    public void setSecond_last_name(String second_last_name) {
        this.second_last_name = second_last_name;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
}
