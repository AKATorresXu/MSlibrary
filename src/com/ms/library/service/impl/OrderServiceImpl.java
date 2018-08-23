package com.ms.library.service.impl;

import java.util.List;


import com.ms.library.dao.OrderDao;
import com.ms.library.dao.impl.OrderDaoImpl;
import com.ms.library.entity.Order;
import com.ms.library.exception.DaoExceprion;
import com.ms.library.service.OrderService;

public class OrderServiceImpl implements OrderService{
	private OrderDao od = new OrderDaoImpl();
	@Override
	public boolean borrowBook(Order o) {

		int temp = 0;
		try {
			temp = od.addOrder(o);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return temp==2?true:false;
	}

	@Override
	public boolean returnBook(Order o) {
		int temp = 0;
		try {
			temp = od.updateOrder(o);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return temp==3?true:false;
	}

	@Override
	public boolean payBook(Order o) throws DaoExceprion {
		int temp = 0;
		try {
			temp = od.payBookOrder(o);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return temp==2?true:false;
	}

	@Override
	public Order findOrderById(String id) {
		Order  b = null;
		try {
			b = od.findOrder(id);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public List<Order> findOrderByUserId(String id) {
		try {
			return od.findOrder( OrderDao.FINDORDER_BY_USERID,id);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean deleteOrder(String id) {
		int temp = 0;
		try {
			temp =od.deleteOrder(id);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}		
		return temp==1?true:false;
	}

	@Override
	public List<Order> findOrderAll() {
		List<Order> list = null;
		try {
			list = od.findOrder(OrderDao.FINDORDER_ALL);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Order> findOrderAllExp() {
		List<Order> list = null;
		try {
			list = od.findOrder(OrderDao.FINDORDER_BY_USER_EXP);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Order> findOrderAllNoExp() {
		List<Order> list = null;
		try {
			list = od.findOrder(OrderDao.FINDORDER_BY_USER_NOEXP);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Order> findOrderAllLose() {
		List<Order> list = null;
		try {
			list = od.findOrder(OrderDao.FINDORDER_ALL_LOSE);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return list;
	}

}
