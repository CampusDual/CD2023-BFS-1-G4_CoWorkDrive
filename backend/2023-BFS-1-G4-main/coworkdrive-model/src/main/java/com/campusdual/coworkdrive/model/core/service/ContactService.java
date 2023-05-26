package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.IContactService;
import com.campusdual.coworkdrive.model.core.dao.ContactDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("ContactService")
public class ContactService implements IContactService {
    @Autowired
    private ContactDao contactDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult contactQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(contactDao, keyMap, attrList);
    }

    @Override
    public EntityResult contactInsert(Map<?, ?> attrMap) {
        return this.daoHelper.insert(contactDao, attrMap);
    }

    @Override
    public EntityResult contactUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap) {
        return this.daoHelper.update(contactDao, attrMap, keyMap);
    }

    @Override
    public EntityResult contactDelete(Map<?, ?> keyMap) {
        return this.daoHelper.delete(contactDao, keyMap);
    }
}