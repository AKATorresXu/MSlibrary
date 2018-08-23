package com.ms.library.dao;

import java.util.List;

import com.ms.library.entity.Order;
import com.ms.library.exception.DaoExceprion;


public interface OrderDao {
	public static final int FINDORDER_BY_USER_NOEXP = 0;
	public static final int FINDORDER_BY_USER_EXP = 1;
	public static final int FINDORDER_BY_USERID = 2;
	public static final int FINDORDER_BY_BOOKID = 3;
	public static final int FINDORDER_ALL = 4;
	public static final int FINDORDER_ALL_LOSE = 5;
	
	int addOrder(Order b) throws DaoExceprion;
	int updateOrder(Order b)throws DaoExceprion;
	int deleteOrder(String id)throws DaoExceprion;
	Order findOrder(String id)throws DaoExceprion;
	List<Order> findOrder(int type,Object... args )throws DaoExceprion;
	int payBookOrder(Order b) throws DaoExceprion;
}
