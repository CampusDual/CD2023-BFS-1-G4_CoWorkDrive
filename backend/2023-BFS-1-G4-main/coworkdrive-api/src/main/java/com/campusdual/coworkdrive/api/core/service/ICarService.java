package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface ICarService {
    EntityResult carQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult carInsert(Map<String, Object> attrMap);

    EntityResult carUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap);

    EntityResult carDelete(Map<String, Object> keyMap);
}
