package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface IHeadquarterService {

    EntityResult headquarterQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult headquarterQuantityQuery(Map<String, Object> keyMap, List<String> attrList);
}
