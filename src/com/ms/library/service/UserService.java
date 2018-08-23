package com.ms.library.service;

import com.ms.library.entity.User;
import com.ms.library.exception.ServiceException;

public interface UserService {
	public abstract User findUserByName(String paramString);

	public abstract User findAdminByName(String paramString);

	public abstract void addUser(User user) throws ServiceException;

	public abstract boolean updateUser(User user) throws ServiceException;

	public abstract User findUserById(String id);

	public abstract void updateUserPassword(User user);

	public abstract void updateBalance(User user) throws ServiceException;
}
