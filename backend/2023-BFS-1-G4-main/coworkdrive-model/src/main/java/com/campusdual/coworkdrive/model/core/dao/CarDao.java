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

    public static final String ATTR_ID_CAR = "id_car";
    public static final String ATTR_SEATS = "seats";
    public static final String ATTR_CAR_REGISTRATION = "car_registration";
    public static final String ATTR_ID_COLOR = "id_color";
    public static final String ATTR_ID_USER = "id_user";
    public static final String ATTR_ID_CAR_BRAND = "id_car_brand";
    public static final String ATTR_ID_CAR_MODEL = "id_car_model";
    public static final String QUERY_CAR_DETAIL = "car_detail";
    public static final String QUERY_NUMBER_CARS = "number_cars";
    public static final String QUERY_CAR_DATA = "car_data";
}