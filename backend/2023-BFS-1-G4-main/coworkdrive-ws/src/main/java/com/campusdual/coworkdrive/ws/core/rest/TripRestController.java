package com.campusdual.coworkdrive.ws.core.rest;

import com.campusdual.coworkdrive.api.core.service.ITripService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController()
@RequestMapping("/trips")
public class TripRestController extends ORestController<ITripService> {
    @Autowired
    ITripService tripService;

    @Override
    public ITripService getService() {
        return tripService;
    }

}
