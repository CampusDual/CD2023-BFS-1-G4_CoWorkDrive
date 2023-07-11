package com.campusdual.coworkdrive.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Repository(value = "TripHistoricalDao")
@Lazy
@ConfigurationFile(
        configurationFile = "dao/TripHistoricalDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class TripHistoricalDao extends OntimizeJdbcDaoSupport {

    public static final String ATTR_ID_TRIP_HISTORICAL = "id_trip_historical";
    public static final String ATTR_ORIGIN_TITLE = "origin_title";
    public static final String ATTR_ORIGIN_ADDRESS = "origin_address";
    public static final String ATTR_DESTINATION_TITLE = "destination_title";
    public static final String ATTR_DESTINATION_ADDRESS = "destination_address";
    public static final String ATTR_DATE = "date";
    public static final String ATTR_TIME = "time";
    public static final String ATTR_ID_USER = "id_user";
    public static final String ATTR_ID_CAR = "id_car";
    public static final String ATTR_ID_TRIP = "id_trip";
    public static final String QUERY_TRIP_HISTORICAL_DATA = "id_car";
}