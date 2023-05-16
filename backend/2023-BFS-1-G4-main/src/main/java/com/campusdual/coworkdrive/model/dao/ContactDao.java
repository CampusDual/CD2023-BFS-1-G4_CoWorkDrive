package com.campusdual.coworkdrive.model.dao;

import com.campusdual.coworkdrive.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContactDao extends JpaRepository<Contact,Integer> {
}
