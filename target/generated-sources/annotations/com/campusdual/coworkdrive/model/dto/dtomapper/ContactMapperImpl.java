package com.campusdual.coworkdrive.model.dto.dtomapper;

import com.campusdual.coworkdrive.model.Contact;
import com.campusdual.coworkdrive.model.dto.ContactDTO;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-05-18T09:05:51+0200",
    comments = "version: 1.5.3.Final, compiler: javac, environment: Java 20.0.1 (Oracle Corporation)"
)
public class ContactMapperImpl implements ContactMapper {

    @Override
    public ContactDTO toDTO(Contact contact) {
        if ( contact == null ) {
            return null;
        }

        ContactDTO contactDTO = new ContactDTO();

        contactDTO.setId_contact( contact.getId_contact() );
        contactDTO.setFirst_name( contact.getFirst_name() );
        contactDTO.setLast_name( contact.getLast_name() );
        contactDTO.setSecond_last_name( contact.getSecond_last_name() );
        contactDTO.setEmail( contact.getEmail() );
        contactDTO.setPassword( contact.getPassword() );

        return contactDTO;
    }

    @Override
    public List<ContactDTO> toDTOList(List<Contact> contacts) {
        if ( contacts == null ) {
            return null;
        }

        List<ContactDTO> list = new ArrayList<ContactDTO>( contacts.size() );
        for ( Contact contact : contacts ) {
            list.add( toDTO( contact ) );
        }

        return list;
    }

    @Override
    public Contact toEntity(ContactDTO contactDTO) {
        if ( contactDTO == null ) {
            return null;
        }

        Contact contact = new Contact();

        contact.setId_contact( contactDTO.getId_contact() );
        contact.setFirst_name( contactDTO.getFirst_name() );
        contact.setLast_name( contactDTO.getLast_name() );
        contact.setSecond_last_name( contactDTO.getSecond_last_name() );
        contact.setEmail( contactDTO.getEmail() );
        contact.setPassword( contactDTO.getPassword() );

        return contact;
    }
}
