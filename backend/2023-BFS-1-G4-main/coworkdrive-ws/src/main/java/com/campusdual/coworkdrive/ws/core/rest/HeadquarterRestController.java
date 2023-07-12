package com.campusdual.coworkdrive.ws.core.rest;

import com.campusdual.coworkdrive.api.core.service.IHeadquarterService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/headquarters")
public class HeadquarterRestController extends ORestController<IHeadquarterService> {
    @Autowired
    IHeadquarterService headquarterService;
    @Override
    public IHeadquarterService getService() {
        return headquarterService;
    }
}
