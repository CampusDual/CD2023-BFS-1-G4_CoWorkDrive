package com.campusdual.coworkdrive.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Repository(value = "CarModelDao")
@Lazy
@ConfigurationFile(
        configurationFile = "dao/CarModelDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class CarModelDao extends OntimizeJdbcDaoSupport {
    public static final String ATTR_ID_CAR_MODEL = "id_car_model";
    public static final String ATTR_MODEL_NAME = "model_name";
    public static final String ATTR_ID_CAR_BRAND = "id_car_brand";
}
