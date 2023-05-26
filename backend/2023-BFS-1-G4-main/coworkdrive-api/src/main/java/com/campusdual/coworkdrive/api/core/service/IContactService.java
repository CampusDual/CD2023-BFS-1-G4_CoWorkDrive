package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface IContactService {
    EntityResult contactQuery(Map<?, ?> keyMap, List<?> attrList);

    EntityResult contactInsert(Map<?, ?> attrMap);

    EntityResult contactUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap);

    EntityResult contactDelete(Map<?, ?> keyMap);
}
