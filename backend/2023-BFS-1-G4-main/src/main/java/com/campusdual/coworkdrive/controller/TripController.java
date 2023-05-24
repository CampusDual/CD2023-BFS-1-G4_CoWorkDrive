package com.campusdual.coworkdrive.controller;

import com.campusdual.coworkdrive.api.ICarService;
import com.campusdual.coworkdrive.api.ITripService;
import com.campusdual.coworkdrive.model.dto.CarDTO;
import com.campusdual.coworkdrive.model.dto.TripDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/trips")
public class TripController {
    
    @Autowired
    private ITripService tripService;
    
    @PostMapping(value = "/register")
    public TripDTO insertTrip(@RequestBody TripDTO tripDTO) {
        return tripService.insertTrip(tripDTO);
    }
}
