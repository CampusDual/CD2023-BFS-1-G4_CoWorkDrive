package com.campusdual.coworkdrive.model.dto.dtomapper;

import com.campusdual.coworkdrive.model.Car;
import com.campusdual.coworkdrive.model.dto.CarDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

@Mapper
public interface CarMapper {
    
    CarMapper INSTANCE = Mappers.getMapper(CarMapper.class);
    
    CarDTO toDTO(Car car);
    
    List<CarDTO> toDTOList(List<Car> contacts);
    
    Car toEntity(CarDTO carDTO);
}
