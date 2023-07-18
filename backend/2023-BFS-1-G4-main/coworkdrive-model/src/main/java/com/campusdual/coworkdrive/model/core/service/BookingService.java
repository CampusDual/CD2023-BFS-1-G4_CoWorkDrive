package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.IBookingService;
import com.campusdual.coworkdrive.model.core.dao.BookingDao;
import com.campusdual.coworkdrive.model.core.dao.NotificationDao;
import com.campusdual.coworkdrive.model.core.dao.UserDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

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
    private UserDao userDao;
    
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

            long timestampActual = System.currentTimeMillis();
            Timestamp timeNotification = new Timestamp(timestampActual);
            attrMap.put(BookingDao.ATTR_TIME_BOOKING, timeNotification);

            EntityResult bookingInsertDone = this.daoHelper.insert(bookingDao, attrMap);
            if(bookingInsertDone.isWrong()){
                return null;
            } else {
                emailData(attrMap,"insertBooking");
                return bookingInsertDone;
            }
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
        ArrayList<String> attrList = new ArrayList<>();
        attrList.add("id_trip");
        EntityResult getIdTripBooking = this.daoHelper.query(bookingDao, keyMap, attrList);
        EntityResult bookingDeleteDone = this.daoHelper.delete(bookingDao, keyMap);
        if(bookingDeleteDone.isWrong()){
            return null;
        } else {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            keyMap.put(PRIMARYUSERKEY, auth.getName());
            keyMap.put("id_trip",getIdTripBooking.getRecordValues(0).get("id_trip"));
            emailData(keyMap,"deleteBooking");
            return bookingDeleteDone;
        }
    }
    
    /**
     * Deletes the bookings of the authenticated user based on the provided key map.
     *
     * @param keyMap    The key map containing the identifiers of the bookings to delete.
     * @return          The resulting EntityResult indicating the success of the deletion operation.
     */
    @Override
    public EntityResult myBookingsDelete(Map<String, Object> keyMap) {
        ArrayList<String> attrList = new ArrayList<>();
        attrList.add("id_trip");
        EntityResult getIdTripBooking = this.daoHelper.query(bookingDao, keyMap, attrList);
        EntityResult bookingDeleteDone = this.daoHelper.delete(bookingDao, keyMap);
        if(bookingDeleteDone.isWrong()){
            return null;
        } else {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            keyMap.put(PRIMARYUSERKEY, auth.getName());
            keyMap.put("id_trip",getIdTripBooking.getRecordValues(0).get("id_trip"));
            emailData(keyMap,"deleteBooking");
            return bookingDeleteDone;
        }
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

    /**
     * Executes a query to check if the current user is included in a booking based on the provided key map and attribute list.
     *
     * @param keyMap   a map containing the query key-value pairs
     * @param attrList a list of attributes to be included in the query result
     * @return an EntityResult object containing the query result
     */
    @Override
    public EntityResult userIsInBookingQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.query(bookingDao, keyMap, attrList, BookingDao.QUERY_NUMBER_USER_IN_BOOKING);
    }

    /**
     * Sends email data based on the provided attribute map and action.
     *
     * @param attrMap an attribute map containing the necessary data for sending emails
     * @param action  the action for which the email is being sent
     */
    public void emailData(Map<String, Object> attrMap, String action){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        List<String> attrList = new ArrayList<>();
        attrList.add("emailDriver");
        attrList.add("namePassenger");
        attrList.add("origin_title");
        attrList.add("destination_title");
        attrList.add("date");

        attrMap.remove(PRIMARYUSERKEY);

        EntityResult driverTripInfo = daoHelper.query(bookingDao, attrMap, attrList, BookingDao.QUERY_DATA_EMAIL_DRIVER);

        attrMap.put("user_",auth.getName());

        List<String> attrListPassenger = new ArrayList<>();
        attrListPassenger.add("user_");
        attrListPassenger.add("name");
        attrListPassenger.add("email");

        EntityResult passengerInfo = daoHelper.query(userDao, attrMap, attrListPassenger, UserDao.QUERY_DATA_EMAIL_PASSSENGER);

        ArrayList<String> emailData = new ArrayList<>();

        String emailDriver = (String) driverTripInfo.getRecordValues(0).get("email");
        String emailPassenger = (String) passengerInfo.getRecordValues(0).get("email");
        String namePassenger =  (String) passengerInfo.getRecordValues(0).get("name");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String dateTrip = sdf.format(driverTripInfo.getRecordValues(0).get("date"));
        String originTitle = (String) driverTripInfo.getRecordValues(0).get("origin_title");
        String destinationTitle = (String) driverTripInfo.getRecordValues(0).get("destination_title");

        emailData.add(emailDriver);
        emailData.add(emailPassenger);
        emailData.add(namePassenger);
        emailData.add(dateTrip);
        emailData.add(originTitle);
        emailData.add(destinationTitle);
        emailData.add(action);

        MailServiceApi.createMails(emailData);
    }
}
