package com.campusdual.coworkdrive.ws.core.rest;

import com.campusdual.coworkdrive.api.core.service.ICarModelService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/carmodels")
public class CarModelRestController extends ORestController<ICarModelService> {
    @Autowired
    ICarModelService carModelService;
    @Override
    public ICarModelService getService() {
        return carModelService;
    }
}
