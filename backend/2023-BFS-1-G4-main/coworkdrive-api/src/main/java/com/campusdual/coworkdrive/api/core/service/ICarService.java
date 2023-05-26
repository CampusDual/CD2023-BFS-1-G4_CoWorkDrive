package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface ICarService {
    EntityResult carQuery(Map<?, ?> keyMap, List<?> attrList);

    EntityResult carInsert(Map<?, ?> attrMap);

    EntityResult carUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap);

    EntityResult carDelete(Map<?, ?> keyMap);
}
