package com.campusdual.coworkdrive.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Repository(value = "HeadquarterDao")
@Lazy
@ConfigurationFile(
        configurationFile = "dao/HeadquarterDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class HeadquarterDao extends OntimizeJdbcDaoSupport {

    public static final String ATTR_ID_HEADQUARTER = "id_headquarter";
    public static final String ATTR_HEADQUARTER_DESTINATION_TITLE = "headquarter_destination_title";
    public static final String ATTR_HEADQUARTER_DESTINATION_ADDRESS = "headquarter_destination_address";
    public static final String ATTR_IMAGE_HEADQUARTER_NAME = "image_headquarter_name";
    public static final String ATTR_HEADQUARTER_TYPE = "headquarter_type";
    public static final String QUERY_HEADQUARTER_QUANTITY = "headquarter_quantity";
}