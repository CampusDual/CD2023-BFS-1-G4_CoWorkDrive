package com.campusdual.coworkdrive.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Repository(value = "TripDao")
@Lazy
@ConfigurationFile(
        configurationFile = "dao/TripDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class TripDao extends OntimizeJdbcDaoSupport {

    public static final String ATTR_ID_TRIP = "id_trip";
    public static final String ATTR_ORIGIN_TITLE = "origin_title";
    public static final String ATTR_ORIGIN_ADDRESS = "origin_address";
    public static final String ATTR_DESTINATION_TITLE = "destination_title";
    public static final String ATTR_DESTINATION_ADDRESS = "destination_address";
    public static final String ATTR_DATE = "date";
    public static final String ATTR_TIME = "time";
    public static final String ATTR_ID_USER = "id_user";
    public static final String ATTR_ID_CAR = "id_car";
    public static final String ATTR_ACTIVE = "active";
    public static final String ATTR_DESTINATION_IMAGE = "destination_image";
    public static final String QUERY_ALL_TRIPS = "all_trips";
    public static final String QUERY_GET_USER = "get_user";
    public static final String QUERY_BOOKING_INFO = "booking_info";
    public static final String QUERY_TRIP_DETAIL = "trip_detail";
    public static final String QUERY_TRIP_DATA = "trip_data";
    public static final String QUERY_TRIP_DATA_DONE = "trip_data_done";
    public static final String QUERY_MORE_TRIPS = "more_trips";
    public static final String QUERY_HISTORICAL_TRIPS = "historical_trips";
    public static final String QUERY_SCHEDULED_TRIPS = "scheduled_trips";
    public static final String QUERY_NUMBER_TRIPS_ON_BOOKING = "number_trips_on_booking";
    public static final String QUERY_GET_DATE = "get_date";
    public static final String QUERY_BOOKING_USERS = "get_booking_users";
    public static final String QUERY_DATA_EMAIL_PASSSENGER = "data_email_passenger";
}