package com.campusdual.coworkdrive.ws.core.rest;

import com.campusdual.coworkdrive.api.core.service.ITripHistoricalService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController()
@RequestMapping("/tripshistoricals")
public class TripHistoricalRestController extends ORestController<ITripHistoricalService> {
    @Autowired
    ITripHistoricalService tripHistoricalService;

    @Override
    public ITripHistoricalService getService() {
        return tripHistoricalService;
    }

}
