package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface ICarModelService {
    EntityResult carModelQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult carModelInsert(Map<String, Object> attrMap);

    EntityResult carModelUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap);

    EntityResult carModelDelete(Map<String, Object> keyMap);
}
