package com.campusdual.coworkdrive.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
@Repository(value = "CarDao")
@Lazy
@ConfigurationFile(
        configurationFile = "dao/CarDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class CarDao extends OntimizeJdbcDaoSupport {

    public static final String ATTR_ID_CAR = "ID_CAR";
    public static final String ATTR_CAR_BRAND = "CAR_BRAND";
    public static final String ATTR_MODEL = "MODEL";
    public static final String ATTR_SEATS = "SEATS";
    public static final String ATTR_CAR_REGISTRATION = "CAR_REGISTRATION";
    public static final String ATTR_ID_USER = "ID_USER";
}