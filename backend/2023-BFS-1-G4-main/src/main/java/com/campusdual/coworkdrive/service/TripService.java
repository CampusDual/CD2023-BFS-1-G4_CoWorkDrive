package com.campusdual.coworkdrive.service;

import com.campusdual.coworkdrive.api.ITripService;
import com.campusdual.coworkdrive.model.Trip;
import com.campusdual.coworkdrive.model.dao.TripDao;
import com.campusdual.coworkdrive.model.dto.TripDTO;
import com.campusdual.coworkdrive.model.dto.dtomapper.TripMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

@Service("TripService")
@Lazy
public class TripService implements ITripService {
    
    @Autowired
    private TripDao tripDao;
    
    @Override
    public TripDTO insertTrip(TripDTO tripDTO) {
        Trip trip = TripMapper.INSTANCE.toEntity(tripDTO);
        if(trip != null){
            tripDao.saveAndFlush(trip);
            return tripDTO;
        }
        
        return null;
    }
}
