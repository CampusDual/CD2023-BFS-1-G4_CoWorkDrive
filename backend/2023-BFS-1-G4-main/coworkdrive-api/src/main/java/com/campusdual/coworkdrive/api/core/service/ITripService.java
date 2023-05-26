package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface ITripService {
    EntityResult tripQuery(Map<?, ?> keyMap, List<?> attrList);

    EntityResult tripInsert(Map<?, ?> attrMap);

    EntityResult tripUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap);

    EntityResult tripDelete(Map<?, ?> keyMap);
}
