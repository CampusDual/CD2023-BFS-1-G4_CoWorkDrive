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
import java.util.List;
import java.util.Map;

/**
 * Service implementation for managing bookings.
 */
@Lazy
@Service("BookingService")
public class BookingService implements IBookingService {
    
    private static final String PRIMARYUSERKEY = "id_user";
    
    @Autowired
    private BookingDao bookingDao;
    
    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;
    
    /**
     * Retrieves bookings based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the queried bookings.
     */
    @Override
    public EntityResult bookingQuery(Map<String, Object> keyMap, List<String> attrList) {
        if (keyMap.get(BookingDao.ATTR_ID_BOOKING) instanceof String) {
            keyMap.put(BookingDao.ATTR_ID_BOOKING, Integer.parseInt((String) keyMap.get(BookingDao.ATTR_ID_BOOKING)));
        }
        return this.daoHelper.query(bookingDao, keyMap, attrList);
    }
    
    /**
     * Retrieves bookings of the authenticated user based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the queried bookings of the authenticated user.
     */
    @Override
    public EntityResult myBookingsQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.query(bookingDao, keyMap, attrList, BookingDao.QUERY_MY_BOOKINGS);
    }

    /**
     * Retrieves bookings of the authenticated user based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the queried bookings of the authenticated user.
     */
    @Override
    public EntityResult myBookingsDoneQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.query(bookingDao, keyMap, attrList, BookingDao.QUERY_MY_BOOKINGS_DONE);
    }
    
    /**
     * Inserts a new booking based on the provided attribute map.
     *
     * @param attrMap   The attribute map containing the details of the booking.
     * @return          The resulting EntityResult containing the inserted booking.
     */
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
        }
    }
    
    /**
     * Deletes a booking based on the provided key map.
     *
     * @param keyMap    The key map containing the identifiers of the booking to delete.
     * @return          The resulting EntityResult indicating the success of the deletion operation.
     */
    @Override
    public EntityResult bookingDelete(Map<String, Object> keyMap) {
        return null;
    }
    
    /**
     * Deletes the bookings of the authenticated user based on the provided key map.
     *
     * @param keyMap    The key map containing the identifiers of the bookings to delete.
     * @return          The resulting EntityResult indicating the success of the deletion operation.
     */
    @Override
    public EntityResult myBookingsDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(bookingDao, keyMap);
    }
    
    /**
     * Retrieves seat information based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the queried seat information.
     */
    @Override
    public EntityResult getSeatsQuery(Map<String, Object> keyMap, List<String> attrList) {
        return this.daoHelper.query(bookingDao, keyMap, attrList, BookingDao.QUERY_SEATS_INFO);
    }
    
    @Override
    public EntityResult userIsInBookingQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.query(bookingDao, keyMap, attrList, BookingDao.QUERY_NUMBER_USER_IN_BOOKING);
    }
}
