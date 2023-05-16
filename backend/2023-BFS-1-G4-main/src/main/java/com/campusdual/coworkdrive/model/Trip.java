package com.campusdual.coworkdrive.model;

import javax.persistence.*;
import java.sql.Time;
import java.util.Date;

@Entity
@Table(name = "TRIP")
public class Trip {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_trip;
    
    @Column
    private String origin;
    
    @Column
    private String destination;
    
    @Column
    private Date date;
    
    @Column
    private Time hour;
    
    public Integer getId_trip() {
        return id_trip;
    }
    
    public void setId_trip(Integer id_trip) {
        this.id_trip = id_trip;
    }
    
    public String getOrigin() {
        return origin;
    }
    
    public void setOrigin(String origin) {
        this.origin = origin;
    }
    
    public String getDestination() {
        return destination;
    }
    
    public void setDestination(String destination) {
        this.destination = destination;
    }
    
    public Date getDate() {
        return date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    
    public Time getHour() {
        return hour;
    }
    
    public void setHour(Time hour) {
        this.hour = hour;
    }
}
