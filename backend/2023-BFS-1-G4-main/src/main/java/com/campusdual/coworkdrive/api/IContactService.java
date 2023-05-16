package com.campusdual.coworkdrive.api;

import com.campusdual.coworkdrive.model.dto.ContactDTO;

import java.util.List;

public interface IContactService {
    
    String queryContact(String email);
    
    List<ContactDTO> queryAllContacts();
}
