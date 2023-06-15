package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.IBookingService;
import com.campusdual.coworkdrive.model.core.dao.BookingDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Lazy
@Service("BookingService")
public class BookingService implements IBookingService {
    private static final String PRIMARYUSERKEY = "id_user";
    @Autowired
    private BookingDao bookingDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    @Override
    public EntityResult bookingQuery(Map<String, Object> keyMap, List<String> attrList) {
        if(keyMap.get(BookingDao.ATTR_ID_BOOKING) instanceof String){
            keyMap.put(BookingDao.ATTR_ID_BOOKING,Integer.parseInt((String) keyMap.get(BookingDao.ATTR_ID_BOOKING)));
        }
        return this.daoHelper.query(bookingDao,keyMap,attrList);
    }
    @Override
    public EntityResult myBookingsQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.query(bookingDao,keyMap,attrList,BookingDao.QUERY_MY_BOOKINGS);
    }


    @Override
    public EntityResult bookingInsert(Map<String, Object> attrMap) {
        List<String> listValue = new ArrayList<>();
        listValue.add("free_seats");
        EntityResult queryResult = getSeatsQuery(attrMap, listValue);
        if (queryResult.isWrong()) {
            return queryResult;
        }
        Number freeSeats = (Number) queryResult.getRecordValues(0).get("free_seats");
        if (freeSeats.intValue() == 0) {
            return null;
        } else {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            attrMap.put(PRIMARYUSERKEY, auth.getName());
            return this.daoHelper.insert(bookingDao, attrMap);
            //
        }
    }

    @Override
    public EntityResult bookingDelete(Map<String, Object> keyMap) {
        return null;
    }

    @Override
    public EntityResult myBookingsDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(bookingDao,keyMap);
    }

    @Override
    public EntityResult getSeatsQuery(Map<String, Object> keyMap, List<String> attrList) {
        return this.daoHelper.query(bookingDao,keyMap,attrList,BookingDao.QUERY_SEATS_INFO);
    }

}