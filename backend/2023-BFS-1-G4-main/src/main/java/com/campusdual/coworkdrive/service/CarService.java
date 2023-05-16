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
    public String insertCar(CarDTO carDTO) {
        Car car = CarMapper.INSTANCE.toEntity(carDTO);
        if(car != null){
            if ( car.getCar_brand() == null ){
                return "Tienes que rellenar todos los campos";
            }
            if ( car.getCar_registration() == null ){
                return "Tienes que rellenar todos los campos";
            }
            if ( car.getModel() == null ){
                return "Tienes que rellenar todos los campos";
            }
            if ( car.getSeats() == null ){
                return "Tienes que rellenar todos los campos";
            }
            carDao.saveAndFlush(car);
        }
        return "Coche registrado con éxito";
    }
}
