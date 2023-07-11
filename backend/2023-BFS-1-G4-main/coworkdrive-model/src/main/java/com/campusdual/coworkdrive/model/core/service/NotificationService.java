package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.INotificationService;
import com.campusdual.coworkdrive.model.core.dao.NotificationDao;
import com.campusdual.coworkdrive.model.core.dao.UserDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Lazy
@Service("NotificationService")
public class NotificationService implements INotificationService {
    private static final String PRIMARYUSERKEY = "id_user";
    @Autowired
    private NotificationDao notificationDao;
    @Autowired
    private UserDao userDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;
    @Override
    public EntityResult notificationQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.query(notificationDao, keyMap, attrList, NotificationDao.QUERY_NOTIFICATION_DATA);
    }

    @Override
    public EntityResult notificationInsert(Map<String, Object> attrMap) {
        if (attrMap.get(NotificationDao.ATTR_ID_TRIP) instanceof String) {
            attrMap.put(NotificationDao.ATTR_ID_TRIP, Integer.parseInt((String) attrMap.get(NotificationDao.ATTR_ID_TRIP)));
        }
        attrMap.put(NotificationDao.ATTR_TEXT_NOTIFICATION, "has changed");
        long timestampActual = System.currentTimeMillis();
        Timestamp timeNotification = new Timestamp(timestampActual);
        attrMap.put(NotificationDao.ATTR_TIME_NOTIFICATION, timeNotification);
        return this.daoHelper.insert(notificationDao, attrMap);
    }

    @Override
    public EntityResult notificationDeleteInsert(Map<String, Object> attrMap) {
        if (attrMap.get(NotificationDao.ATTR_ID_TRIP) instanceof String) {
            attrMap.put(NotificationDao.ATTR_ID_TRIP, Integer.parseInt((String) attrMap.get(NotificationDao.ATTR_ID_TRIP)));
        }
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        attrMap.put(NotificationDao.ATTR_TEXT_NOTIFICATION, getUserName(auth.getName()) + attrMap.get("text_notification"));
        long timestampActual = System.currentTimeMillis();
        Timestamp timeNotification = new Timestamp(timestampActual);
        attrMap.put(NotificationDao.ATTR_TIME_NOTIFICATION, timeNotification);
        return this.daoHelper.insert(notificationDao, attrMap);
    }

    public String getUserName(String user){
        Map<String, String> mapUser = new HashMap<>();
        mapUser.put("user_", user);
        List<String> listUser = new ArrayList<>();
        listUser.add("name");
        EntityResult nameUser = this.daoHelper.query(userDao, mapUser, listUser, UserDao.QUERY_GET_USER_NAME);
        if(nameUser.isWrong() || nameUser.isEmpty()){
            return null;
        }
        return (String) nameUser.getRecordValues(0).get("name");
    }
}
