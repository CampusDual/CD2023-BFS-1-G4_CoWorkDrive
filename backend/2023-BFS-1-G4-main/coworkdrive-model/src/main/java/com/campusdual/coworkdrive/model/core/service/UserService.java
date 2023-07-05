package com.campusdual.coworkdrive.model.core.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.campusdual.coworkdrive.api.core.service.IUserService;
import com.campusdual.coworkdrive.model.core.dao.UserDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;

/**
 * Service implementation for managing users.
 */
@Lazy
@Service("UserService")
public class UserService implements IUserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private DefaultOntimizeDaoHelper daoHelper;
	
	/**
	 * Performs a login query.
	 *
	 * @param key  the query parameters
	 * @param attr the attributes to retrieve
	 */
	public void loginQuery(Map<?, ?> key, List<?> attr) {
		// This method is not used or might be unused
	}
	
	/**
	 * Performs a query to retrieve user entities.
	 *
	 * @param keyMap   the query parameters
	 * @param attrList the attributes to retrieve
	 * @return the entity result of the query
	 */
	public EntityResult userQuery(Map<?, ?> keyMap, List<?> attrList) {
		return this.daoHelper.query(userDao, keyMap, attrList);
	}
	
	/**
	 * Inserts a new user entity.
	 *
	 * @param attrMap the attributes of the user entity
	 * @return the entity result of the insert operation
	 */
	public EntityResult userInsert(Map<?, ?> attrMap) {
		return this.daoHelper.insert(userDao, attrMap);
	}
	
	/**
	 * Updates an existing user entity.
	 *
	 * @param attrMap the updated attributes of the user entity
	 * @param keyMap  the primary key of the user entity
	 * @return the entity result of the update operation
	 */
	public EntityResult userUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap) {
		return this.daoHelper.update(userDao, attrMap, keyMap);
	}
	
	/**
	 * Deletes a user entity.
	 *
	 * @param keyMap the primary key of the user entity to delete
	 * @return the entity result of the delete operation
	 */
	public EntityResult userDelete(Map<?, ?> keyMap) {
		return this.daoHelper.delete(this.userDao, keyMap);
	}
}
