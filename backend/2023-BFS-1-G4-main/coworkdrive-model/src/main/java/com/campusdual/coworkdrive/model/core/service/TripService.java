package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.ITripService;
import com.campusdual.coworkdrive.model.core.dao.TripDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("TripService")
public class TripService implements ITripService {
    @Autowired
    private TripDao tripDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    @Override
    public EntityResult tripQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(tripDao, keyMap, attrList);
    }

    @Override
    public EntityResult tripInsert(Map<?, ?> attrMap) {
        return this.daoHelper.insert(tripDao, attrMap);
    }

    @Override
    public EntityResult tripUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap) {
        return this.daoHelper.update(tripDao, attrMap, keyMap);
    }

    @Override
    public EntityResult tripDelete(Map<?, ?> keyMap) {
        return this.daoHelper.delete(this.tripDao, keyMap);
    }
}