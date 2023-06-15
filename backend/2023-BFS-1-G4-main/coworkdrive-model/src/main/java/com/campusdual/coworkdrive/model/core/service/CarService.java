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

@Lazy
@Service("CarService")
public class CarService implements ICarService {
    private static final String PRIMARYUSERKEY = "id_user";
    @Autowired
    private CarDao carDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult carQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        if(keyMap.get(CarDao.ATTR_ID_CAR) instanceof String){
            keyMap.put(CarDao.ATTR_ID_CAR,Integer.parseInt((String) keyMap.get(CarDao.ATTR_ID_CAR)));
        }
        return this.daoHelper.query(carDao,keyMap,attrList);
    }

    @Override
    public EntityResult carInsert(Map<String, Object> attrMap) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        attrMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.insert(carDao,attrMap);
    }

    @Override
    public EntityResult carUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(carDao,attrMap,keyMap);
    }

    @Override
    public EntityResult carDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(carDao,keyMap);
    }

    @Override
    public EntityResult numberCarsQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.query(carDao,keyMap,attrList,CarDao.QUERY_NUMBER_CARS);
    }
}