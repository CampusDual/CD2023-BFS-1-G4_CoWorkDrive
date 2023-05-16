package com.campusdual.coworkdrive.model.dto.dtomapper;

import com.campusdual.coworkdrive.model.Trip;
import com.campusdual.coworkdrive.model.dto.TripDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;
@Mapper
public interface TripMapper {
    TripMapper INSTANCE = Mappers.getMapper(TripMapper.class);
    
    TripDTO toDTO(Trip trip);
    
    List<TripDTO> toDTOList(List<Trip> trips);
    
    Trip toEntity(TripDTO tripDTO);
}
