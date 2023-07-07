package com.campusdual.coworkdrive.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Repository(value = "NotificationDao")
@Lazy
@ConfigurationFile(
        configurationFile = "dao/NotificationDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class NotificationDao extends OntimizeJdbcDaoSupport {

    public static final String ATTR_ID_NOTIFICATION = "id_notification";
    public static final String ATTR_TEXT_NOTIFICATION = "text_notification";
    public static final String ATTR_TIME_NOTIFICATION = "time_notification";
    public static final String ATTR_ID_TRIP = "id_trip";
    public static final String QUERY_NOTIFICATION_DATA = "notification_data";
}