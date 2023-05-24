package com.campusdual.coworkdrive.api;

import com.campusdual.coworkdrive.model.dto.TripDTO;

public interface ITripService {
    
    TripDTO insertTrip(TripDTO tripDTO);
}
