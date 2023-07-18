package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.IHeadquarterService;
import com.campusdual.coworkdrive.model.core.dao.HeadquarterDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("HeadquarterService")
public class HeadquarterService implements IHeadquarterService {
    @Autowired
    private HeadquarterDao headquarterDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    /**

     * Executes a query to retrieve headquarter information based on the provided key map and attribute list.
     * @param keyMap a map containing the query key-value pairs
     * @param attrList a list of attributes to be included in the query result
     * @return an EntityResult object containing the query result
     */
    @Override
    public EntityResult headquarterQuery(Map<String, Object> keyMap, List<String> attrList) {
        if (keyMap.get(HeadquarterDao.ATTR_ID_HEADQUARTER) instanceof String) {
            keyMap.put(HeadquarterDao.ATTR_ID_HEADQUARTER, Integer.parseInt((String) keyMap.get(HeadquarterDao.ATTR_ID_HEADQUARTER)));
        }
        return this.daoHelper.query(headquarterDao, keyMap, attrList);
    }

    /**
     * Executes a query to retrieve the quantity of headquarter information based on the provided key map and attribute list.
     * @param keyMap a map containing the query key-value pairs
     * @param attrList a list of attributes to be included in the query result
     * @return an EntityResult object containing the query result
     */
    @Override
    public EntityResult headquarterQuantityQuery(Map<String, Object> keyMap, List<String> attrList) {
        if (keyMap.get(HeadquarterDao.ATTR_ID_HEADQUARTER) instanceof String) {
            keyMap.put(HeadquarterDao.ATTR_ID_HEADQUARTER, Integer.parseInt((String) keyMap.get(HeadquarterDao.ATTR_ID_HEADQUARTER)));
        }
        return this.daoHelper.query(headquarterDao, keyMap, attrList,HeadquarterDao.QUERY_HEADQUARTER_QUANTITY);
    }
}
