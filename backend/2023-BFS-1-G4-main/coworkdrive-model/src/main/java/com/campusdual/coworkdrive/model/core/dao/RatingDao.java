package com.campusdual.coworkdrive.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Repository(value = "RatingDao")
@Lazy
@ConfigurationFile(
        configurationFile = "dao/RatingDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class RatingDao extends OntimizeJdbcDaoSupport {

    public static final String ATTR_ID_RATING = "id_rating";
    public static final String ATTR_RATE = "rate";
    public static final String ATTR_ID_BOOKING = "id_booking";
    public static final String ATTR_ID_USER = "id_user";
    public static final String ATTR_ID_DRIVER = "id_driver";
    public static final String QUERY_IS_RATED = "is_rated";
}