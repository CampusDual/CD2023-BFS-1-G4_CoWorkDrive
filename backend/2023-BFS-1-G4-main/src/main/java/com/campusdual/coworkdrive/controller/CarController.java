package com.campusdual.coworkdrive.controller;

import com.campusdual.coworkdrive.api.ICarService;
import com.campusdual.coworkdrive.api.IContactService;
import com.campusdual.coworkdrive.model.dto.CarDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/cars")
public class CarController {
    @Autowired
    private ICarService carService;
    
    @PostMapping(value = "/insert")
    public String insertCar(CarDTO carDTO) {
        return carService.insertCar(carDTO);
    }
}
