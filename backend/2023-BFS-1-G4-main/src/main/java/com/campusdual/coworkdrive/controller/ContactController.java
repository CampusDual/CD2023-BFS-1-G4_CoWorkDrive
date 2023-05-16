package com.campusdual.coworkdrive.controller;

import com.campusdual.coworkdrive.api.IContactService;
import com.campusdual.coworkdrive.model.dto.ContactDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/contacts")
public class ContactController {
    
    @Autowired
    private IContactService contactService;
    
    
    @PostMapping(value = "/login")
    public String queryContact(@RequestBody String email){
        
        return contactService.queryContact(email);
    }
}
