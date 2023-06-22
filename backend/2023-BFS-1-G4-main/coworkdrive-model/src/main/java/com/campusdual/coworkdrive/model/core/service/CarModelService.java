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

    @Override
    public EntityResult carModelQuery(Map<String, Object> keyMap, List<String> attrList) {
        return this.daoHelper.query(carModelDao, keyMap, attrList);
    }

    @Override
    public EntityResult carModelInsert(Map<String, Object> attrMap) {
        return this.daoHelper.insert(carModelDao, attrMap);
    }

    @Override
    public EntityResult carModelUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(carModelDao, attrMap, keyMap);
    }

    @Override
    public EntityResult carModelDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(carModelDao, keyMap);
    }
}
