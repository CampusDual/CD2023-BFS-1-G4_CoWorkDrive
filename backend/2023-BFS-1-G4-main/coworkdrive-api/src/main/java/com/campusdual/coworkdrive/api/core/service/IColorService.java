package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface IColorService {
    EntityResult colorQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult colorInsert(Map<String, Object> attrMap);

    EntityResult colorUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap);

    EntityResult colorDelete(Map<String, Object> keyMap);
}
