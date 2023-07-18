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

    /**
     * Executes a query to retrieve notification information based on the provided key attributes.
     * Retrieves the current user's authentication information and adds it to the key attributes.
     * @param keyMap    The map containing the key attributes used for the query.
     * @param attrList  The list of attributes to include in the result.
     * @return          An EntityResult containing the notification information.
     */
    @Override
    public EntityResult notificationQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.query(notificationDao, keyMap, attrList, NotificationDao.QUERY_NOTIFICATION_DATA);
    }

    /**
     * Inserts a new notification entry into the database.
     * If the ID trip attribute is a String, it is converted to an Integer.
     * Sets the text notification to "has changed" and the current timestamp as the time notification.
     * @param attrMap   The map containing the attributes to be inserted.
     * @return          An EntityResult indicating the success of the insert operation.
     */
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

    /**
     * Inserts a new notification entry into the database, indicating a cancellation.
     * If the ID trip attribute is a String, it is converted to an Integer.
     * Sets the text notification to "has canceled" and the current timestamp as the time notification.
     * @param attrMap   The map containing the attributes to be inserted.
     * @return          An EntityResult indicating the success of the insert operation.
     */
    @Override
    public EntityResult notificationDeleteInsert(Map<String, Object> attrMap) {
        if (attrMap.get(NotificationDao.ATTR_ID_TRIP) instanceof String) {
            attrMap.put(NotificationDao.ATTR_ID_TRIP, Integer.parseInt((String) attrMap.get(NotificationDao.ATTR_ID_TRIP)));
        }
        attrMap.put(NotificationDao.ATTR_TEXT_NOTIFICATION, "has canceled");
        long timestampActual = System.currentTimeMillis();
        Timestamp timeNotification = new Timestamp(timestampActual);
        attrMap.put(NotificationDao.ATTR_TIME_NOTIFICATION, timeNotification);
        return this.daoHelper.insert(notificationDao, attrMap);
    }
}
