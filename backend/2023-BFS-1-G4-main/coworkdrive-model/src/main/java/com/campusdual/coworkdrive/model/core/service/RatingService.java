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

    /**
     * Executes a query to retrieve rating information based on the provided key attributes.
     * If the ID rating attribute is a String, it is converted to an Integer.
     * @param keyMap    The map containing the key attributes used for the query.
     * @param attrList  The list of attributes to include in the result.
     * @return          An EntityResult containing the rating information.
     */
    @Override
    public EntityResult ratingQuery(Map<String, Object> keyMap, List<String> attrList) {
        if (keyMap.get(RatingDao.ATTR_ID_RATING) instanceof String) {
            keyMap.put(RatingDao.ATTR_ID_RATING, Integer.parseInt((String) keyMap.get(RatingDao.ATTR_ID_RATING)));
        }
        return this.daoHelper.query(ratingDao, keyMap, attrList);
    }

    /**
     * Executes a query to check if the current user has already rated a certain entity.
     * Retrieves the current user's authentication information and adds it to the key attributes.
     * @param keyMap    The map containing the key attributes used for the query.
     * @param attrList  The list of attributes to include in the result.
     * @return          An EntityResult indicating if the user has rated the entity.
     */
    @Override
    public EntityResult isRatedQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.query(ratingDao, keyMap, attrList, RatingDao.QUERY_IS_RATED);
    }

    /**
     * Inserts a new rating entry into the database.
     * Retrieves the current user's authentication information and adds it to the attribute map.
     * @param attrMap   The map containing the attributes to be inserted.
     * @return          An EntityResult indicating the success of the insert operation.
     */
    @Override
    public EntityResult ratingInsert(Map<String, Object> attrMap) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        attrMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.insert(ratingDao, attrMap);
    }

    /**
     * Updates an existing rating entry in the database.
     * @param attrMap   The map containing the updated attributes.
     * @param keyMap    The map containing the key attributes to identify the rating entry.
     * @return          An EntityResult indicating the success of the update operation.
     */
    @Override
    public EntityResult ratingUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(ratingDao, attrMap, keyMap);
    }

    /**
     * Deletes a rating entry from the database based on the provided key attributes.
     * @param keyMap    The map containing the key attributes to identify the rating entry.
     * @return          An EntityResult indicating the success of the delete operation.
     */
    @Override
    public EntityResult ratingDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(ratingDao, keyMap);
    }
}
