package com.ms.library.dao;

import com.ms.library.entity.User;
import com.ms.library.exception.DaoExceprion;

public interface UserDao {
	public User selectUserByName(String username);
	public User selectUserById(String id) throws DaoExceprion;
	public void addUser(User user);
	public void updateUser(User user) throws DaoExceprion;
	public void updateUserPassword(User user) throws DaoExceprion;
	public void updateUserBalance(User user) throws DaoExceprion;
}
