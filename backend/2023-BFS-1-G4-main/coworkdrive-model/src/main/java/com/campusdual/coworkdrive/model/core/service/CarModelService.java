package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.ICarModelService;
import com.campusdual.coworkdrive.model.core.dao.CarDao;
import com.campusdual.coworkdrive.model.core.dao.CarModelDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("CarModelService")
public class CarModelService implements ICarModelService {
    @Autowired
    private CarModelDao carModelDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    /**
     * Executes a query to retrieve car model information based on the provided key map and attribute list.
     *
     * @param keyMap   a map containing the query key-value pairs
     * @param attrList a list of attributes to be included in the query result
     * @return an EntityResult object containing the query result
     */
    @Override
    public EntityResult carModelQuery(Map<String, Object> keyMap, List<String> attrList) {
        return this.daoHelper.query(carModelDao, keyMap, attrList);
    }

    /**
     * Inserts a new car model record into the database using the provided attribute map.
     *
     * @param attrMap a map containing the attribute key-value pairs for the new car model
     * @return an EntityResult object containing the result of the insert operation
     */
    @Override
    public EntityResult carModelInsert(Map<String, Object> attrMap) {
        return this.daoHelper.insert(carModelDao, attrMap);
    }

    /**
     * Updates an existing car model record in the database with the new attribute values specified in the attribute map.
     *
     * @param attrMap a map containing the attribute key-value pairs for the car model update
     * @param keyMap  a map containing the key-value pairs to identify the car model record to be updated
     * @return an EntityResult object containing the result of the update operation
     */
    @Override
    public EntityResult carModelUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(carModelDao, attrMap, keyMap);
    }

    /**
     * Deletes an existing car model record from the database based on the provided key map.
     *
     * @param keyMap a map containing the key-value pairs to identify the car model record to be deleted
     * @return an EntityResult object containing the result of the delete operation
     */
    @Override
    public EntityResult carModelDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(carModelDao, keyMap);
    }
}
