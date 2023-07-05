package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface ICarBrandService {
    EntityResult carBrandQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult carBrandInsert(Map<String, Object> attrMap);

    EntityResult carBrandUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap);

    EntityResult carBrandDelete(Map<String, Object> keyMap);
}
