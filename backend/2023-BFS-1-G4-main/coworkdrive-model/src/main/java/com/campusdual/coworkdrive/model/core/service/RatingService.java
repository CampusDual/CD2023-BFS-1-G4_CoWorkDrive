package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.IRatingService;
import com.campusdual.coworkdrive.model.core.dao.RatingDao;
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
@Service("RatingService")
public class RatingService implements IRatingService {
    private static final String PRIMARYUSERKEY = "id_user";
    @Autowired
    private RatingDao ratingDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;
    @Override
    public EntityResult ratingQuery(Map<String, Object> keyMap, List<String> attrList) {
        if (keyMap.get(RatingDao.ATTR_ID_RATING) instanceof String) {
            keyMap.put(RatingDao.ATTR_ID_RATING, Integer.parseInt((String) keyMap.get(RatingDao.ATTR_ID_RATING)));
        }
        return this.daoHelper.query(ratingDao, keyMap, attrList);
    }

    @Override
    public EntityResult isRatedQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.query(ratingDao, keyMap, attrList, RatingDao.QUERY_IS_RATED);
    }

    @Override
    public EntityResult ratingInsert(Map<String, Object> attrMap) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        attrMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.insert(ratingDao, attrMap);
    }

    @Override
    public EntityResult ratingUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(ratingDao, attrMap, keyMap);
    }

    @Override
    public EntityResult ratingDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(ratingDao, keyMap);
    }
}
