package com.campusdual.coworkdrive.service;

import com.campusdual.coworkdrive.api.IContactService;
import com.campusdual.coworkdrive.model.Contact;
import com.campusdual.coworkdrive.model.dao.ContactDao;
import com.campusdual.coworkdrive.model.dto.ContactDTO;
import com.campusdual.coworkdrive.model.dto.dtomapper.ContactMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service("ContactService")
@Lazy
public class ContactService implements IContactService {
    @Autowired
    private ContactDao contactDao;
    @Override
    public ContactDTO queryContact(String email) {
        List<ContactDTO> contacts = queryAllContacts();
        String pass= Arrays.toString(email.split(",",1));
        for (ContactDTO contacto : contacts) {
            if (pass.contains(contacto.getEmail()) && pass.contains(contacto.getPassword())) {
                return ContactMapper.INSTANCE.toDTO(contactDao.getReferenceById(contacto.getId_contact()));
            }
        }
        return null;
    }
    
    @Override
    public List<ContactDTO> queryAllContacts() {
        return ContactMapper.INSTANCE.toDTOList(contactDao.findAll());
    }
}
