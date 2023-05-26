package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.ICarService;
import com.campusdual.coworkdrive.model.core.dao.CarDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Lazy
@Service("CarService")
public class CarService implements ICarService {
    @Autowired
    private CarDao carDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult carQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(carDao,keyMap,attrList);
    }

    @Override
    public EntityResult carInsert(Map<?, ?> attrMap) {
        return this.daoHelper.insert(carDao,attrMap);
    }

    @Override
    public EntityResult carUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap) {
        return this.daoHelper.update(carDao,attrMap,keyMap);
    }

    @Override
    public EntityResult carDelete(Map<?, ?> keyMap) {
        return this.daoHelper.delete(carDao,keyMap);
    }
}