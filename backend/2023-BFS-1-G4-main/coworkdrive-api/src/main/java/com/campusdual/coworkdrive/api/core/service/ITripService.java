package com.campusdual.coworkdrive.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

public interface ITripService {
    EntityResult tripQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult tripDoneQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult tripDetailQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult bookingQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult tripGetAllQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult moreTripsQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult historicalTripsQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult scheduledTripsQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult numberTripsOnBookingQuery(Map<String, Object> keyMap, List<String> attrList);

    EntityResult tripInsert(Map<String, Object> attrMap) throws ParseException;

    EntityResult tripUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap);

    EntityResult tripDelete(Map<String, Object> keyMap);

    EntityResult getDate(Map<String, Object> attrMap, List<String> attrList);
}
