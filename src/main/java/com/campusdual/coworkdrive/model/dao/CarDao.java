package com.campusdual.coworkdrive.model.dao;

import com.campusdual.coworkdrive.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarDao extends JpaRepository<Car,Integer> {
}
