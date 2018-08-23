package com.ms.library.dao.impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.ms.library.dao.BookDao;
import com.ms.library.entity.Book;
import com.ms.library.exception.DaoExceprion;
import com.ms.utils.JdbcTool;
import com.ms.utils.JdbcUtil;

public class BookDaoImpl implements BookDao {

	@Override
	public int addBook(Book book) throws DaoExceprion {
		String sql = "insert into book values(?,?,?,?,?,?,?,?)";
		Object[] obj = {book.getId(),book.getBookname(),book.getAuthor(),book.getCategory_id(),book.getBookprice(),book.getBorrowprice(),book.getBorrowcount(),book.getRestcount()};
		int temp = 0;
		try {
			temp = JdbcUtil.updateMethod(sql, obj);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，数据插入错误");
		}
		return temp;
	}

	@Override
	public int updateBook(Book book) throws DaoExceprion {
		String sql = "update book set bookname=?, author=?, category_id=?, bookprice=?, borrowprice=?, borrowcount=?, restcount=? where id=?";
		Object[] obj = {book.getBookname(), book.getAuthor(), book.getCategory_id(), book.getBookprice(), book.getBorrowprice(), book.getBorrowcount(), book.getRestcount(), book.getId()};
		int temp = 0;
		try {
			temp = JdbcUtil.updateMethod(sql, obj);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，数据更新错误");
		}
		
		return temp;
	}

	@Override
	public List<Book> findBookAll() throws DaoExceprion {
String sql = "select * from book;";
		
		
		try {
			return JdbcUtil.selectMethod(Book.class, sql);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常");
		}
	}

	@Override
	public List<Book> findBookAll(String type) throws DaoExceprion {
		String sql = "select * from book where category_id=?";
		
		try {
			return JdbcUtil.selectMethod(Book.class, sql, type);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常");
		}
	}

	@Override
	public Book findBook(String id) throws DaoExceprion {
		String sql = "SELECT * FROM book WHERE id=?";
		List<Book> list = null;
		try {
			list = JdbcUtil.selectMethod(Book.class, sql,id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常");
		}
		return list==null||list.size()!=0?list.get(0):null;
	}

	@Override
	public List<Book> findHotBook() throws DaoExceprion {
		String sql = "select * from book order by borrowcount DESC";
		Object[] obj = null;
		try {
			return JdbcUtil.selectMethod(Book.class, sql, obj);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常");
		}
	}

	@Override
	public List<Book> findBookAllByKey(String key) throws DaoExceprion {
		String sql = "SELECT * FROM book WHERE bookname LIKE ? UNION SELECT * FROM book WHERE `author` LIKE ? UNION SELECT * FROM book WHERE category_id IN (SELECT id FROM category  WHERE `category` LIKE ? )";
		
		List<Book> list = null;
		
		try {
			list = JdbcUtil.selectMethod(Book.class, sql, "%"+key+"%","%"+key+"%","%"+key+"%");
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常");
		}
		
		return list;
	}
	
	public static void main(String[] args) throws DaoExceprion {
		new BookDaoImpl().canDelete("1");
	}

	@Override
	public int deleteBook(String bookId) throws DaoExceprion {
		String sql = "delete from book where id=?;";
		int temp = -1;
		try {
			temp = JdbcUtil.updateMethod(sql, bookId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常,删除是失败");
		}
		return temp;
	}

	@Override
	public boolean canDelete(String id) throws DaoExceprion {
		String sql = "SELECT COUNT(id) FROM `order` WHERE book_id=? AND expiredate IS NULL; ";
		
		Connection conn=null;
		ResultSet rs=null;
		PreparedStatement ps = null;
		int count = 0;
		try {
			conn = JdbcTool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs= ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			JdbcTool.closeResore(rs, ps, conn);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return count!=0?true:false;
	}

}
