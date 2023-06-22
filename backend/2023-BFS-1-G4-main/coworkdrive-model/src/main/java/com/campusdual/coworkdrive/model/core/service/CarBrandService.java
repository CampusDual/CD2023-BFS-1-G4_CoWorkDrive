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

    @Override
    public EntityResult carBrandQuery(Map<String, Object> keyMap, List<String> attrList) {
        return this.daoHelper.query(carBrandDao, keyMap, attrList);
    }

    @Override
    public EntityResult carBrandInsert(Map<String, Object> attrMap) {
        return this.daoHelper.insert(carBrandDao, attrMap);
    }

    @Override
    public EntityResult carBrandUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(carBrandDao, attrMap, keyMap);
    }

    @Override
    public EntityResult carBrandDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(carBrandDao, keyMap);
    }
}
