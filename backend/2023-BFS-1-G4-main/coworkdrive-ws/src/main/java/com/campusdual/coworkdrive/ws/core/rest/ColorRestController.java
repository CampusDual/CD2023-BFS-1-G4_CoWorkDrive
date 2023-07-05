package com.campusdual.coworkdrive.ws.core.rest;

import com.campusdual.coworkdrive.api.core.service.IColorService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/colors")
public class ColorRestController extends ORestController<IColorService> {
    @Autowired
    IColorService colorService;
    @Override
    public IColorService getService() {
        return colorService;
    }
}
