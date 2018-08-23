package com.ms.library.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ms.utils.JdbcUtil;
import com.ms.library.entity.Order;
import com.ms.library.dao.OrderDao;
import com.ms.library.exception.DaoExceprion;

public class OrderDaoImpl implements OrderDao {

	@Override
	public int addOrder(Order b) throws DaoExceprion {
		String sql = "insert into `order` values(?,?,?,?,?,?)";
		Object[] obj = {b.getId(),b.getBook_id(),b.getUser_id(),b.getBorrowdate(),b.getExpiredate(),b.getPrice()};
		String sql2 = "update book set restcount = restcount-1,borrowcount = borrowcount+1 where id = ? and restcount>0";
		Object[] obj2 = {b.getBook_id()};
		
		String[] sqls = {sql,sql2};
		List<Object[]> list = new ArrayList<Object[]>();
		list.add(obj);
		list.add(obj2);
		int temp = 0;
		try {
			temp = JdbcUtil.updateMethod(sqls, list);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，数据插入错误");
		}
		return temp;		
	}

	@Override
	public int updateOrder(Order b) throws DaoExceprion {
		//���¶�����
				String sql0 = "update `order` set expiredate=? ,price=? where id = ?";
				//���黹����Ż��鼮��
				String sql1 = "update book set restcount = restcount+1 where id=?";
				//���û�������п۳��۸�
				String sql2 = "update user set balance = balance-? where id = ?";
				
				String[] sql = {sql0,sql1,sql2};
				List<Object[]> list = new ArrayList<Object[]>();
				list.add(new Object[]{b.getExpiredate(),b.getPrice(),b.getId()});
				list.add(new Object[]{b.getBook_id()});
				list.add(new Object[]{b.getPrice(),b.getUser_id()});
				int temp = 0;
				try {
					temp = JdbcUtil.updateMethod(sql, list);
				} catch (Exception e1) {
					e1.printStackTrace();
					throw new DaoExceprion("持久层异常，订单更新失败");
				}
				return temp;
	}

	@Override
	public int deleteOrder(String id) throws DaoExceprion {
		String sql = "delete from `order` where id=?";
		int temp = 0;
		try {
			temp = JdbcUtil.updateMethod(sql, id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，订单删除失败");
		}
		
		return temp;
	}

	@Override
	public Order findOrder(String id) throws DaoExceprion {
		String sql = "select * from `order` where id = ?";
		List<Order> list = null;
		try {
			list = JdbcUtil.selectMethod(Order.class, sql, id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，订单查询失败");
		}
		return list==null||list.size()==0?null:list.get(0);
	}

	@Override
	public List<Order> findOrder(int type, Object... args) throws DaoExceprion {
		List<Order> list = null;
		switch (type) {
		case OrderDao.FINDORDER_BY_BOOKID:
			list = findOrderByBookID((String)args[0]);
			break;
		case OrderDao.FINDORDER_BY_USERID:
			list = findOrderByUserID((String)args[0]);
			break;
		case OrderDao.FINDORDER_BY_USER_NOEXP:
			list = findOrderByUserNoExp();
			break;
		case OrderDao.FINDORDER_BY_USER_EXP:
			list = findOrderByUserExp();
			break;
		case OrderDao.FINDORDER_ALL:
			list = findOrderAll();
			break;
		case OrderDao.FINDORDER_ALL_LOSE:
			list = findOrderAllLose();
			break;
		default:
			throw new DaoExceprion("持久层异常，未知参数值type --> "+type);
		}
		return list;
	}

	private List<Order> findOrderAllLose()throws DaoExceprion {
		String sql = "select * from `order` WHERE expiredate = '9999-12-31' order by book_id";
		List<Order> list = null;
		try {
			list = JdbcUtil.selectMethod(Order.class, sql);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoExceprion("�־ò��쳣��������ѯʧ��");
		}
		return list;
	}

	private List<Order> findOrderAll()throws DaoExceprion {
		String sql = "select * from `order` order by book_id";
		List<Order> list = null;
		try {
			list = JdbcUtil.selectMethod(Order.class, sql);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，订单查询失败");
		}
		return list;
	}

	private List<Order> findOrderByUserExp()throws DaoExceprion {
		String sql = "select * from `order` where  expiredate is not null;";
		List<Order> list = null;
		try {
			list = JdbcUtil.selectMethod(Order.class, sql);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，订单查询失败");
		}
		return list;
	}

	private List<Order> findOrderByUserNoExp()throws DaoExceprion {
		String sql = "select * from `order` where  expiredate is null";
		List<Order> list = null;
		try {
			list = JdbcUtil.selectMethod(Order.class, sql);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，订单查询失败");
		}
		return list;
	}

	private List<Order> findOrderByUserID(String args)throws DaoExceprion {
		String sql = "select * from `order` where user_id=? order by expiredate ASC, book_id ASC;";
		List<Order> list = null;
		try {
			list = JdbcUtil.selectMethod(Order.class, sql, args);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，订单查询失败");
		}
		return list;
	}

	private List<Order> findOrderByBookID(String bookId)throws DaoExceprion {
		String sql = "select * from `order` where book_id=?";
		List<Order> list = null;
		try {
			list = JdbcUtil.selectMethod(Order.class, sql, bookId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，订单查询失败");
		}
		return list;
		
	}

	@Override
	public int payBookOrder(Order b) throws DaoExceprion {
		//���¶�����
		String sql0 = "update `order` set expiredate=? ,price=? where id = ?";
		//���黹����Ż��鼮��
//		String sql1 = "update book set stock = stock+1 where id=?";
		//���û�������п۳��۸�
		String sql2 = "update user set balance = balance-? where id = ?";
		
		String[] sql = {sql0,sql2};
		List<Object[]> list = new ArrayList<Object[]>();
		list.add(new Object[]{b.getExpiredate(),b.getPrice(),b.getId()});
//		list.add(new Object[]{b.getBook_id()});
		list.add(new Object[]{b.getPrice(),b.getUser_id()});
		int temp = 0;
		try {
			temp = JdbcUtil.updateMethod(sql, list);
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new DaoExceprion("持久层异常，订单查询失败");
		}
		return temp;
	}

}
