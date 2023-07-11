package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface ITripHistoricalService {

    EntityResult tripHistoricalQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult tripHistoricalInsert(Map<String, Object> attrMap);

    EntityResult tripHistoricalDelete(Map<String, Object> keyMap);
}
