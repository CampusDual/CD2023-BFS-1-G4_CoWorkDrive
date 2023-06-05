package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.ITripService;
import com.campusdual.coworkdrive.model.core.dao.TripDao;
import com.ontimize.jee.common.db.SQLStatementBuilder;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicExpression;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicField;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicOperator;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.common.security.PermissionsProviderSecured;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
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
    public EntityResult tripQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put("id_user", auth.getName());
        return this.daoHelper.query(tripDao, keyMap, attrList);
    }

    @Override
    public EntityResult tripGetAllQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(SQLStatementBuilder.ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY,
                getExpression("id_user", auth.getName()));
        return this.daoHelper.query(tripDao, keyMap, attrList, TripDao.QUERY_ALL_TRIPS);
    }

    @Override
    //@Secured({ PermissionsProviderSecured.SECURED })
    public EntityResult tripInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        attrMap.put("id_user", auth.getName());
        return this.daoHelper.insert(this.tripDao, attrMap);
    }

    @Override
    public EntityResult tripUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(tripDao, attrMap, keyMap);
    }

    @Override
    public EntityResult tripDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(this.tripDao, keyMap);
    }

    private BasicExpression getExpression(String param, String value) {

        BasicField field = new BasicField(param);
        BasicExpression bexp2 = new BasicExpression(field,BasicOperator.NOT_EQUAL_OP,value);
        return bexp2;
    }
}