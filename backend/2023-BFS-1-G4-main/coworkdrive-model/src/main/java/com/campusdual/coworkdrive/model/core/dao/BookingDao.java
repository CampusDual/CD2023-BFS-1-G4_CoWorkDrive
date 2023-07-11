package com.campusdual.coworkdrive.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Repository(value = "BookingDao")
@Lazy
@ConfigurationFile(
        configurationFile = "dao/BookingDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class BookingDao extends OntimizeJdbcDaoSupport {

    public static final String ATTR_ID_BOOKING = "id_booking";
    public static final String ATTR_ID_TRIP = "id_trip";
    public static final String ATTR_ID_USER = "id_user";
    public static final String QUERY_SEATS_INFO = "seats_info";
    public static final String QUERY_MY_BOOKINGS = "my_bookings";
    public static final String QUERY_MY_BOOKINGS_DONE = "my_bookings_done";
    public static final String QUERY_NUMBER_USER_IN_BOOKING = "number_user_in_booking";
    public static final String QUERY_BOOKING_BY_TRIP = "number_user_in_booking";
    
}