package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface ITripService {
    EntityResult tripQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult tripInsert(Map<String, Object> attrMap);

    EntityResult tripUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap);

    EntityResult tripDelete(Map<String, Object> keyMap);
}
