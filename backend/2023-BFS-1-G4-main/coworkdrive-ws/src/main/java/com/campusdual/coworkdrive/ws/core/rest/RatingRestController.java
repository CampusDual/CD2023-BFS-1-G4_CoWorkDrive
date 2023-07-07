package com.campusdual.coworkdrive.ws.core.rest;

import com.campusdual.coworkdrive.api.core.service.IRatingService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/ratings")
public class RatingRestController extends ORestController<IRatingService> {
    @Autowired
    IRatingService ratingService;
    @Override
    public IRatingService getService() {
        return ratingService;
    }
}
