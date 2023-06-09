package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.IBookingService;
import com.campusdual.coworkdrive.model.core.dao.BookingDao;
import com.campusdual.coworkdrive.model.core.dao.TripDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Lazy
@Service("BookingService")
public class BookingService implements IBookingService {
    private static final String PRIMARYUSERKEY = "id_user";
    @Autowired
    private BookingDao bookingDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    @Override
    public EntityResult bookingQuery(Map<String, Object> keyMap, List<String> attrList) {
        if(keyMap.get(BookingDao.ATTR_ID_BOOKING) instanceof String){
            keyMap.put(BookingDao.ATTR_ID_BOOKING,Integer.parseInt((String) keyMap.get(BookingDao.ATTR_ID_BOOKING)));
        }
        return this.daoHelper.query(bookingDao,keyMap,attrList);
    }

    @Override
    public EntityResult bookingInsert(Map<String, Object> attrMap) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        attrMap.put(PRIMARYUSERKEY, auth.getName());
        return this.daoHelper.insert(bookingDao,attrMap);
    }

    @Override
    public EntityResult bookingDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(bookingDao,keyMap);
    }

    /*public String getTripOwner(String trip){
        Map<String, Object> userKey = new HashMap<String, Object>();
        List<String> attrList = new ArrayList<>();
        attrList.add("id_user");
        userKey.put("id_trip", Integer.parseInt(trip));
        EntityResult idUser = this.daoHelper.query(tripDao,userKey,attrList,TripDao.QUERY_GET_USER);
        return idUser.getRecordValues(0).get("id_user").toString();
    }*/
}