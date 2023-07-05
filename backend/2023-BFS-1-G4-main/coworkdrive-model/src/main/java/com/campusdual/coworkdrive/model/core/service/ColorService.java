package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.IColorService;
import com.campusdual.coworkdrive.model.core.dao.CarDao;
import com.campusdual.coworkdrive.model.core.dao.ColorDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("ColorService")
public class ColorService implements IColorService {
    @Autowired
    private ColorDao colorDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;
    @Override
    public EntityResult colorQuery(Map<String, Object> keyMap, List<String> attrList) {
        if (keyMap.get(ColorDao.ATTR_ID_COLOR) instanceof String) {
            keyMap.put(ColorDao.ATTR_ID_COLOR, Integer.parseInt((String) keyMap.get(ColorDao.ATTR_ID_COLOR)));
        }
        return this.daoHelper.query(colorDao, keyMap, attrList);
    }

    @Override
    public EntityResult colorInsert(Map<String, Object> attrMap) {
        return  this.daoHelper.insert(colorDao, attrMap);
    }

    @Override
    public EntityResult colorUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(colorDao, attrMap, keyMap);
    }

    @Override
    public EntityResult colorDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(colorDao, keyMap);
    }
}
