package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface IBookingService {
    EntityResult bookingQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult bookingInsert(Map<String, Object> attrMap);

    EntityResult bookingDelete(Map<String, Object> keyMap);
}
