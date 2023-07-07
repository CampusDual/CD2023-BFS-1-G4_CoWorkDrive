package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface IRatingService {

    EntityResult ratingQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult isRatedQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult ratingInsert(Map<String, Object> attrMap);


    EntityResult ratingUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap);

    EntityResult ratingDelete(Map<String, Object> keyMap);
}
