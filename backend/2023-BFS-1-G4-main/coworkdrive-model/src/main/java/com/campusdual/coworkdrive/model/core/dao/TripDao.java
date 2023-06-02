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

    public static final String ATTR_ID_TRIP = "ID_TRIP";
    public static final String ATTR_ORIGIN = "ORIGIN";
    public static final String ATTR_DESTINATION = "DESTINATION";
    public static final String ATTR_DATE = "DATE";
    public static final String ATTR_TIME = "TIME";
    public static final String ATTR_ID_USER = "ID_USER";
    public static final String QUERY_ALL_TRIPS = "all_trips";
}