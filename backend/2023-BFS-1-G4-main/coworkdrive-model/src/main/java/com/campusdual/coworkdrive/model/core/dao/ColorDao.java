package com.campusdual.coworkdrive.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
@Repository(value = "ColorDao")
@Lazy
@ConfigurationFile(
        configurationFile = "dao/ColorDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class ColorDao extends OntimizeJdbcDaoSupport {

    public static final String ATTR_ID_COLOR = "id_color";
    public static final String ATTR_COLOR_NAME = "color_name";
}