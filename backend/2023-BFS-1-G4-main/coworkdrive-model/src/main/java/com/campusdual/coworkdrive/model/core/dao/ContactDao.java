package com.campusdual.coworkdrive.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Repository(value = "ContactDao")
@Lazy
@ConfigurationFile(
        configurationFile = "dao/ContactDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class ContactDao extends OntimizeJdbcDaoSupport {

    public static final String ATTR_ID_CONTACT = "ID_CONTACT";
    public static final String ATTR_FIRST_NAME = "FIRST_NAME";
    public static final String ATTR_LAST_NAME = "LAST_NAME";
    public static final String ATTR_SECOND_LAST_NAME = "LAST_SECOND_NAME";
    public static final String ATTR_EMAIL = "EMAIL";
    public static final String ATTR_PASSWORD = "PASSWORD";
}