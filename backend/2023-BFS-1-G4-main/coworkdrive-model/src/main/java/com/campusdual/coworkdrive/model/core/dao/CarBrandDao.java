package com.campusdual.coworkdrive.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Repository(value = "CarBrandDao")
@Lazy
@ConfigurationFile(
        configurationFile = "dao/CarBrandDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class CarBrandDao extends OntimizeJdbcDaoSupport {
    public static final String ATTR_ID_CAR_BRAND = "id_car_brand";
    public static final String ATTR_BRAND_NAME = "brand_name";
}
