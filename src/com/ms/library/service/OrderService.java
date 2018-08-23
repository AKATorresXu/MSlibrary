package com.ms.library.service;

import java.util.List;

import com.ms.library.entity.Order;
import com.ms.library.exception.DaoExceprion;

public interface OrderService {

	boolean borrowBook(Order o);
	boolean returnBook(Order o);
	boolean payBook(Order o) throws DaoExceprion;
	Order findOrderById(String id);
	List<Order> findOrderByUserId(String id);
	boolean deleteOrder(String id);
	List<Order> findOrderAll();
	List<Order> findOrderAllExp();
	List<Order> findOrderAllNoExp();
	List<Order> findOrderAllLose();
}
