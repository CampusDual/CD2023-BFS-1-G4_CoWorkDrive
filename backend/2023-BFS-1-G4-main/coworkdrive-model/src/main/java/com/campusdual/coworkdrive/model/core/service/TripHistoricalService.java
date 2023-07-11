package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.ITripHistoricalService;
import com.campusdual.coworkdrive.model.core.dao.CarDao;
import com.campusdual.coworkdrive.model.core.dao.TripHistoricalDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * Service implementation for managing trips.
 */
@Lazy
@Service("TripHistoricalService")
public class TripHistoricalService implements ITripHistoricalService {
    
    private static final String PRIMARYUSERKEY = "id_user";
    
    @Autowired
    private TripHistoricalDao tripHistoricalDao;
    
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
    public EntityResult tripHistoricalQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        if (keyMap.get(TripHistoricalDao.ATTR_ID_TRIP_HISTORICAL) instanceof String) {
            keyMap.put(TripHistoricalDao.ATTR_ID_TRIP_HISTORICAL, Integer.parseInt((String) keyMap.get(TripHistoricalDao.ATTR_ID_TRIP_HISTORICAL)));
        }
        return this.daoHelper.query(tripHistoricalDao, keyMap, attrList, TripHistoricalDao.QUERY_TRIP_HISTORICAL_DATA);
    }
    
    /**
     * Inserts a new trip based on the provided attribute map.
     *
     * @param attrMap   The attribute map containing the details of the trip.
     * @return          The resulting EntityResult containing the inserted trip.
     */
    @Override
    public EntityResult tripHistoricalInsert(Map<String, Object> attrMap) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        attrMap.put(PRIMARYUSERKEY, auth.getName());
        Date dateTripTrash = new Date((long) attrMap.get("date"));
        attrMap.put(TripHistoricalDao.ATTR_DATE,dateTripTrash);
        Timestamp timeTripTrash = new Timestamp((Long) attrMap.get("time"));
        attrMap.put(TripHistoricalDao.ATTR_TIME,timeTripTrash);

        return this.daoHelper.insert(this.tripHistoricalDao, attrMap);
    }
    
    /**
     * Deletes a trip based on the provided key map.
     *
     * @param keyMap    The key map containing the identifiers of the trip to delete.
     * @return          The resulting EntityResult indicating the success of the deletion operation.
     */
    @Override
    public EntityResult tripHistoricalDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(this.tripHistoricalDao, keyMap);
    }

    private Date formatDate(Map<String, Object> attrMap){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        LocalDate dateTime = LocalDate.parse((String) attrMap.get(TripHistoricalDao.ATTR_DATE), formatter);
        return Date.from(dateTime.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
    }

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
}
