package com.campusdual.coworkdrive.model.core.dao;


import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;


@Lazy
@Repository(value = "UserDao")
@ConfigurationFile(
	configurationFile = "dao/UserDao.xml",
	configurationFilePlaceholder = "dao/placeholders.properties")
public class UserDao extends OntimizeJdbcDaoSupport {

    public static final String ID = "user_";
    public static final String EMAIL = "email";
    public static final String PASSWORD = "password";
    public static final String NAME = "name";
    public static final String SURNAME1 = "surname1";
    public static final String NIF = "nif";
    public static final String USERBLOCKED = "userblocked";
    public static final String LASTPASSWORDUPDATE = "lastpasswordupdate";
    public static final String FIRSTLOGIN = "firstlogin";
    public static final String SURNAME2 = "surname2";
    public static final String QUERY_GET_USER_NAME = "get_user_name";

}
