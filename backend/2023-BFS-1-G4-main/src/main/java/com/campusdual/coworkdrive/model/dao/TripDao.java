package com.campusdual.coworkdrive.model.dao;

import com.campusdual.coworkdrive.model.Trip;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TripDao extends JpaRepository<Trip,Integer> {
}
