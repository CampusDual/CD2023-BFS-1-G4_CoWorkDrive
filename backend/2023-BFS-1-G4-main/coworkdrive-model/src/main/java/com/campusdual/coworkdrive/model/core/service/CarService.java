package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.ICarService;
import com.campusdual.coworkdrive.model.core.dao.CarDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Service implementation for managing cars.
 */
@Lazy
@Service("CarService")
public class CarService implements ICarService {
    
    private static final String PRIMARYUSERKEY = "id_user";
    
    @Autowired
    private CarDao carDao;
    
    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;
    
    /**
     * Retrieves cars based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the queried cars.
     */
    @Override
    public EntityResult carQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        if (keyMap.get(CarDao.ATTR_ID_CAR) instanceof String) {
            keyMap.put(CarDao.ATTR_ID_CAR, Integer.parseInt((String) keyMap.get(CarDao.ATTR_ID_CAR)));
        }
        return this.daoHelper.query(carDao, keyMap, attrList,CarDao.QUERY_CAR_DATA);
    }

    /**
     * Retrieves active cars based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the queried active cars.
     */
    @Override
    public EntityResult carActiveQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());

        // Convert the id_car value from String to Integer if necessary
        if (keyMap.get(CarDao.ATTR_ID_CAR) instanceof String) {
            keyMap.put(CarDao.ATTR_ID_CAR, Integer.parseInt((String) keyMap.get(CarDao.ATTR_ID_CAR)));
        }

        return this.daoHelper.query(carDao, keyMap, attrList, CarDao.QUERY_CAR_DATA_ACTIVE);
    }

    
    /**
     * Inserts a new car based on the provided attribute map.
     *
     * @param attrMap   The attribute map containing the details of the car.
     * @return          The resulting EntityResult containing the inserted car.
     */
    @Override
    public EntityResult carInsert(Map<String, Object> attrMap) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        attrMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.insert(carDao, attrMap);
    }
    
    /**
     * Updates an existing car based on the provided attribute and key maps.
     *
     * @param attrMap   The attribute map containing the updated details of the car.
     * @param keyMap    The key map containing the identifiers of the car to update.
     * @return          The resulting EntityResult containing the updated car.
     */
    @Override
    public EntityResult carUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(carDao, attrMap, keyMap);
    }
    
    /**
     * Deletes a car based on the provided key map.
     *
     * @param keyMap    The key map containing the identifiers of the car to delete.
     * @return          The resulting EntityResult indicating the success of the deletion operation.
     */
    @Override
    public EntityResult carDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(carDao, keyMap);
    }
    
    /**
     * Retrieves the number of cars based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the number of cars.
     */
    @Override
    public EntityResult numberCarsQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.query(carDao, keyMap, attrList, CarDao.QUERY_NUMBER_CARS);
    }
}
