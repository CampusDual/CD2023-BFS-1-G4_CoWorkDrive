package com.campusdual.coworkdrive.model.dto.dtomapper;

import com.campusdual.coworkdrive.model.Trip;
import com.campusdual.coworkdrive.model.dto.TripDTO;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-05-18T09:05:51+0200",
    comments = "version: 1.5.3.Final, compiler: javac, environment: Java 20.0.1 (Oracle Corporation)"
)
public class TripMapperImpl implements TripMapper {

    @Override
    public TripDTO toDTO(Trip trip) {
        if ( trip == null ) {
            return null;
        }

        TripDTO tripDTO = new TripDTO();

        tripDTO.setId_trip( trip.getId_trip() );
        tripDTO.setOrigin( trip.getOrigin() );
        tripDTO.setDestination( trip.getDestination() );
        tripDTO.setDate( trip.getDate() );
        tripDTO.setHour( trip.getHour() );

        return tripDTO;
    }

    @Override
    public List<TripDTO> toDTOList(List<Trip> trips) {
        if ( trips == null ) {
            return null;
        }

        List<TripDTO> list = new ArrayList<TripDTO>( trips.size() );
        for ( Trip trip : trips ) {
            list.add( toDTO( trip ) );
        }

        return list;
    }

    @Override
    public Trip toEntity(TripDTO tripDTO) {
        if ( tripDTO == null ) {
            return null;
        }

        Trip trip = new Trip();

        trip.setId_trip( tripDTO.getId_trip() );
        trip.setOrigin( tripDTO.getOrigin() );
        trip.setDestination( tripDTO.getDestination() );
        trip.setDate( tripDTO.getDate() );
        trip.setHour( tripDTO.getHour() );

        return trip;
    }
}
