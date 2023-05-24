package com.campusdual.coworkdrive.model.dto.dtomapper;

import com.campusdual.coworkdrive.model.Car;
import com.campusdual.coworkdrive.model.dto.CarDTO;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-05-18T09:05:51+0200",
    comments = "version: 1.5.3.Final, compiler: javac, environment: Java 20.0.1 (Oracle Corporation)"
)
public class CarMapperImpl implements CarMapper {

    @Override
    public CarDTO toDTO(Car car) {
        if ( car == null ) {
            return null;
        }

        CarDTO carDTO = new CarDTO();

        carDTO.setId_car( car.getId_car() );
        carDTO.setCar_brand( car.getCar_brand() );
        carDTO.setSeats( car.getSeats() );
        carDTO.setCar_registration( car.getCar_registration() );
        carDTO.setModel( car.getModel() );

        return carDTO;
    }

    @Override
    public List<CarDTO> toDTOList(List<Car> contacts) {
        if ( contacts == null ) {
            return null;
        }

        List<CarDTO> list = new ArrayList<CarDTO>( contacts.size() );
        for ( Car car : contacts ) {
            list.add( toDTO( car ) );
        }

        return list;
    }

    @Override
    public Car toEntity(CarDTO carDTO) {
        if ( carDTO == null ) {
            return null;
        }

        Car car = new Car();

        car.setId_car( carDTO.getId_car() );
        car.setCar_brand( carDTO.getCar_brand() );
        car.setSeats( carDTO.getSeats() );
        car.setCar_registration( carDTO.getCar_registration() );
        car.setModel( carDTO.getModel() );

        return car;
    }
}
