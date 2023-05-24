package com.campusdual.coworkdrive.service;

import com.campusdual.coworkdrive.api.ICarService;
import com.campusdual.coworkdrive.model.Car;
import com.campusdual.coworkdrive.model.dao.CarDao;
import com.campusdual.coworkdrive.model.dto.CarDTO;
import com.campusdual.coworkdrive.model.dto.dtomapper.CarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

@Service("CarService")
@Lazy
public class CarService implements ICarService {
    @Autowired
    private CarDao carDao;
    
    @Override
    public CarDTO insertCar(CarDTO carDTO) {
        Car car = CarMapper.INSTANCE.toEntity(carDTO);
        if(car != null){
            carDao.saveAndFlush(car);
            return carDTO;
        }
       
        return null;
    }
}
