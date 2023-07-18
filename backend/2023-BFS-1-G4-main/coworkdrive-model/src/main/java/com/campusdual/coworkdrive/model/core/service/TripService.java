package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.ITripService;
import com.campusdual.coworkdrive.model.core.dao.CarDao;
import com.campusdual.coworkdrive.model.core.dao.TripDao;
import com.ontimize.jee.common.db.SQLStatementBuilder;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicExpression;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicField;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicOperator;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * Service implementation for managing trips.
 */
@Lazy
@Service("TripService")
public class TripService implements ITripService {
    
    private static final String PRIMARYUSERKEY = "id_user";
    
    @Autowired
    private TripDao tripDao;
    
    @Autowired
    private CarDao carDao;
    
    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;
    
    /**
     * Retrieves the trips based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the queried trips.
     */
    @Override
    public EntityResult tripQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        if (keyMap.get(TripDao.ATTR_ID_TRIP) instanceof String) {
            keyMap.put(TripDao.ATTR_ID_TRIP, Integer.parseInt((String) keyMap.get(TripDao.ATTR_ID_TRIP)));
        }
        return this.daoHelper.query(tripDao, keyMap, attrList,TripDao.QUERY_TRIP_DATA);
    }

    /**
     * Retrieves the trips based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the queried trips.
     */
    @Override
    public EntityResult tripDoneQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        if (keyMap.get(TripDao.ATTR_ID_TRIP) instanceof String) {
            keyMap.put(TripDao.ATTR_ID_TRIP, Integer.parseInt((String) keyMap.get(TripDao.ATTR_ID_TRIP)));
        }
        return this.daoHelper.query(tripDao, keyMap, attrList,TripDao.QUERY_TRIP_DATA_DONE);
    }
    
    /**
     * Retrieves the details of a specific trip based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the details of the trip.
     */
    @Override
    public EntityResult tripDetailQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        if (keyMap.get(TripDao.ATTR_ID_TRIP) instanceof String) {
            keyMap.put(TripDao.ATTR_ID_TRIP, Integer.parseInt((String) keyMap.get(TripDao.ATTR_ID_TRIP)));
        }
        return this.daoHelper.query(tripDao, keyMap, attrList, TripDao.QUERY_TRIP_DETAIL);
    }
    
    /**
     * Retrieves the booking information for a specific trip based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the booking information.
     */
    @Override
    public EntityResult bookingQuery(Map<String, Object> keyMap, List<String> attrList) {
        if (keyMap.get(TripDao.ATTR_ID_TRIP) instanceof String) {
            keyMap.put(TripDao.ATTR_ID_TRIP, Integer.parseInt((String) keyMap.get(TripDao.ATTR_ID_TRIP)));
        }
        return this.daoHelper.query(tripDao, keyMap, attrList, TripDao.QUERY_BOOKING_INFO);
    }
    
    /**
     * Retrieves all the trips for the authenticated user based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing all the trips for the user.
     */
    @Override
    public EntityResult tripGetAllQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(SQLStatementBuilder.ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY,
                getExpression(auth.getName()));
        return this.daoHelper.query(tripDao, keyMap, attrList, TripDao.QUERY_ALL_TRIPS);
    }

    /**
     * Executes the moreTripsQuery to retrieve a list of trips with additional information.
     * It adds the primary user key to the keyMap and converts the trip ID to an integer if it is provided as a string.
     * @param keyMap     The map containing the query parameters.
     * @param attrList   The list of attributes to include in the result.
     * @return           The resulting EntityResult containing the queried trips.
     */
    @Override
    public EntityResult moreTripsQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        if (keyMap.get(TripDao.ATTR_ID_TRIP) instanceof String) {
            keyMap.put(TripDao.ATTR_ID_TRIP, Integer.parseInt((String) keyMap.get(TripDao.ATTR_ID_TRIP)));
        }
        return this.daoHelper.query(tripDao, keyMap, attrList,TripDao.QUERY_MORE_TRIPS);
    }

    /**
     * Executes the historicalTripsQuery to retrieve a list of historical trips for the authenticated user.
     * It adds the primary user key to the keyMap and converts the trip ID to an integer if it is provided as a string.
     * @param keyMap     The map containing the query parameters.
     * @param attrList   The list of attributes to include in the result.
     * @return           The resulting EntityResult containing the queried historical trips.
     */
    @Override
    public EntityResult historicalTripsQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        if (keyMap.get(TripDao.ATTR_ID_TRIP) instanceof String) {
            keyMap.put(TripDao.ATTR_ID_TRIP, Integer.parseInt((String) keyMap.get(TripDao.ATTR_ID_TRIP)));
        }
        return this.daoHelper.query(tripDao, keyMap, attrList,TripDao.QUERY_HISTORICAL_TRIPS);
    }

    /**
     * Executes the scheduledTripsQuery to retrieve a list of scheduled trips based on the provided conditions.
     * It converts the car ID to an integer if it is provided as a string.
     * @param keyMap     The map containing the query parameters.
     * @param attrList   The list of attributes to include in the result.
     * @return           The resulting EntityResult containing the queried scheduled trips.
     */
    @Override
    public EntityResult scheduledTripsQuery(Map<String, Object> keyMap, List<String> attrList) {
        if (keyMap.get(TripDao.ATTR_ID_CAR) instanceof String) {
            keyMap.put(TripDao.ATTR_ID_CAR, Integer.parseInt((String) keyMap.get(TripDao.ATTR_ID_CAR)));
        }
        return this.daoHelper.query(tripDao, keyMap, attrList,TripDao.QUERY_SCHEDULED_TRIPS);
    }

    /**
     * Executes the numberTripsOnBookingQuery to retrieve the number of trips associated with a booking.
     * @param keyMap     The map containing the query parameters.
     * @param attrList   The list of attributes to include in the result.
     * @return           The resulting EntityResult containing the number of trips on the booking.
     */
    @Override
    public EntityResult numberTripsOnBookingQuery(Map<String, Object> keyMap, List<String> attrList) {
        return this.daoHelper.query(tripDao, keyMap, attrList, TripDao.QUERY_NUMBER_TRIPS_ON_BOOKING);
    }
    
    /**
     * Inserts a new trip based on the provided attribute map.
     *
     * @param attrMap   The attribute map containing the details of the trip.
     * @return          The resulting EntityResult containing the inserted trip.
     */
    @Override
    public EntityResult tripInsert(Map<String, Object> attrMap) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        attrMap.put(PRIMARYUSERKEY, auth.getName());
        attrMap.put(TripDao.ATTR_DATE,formatDate(attrMap));
        Date dateReceived = (Date) attrMap.get("date");
        Timestamp timeReceived = (Timestamp) attrMap.get("time");

        if(compareDateTime(dateReceived, timeReceived)){
            return null;
        }

        return this.daoHelper.insert(this.tripDao, attrMap);
    }
    
    /**
     * Updates an existing trip based on the provided attribute and key maps.
     *
     * @param attrMap   The attribute map containing the updated details of the trip.
     * @param keyMap    The key map containing the identifiers of the trip to update.
     * @return          The resulting EntityResult containing the updated trip.
     */
    @Override
    public EntityResult tripUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        if(attrMap.get("date") == null && attrMap.get("time") != null) {
            List<String> listValue = new ArrayList<>();
            listValue.add("date");
            listValue.add("time");
            EntityResult queryResult = getDate(keyMap, listValue);
            if (queryResult.isWrong()) {
                return queryResult;
            }
            Date dateReceived = (Date) queryResult.getRecordValues(0).get("date");
            Timestamp timeReceived = (Timestamp) attrMap.get("time");

            if(compareDateTime(dateReceived, timeReceived)){
                return null;
            }
        }

        if(attrMap.get("date") != null && attrMap.get("time") == null) {
            List<String> listValue = new ArrayList<>();
            listValue.add("date");
            listValue.add("time");
            EntityResult queryResult = getDate(keyMap, listValue);
            if (queryResult.isWrong()) {
                return queryResult;
            }

            attrMap.put(TripDao.ATTR_DATE, formatDate(attrMap));
            Date dateReceived = (Date) attrMap.get("date");
            Timestamp timeReceived = (Timestamp) queryResult.getRecordValues(0).get("time");

            if(compareDateTime(dateReceived, timeReceived)){
                return null;
            }
        }


        if(attrMap.get("date") != null && attrMap.get("time") != null) {
            attrMap.put(TripDao.ATTR_DATE, formatDate(attrMap));
            Date dateReceived = (Date) attrMap.get("date");
            Timestamp timeReceived = (Timestamp) attrMap.get("time");

            if(compareDateTime(dateReceived, timeReceived)){
                return null;
            }
        }

        EntityResult tripUpdateDone = this.daoHelper.update(tripDao, attrMap, keyMap);
        if(attrMap.get("active") != null){
            emailData(keyMap,"deleteTrip");
        } else {
            emailData(keyMap,"modifyTrip");
        }

        return tripUpdateDone;
    }
    
    /**
     * Deletes a trip based on the provided key map.
     *
     * @param keyMap    The key map containing the identifiers of the trip to delete.
     * @return          The resulting EntityResult indicating the success of the deletion operation.
     */
    @Override
    public EntityResult tripDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(this.tripDao, keyMap);
    }

    /**
     * Retrieves the date and time information for a trip based on the provided attributes.
     * Executes the query to retrieve the data from the tripDao.
     * @param attrMap   The map containing the attributes used for the query.
     * @param attrList  The list of attributes to include in the result.
     * @return          The resulting EntityResult containing the date and time information for the trip.
     */
    @Override
    public EntityResult getDate(Map<String, Object> attrMap, List<String> attrList) {
        return this.daoHelper.query(tripDao, attrMap, attrList,TripDao.QUERY_GET_DATE);
    }
    
    /**
     * Creates a BasicExpression object for constructing a SQL expression.
     *
     * @param value The value of the expression.
     * @return      The constructed BasicExpression object.
     */
    private BasicExpression getExpression(String value) {
        BasicField field = new BasicField(PRIMARYUSERKEY);
        return new BasicExpression(field, BasicOperator.NOT_EQUAL_OP, value);
    }

    /**
     * Formats the date provided in the attribute map to a Date object.
     * Parses the date string using the specified date format pattern.
     * @param attrMap   The map containing the attributes.
     * @return          The formatted Date object.
     */
    private Date formatDate(Map<String, Object> attrMap){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        LocalDate dateTime = LocalDate.parse((String) attrMap.get(TripDao.ATTR_DATE), formatter);
        return Date.from(dateTime.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
    }

    /**
     * Compares a received date and time with the current date and time.
     * Returns true if the received date is before the previous day or if the received time is before the current time on the current day.
     * @param dateReceived  The received date.
     * @param timeReceived  The received time.
     * @return              True if the received date and time are in the past, false otherwise.
     */
    public boolean compareDateTime(Date dateReceived, Timestamp timeReceived){
        Date todayDate = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(todayDate);
        Calendar dateCompare = Calendar.getInstance();
        dateCompare.setTime(todayDate);
        dateCompare.add(Calendar.DAY_OF_YEAR, -1);
        if (dateReceived.before(dateCompare.getTime())) {
            return true;
        }

        long timestampActual = System.currentTimeMillis();
        dateCompare.add(Calendar.DAY_OF_YEAR, 1);
        if (timeReceived.getTime() <= timestampActual && dateReceived.before(dateCompare.getTime())) {
            return true;
        }

        return false;
    }

    /**
     * Retrieves the booking users based on the provided attributes.
     * Executes a query to obtain the booking users from the tripDao.
     * Concatenates the booking users' names into a single string.
     * @param keyMap        The map containing the attributes used for the query.
     * @param attrList      The list of attributes to include in the result.
     * @return              A string containing the concatenated names of the booking users.
     */
    public String getBookingUsers(Map<String, Object> keyMap, List<String> attrList){
        EntityResult bookingUsers = this.daoHelper.query(tripDao, keyMap, attrList,TripDao.QUERY_BOOKING_USERS);
        StringBuilder usersConcat = new StringBuilder();
        for(int i=0; i<bookingUsers.calculateRecordNumber();i++) {
            usersConcat.append(",").append(bookingUsers.getRecordValues(i).toString());
        }
        usersConcat.deleteCharAt(0);
        return usersConcat.toString();
    }

    /**
     * Sends email notifications based on the provided attributes and action.
     * Executes a query to obtain passenger information from the tripDao.
     * Constructs the necessary email data for each passenger and sends the emails using the MailServiceApi.
     * @param keyMap    The map containing the attributes used for the query.
     * @param action    The action to be performed in the email.
     */
    public void emailData(Map<String, Object> keyMap, String action){
        List<String> attrListPassenger = new ArrayList<>();
        attrListPassenger.add("user_");
        attrListPassenger.add("name");
        attrListPassenger.add("email");
        attrListPassenger.add("origin_title");
        attrListPassenger.add("destination_title");
        attrListPassenger.add("date");

        EntityResult passengerInfo = daoHelper.query(tripDao, keyMap, attrListPassenger, TripDao.QUERY_DATA_EMAIL_PASSSENGER);

        ArrayList<String> emailData = new ArrayList<>();

        for (int i = 0; i < passengerInfo.calculateRecordNumber(); i++) {
            String emailPassenger = (String) passengerInfo.getRecordValues(i).get("email");
            String namePassenger =  (String) passengerInfo.getRecordValues(i).get("name");
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateTrip = sdf.format(passengerInfo.getRecordValues(i).get("date"));
            String originTitle = (String) passengerInfo.getRecordValues(i).get("origin_title");
            String destinationTitle = (String) passengerInfo.getRecordValues(i).get("destination_title");


            emailData.add("null");
            emailData.add(emailPassenger);
            emailData.add(namePassenger);
            emailData.add(dateTrip);
            emailData.add(originTitle);
            emailData.add(destinationTitle);
            emailData.add(action);

            MailServiceApi.createMails(emailData);
            emailData.clear();
        }
    }
}
