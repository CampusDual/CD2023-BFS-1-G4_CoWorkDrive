package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.ICarBrandService;
import com.campusdual.coworkdrive.model.core.dao.CarBrandDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("CarBrandService")
public class CarBrandService implements ICarBrandService {
    @Autowired
    private CarBrandDao carBrandDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    /**
     * Executes a query to retrieve car brand information based on the provided key map and attribute list.
     *
     * @param keyMap   a map containing the query key-value pairs
     * @param attrList a list of attributes to be included in the query result
     * @return an EntityResult object containing the query result
     */
    @Override
    public EntityResult carBrandQuery(Map<String, Object> keyMap, List<String> attrList) {
        return this.daoHelper.query(carBrandDao, keyMap, attrList);
    }

    /**
     * Inserts a new car brand record into the database using the provided attribute map.
     *
     * @param attrMap a map containing the attribute key-value pairs for the new car brand
     * @return an EntityResult object containing the result of the insert operation
     */
    @Override
    public EntityResult carBrandInsert(Map<String, Object> attrMap) {
        return this.daoHelper.insert(carBrandDao, attrMap);
    }

    /**
     * Updates an existing car brand record in the database with the new attribute values specified in the attribute map.
     *
     * @param attrMap a map containing the attribute key-value pairs for the car brand update
     * @param keyMap  a map containing the key-value pairs to identify the car brand record to be updated
     * @return an EntityResult object containing the result of the update operation
     */
    @Override
    public EntityResult carBrandUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(carBrandDao, attrMap, keyMap);
    }

    /**
     * Deletes an existing car brand record from the database based on the provided key map.
     *
     * @param keyMap a map containing the key-value pairs to identify the car brand record to be deleted
     * @return an EntityResult object containing the result of the delete operation
     */
    @Override
    public EntityResult carBrandDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(carBrandDao, keyMap);
    }
}
