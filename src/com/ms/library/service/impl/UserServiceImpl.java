package com.ms.library.service.impl;
import com.ms.library.dao.UserDao;
import com.ms.library.dao.impl.UserDaoImpl;
import com.ms.library.entity.User;
import com.ms.library.exception.DaoExceprion;
import com.ms.library.exception.ServiceException;
import com.ms.library.service.UserService;

public class UserServiceImpl implements UserService{

	UserDao userDao = new UserDaoImpl();
	@Override
	public User findUserByName(String name) {
		User reader = userDao.selectUserByName(name);
		return reader;
	}

	@Override
	public User findAdminByName(String name) {
		User admin = userDao.selectUserByName(name);
		return admin;
	}

	@Override
	public void addUser(User user) throws ServiceException {
		User findReader = userDao.selectUserByName(user.getUsername());
		User findAdmin = userDao.selectUserByName(user.getUsername());
		if (findReader == null && findAdmin == null) {
			userDao.addUser(user);
		} else {
			throw new ServiceException("用户名已存在！");
		}
	}
	@Override
	public boolean updateUser(User user) throws ServiceException {
		try {
			userDao.updateUser(user);
			return true;
		} catch (DaoExceprion e) {
			e.printStackTrace();
			throw new ServiceException("更新失败！");
		}
	}

	@Override
	public User findUserById(String id) {
		User reader = new User();
		try {
			reader = userDao.selectUserById(id);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return reader;
	}

	@Override
	public void updateUserPassword(User user) {
		try {
			userDao.updateUserPassword(user);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateBalance(User user) throws ServiceException {
		try {
			userDao.updateUserBalance(user);
		} catch (DaoExceprion e) {
			e.printStackTrace();
			throw new ServiceException("余额充值失败！Service异常！");
		}
	}

	

}
