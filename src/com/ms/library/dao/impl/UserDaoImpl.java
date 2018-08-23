package com.ms.library.dao.impl;

import com.ms.utils.JdbcUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.ms.library.entity.User;
import com.ms.library.exception.DaoExceprion;
import com.ms.library.dao.UserDao;

public class UserDaoImpl extends JdbcUtil implements UserDao {

	public Connection getConnection() {
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/mslibrary?useUnicode=true&characterEncoding=UTF-8";
		String driver = "com.mysql.jdbc.Driver";
		String root = "root";
		String password = "123456";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, root, password);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return conn;
	}
	@Override
	public User selectUserByName(String username) {
		User user = null ;
		try {
			Connection conn = getConnection();
			String sql = "SELECT * FROM user WHERE username=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				user =  new User();
				String id = rs.getString(1);
				String r_name = rs.getString(2);
				String password = rs.getString(3);
				String sex = rs.getString(4);
				double balance = rs.getDouble(5);
				String tel = rs.getString(6);
				int type=rs.getInt(7);
				
				user.setId(id);
				user.setUsername(r_name);
				user.setPassword(password);
				user.setBalance(balance);
				user.setSex(sex);
				user.setTel(tel);
				user.setType(type);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("持久层异常，数据查询失败！");
		}
		return user;
	}

	@Override
	public User selectUserById(String id) throws DaoExceprion{
		User user = new User();
		try {
			String sql = "SELECT * FROM user WHERE id=?";
			Object[] obj = {id};
			List<User> list = selectMethod(User.class, sql, obj);
			user = list.get(0);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常！");
		}
		return user;
	}

	@Override
	public void addUser(User user) {
		String sql = "INSERT INTO user(id,username,password,sex,balance,tel,type) VALUES (?,?,?,?,?,?,2)";
		Object[] obj = {user.getId(),user.getUsername(),user.getPassword(),user.getSex(),user.getBalance(),user.getTel()};
		try {
			updateMethod(sql, obj);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("持久层异常，数据查询失败！");
		}
	}

	@Override
	public void updateUser(User user) throws DaoExceprion{
		String sql = "UPDATE user SET username=?,sex=?,tel=? WHERE id=?";
		Object[] obj = {user.getUsername(),user.getSex(),user.getTel(),user.getId()};
			try {
				updateMethod(sql, obj);
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DaoExceprion("持久层异常，数据更新失败！");
			}
		
	}


	@Override
	public void updateUserPassword(User user) throws DaoExceprion {
		try {
			String sql = "UPDATE user SET password=? WHERE id=?";
			Object[] obj = {user.getPassword(),user.getId()};
			updateMethod(sql, obj);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoExceprion("密码更新失败，持久层异常！");
		}
		
	}

	@Override
	public void updateUserBalance(User user) throws DaoExceprion {
		try {
			String sql = "update user set balance=balance+? where username=?";
			Object[] obj = {user.getBalance(),user.getUsername()};
			updateMethod(sql, obj);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoExceprion("余额充值失败，持久层异常！");
		}
	
	}
	public boolean findAdimBy(User admin) throws DaoExceprion {
		String sql = "select * from user where username=? and password=?";
		List<User> list = null;
		
		try {
			list = JdbcUtil.selectMethod(User.class, sql,admin.getUsername(),admin.getPassword() );
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常");
		}
		
		return list==null||list.size()==0?false:true;
	}
	
public boolean updateAdmin(User admin) throws DaoExceprion {
		
		String sql = "update user set username=?,password=? where id=?";
		int temp = 0;
		
		try {
			temp = JdbcUtil.updateMethod(sql, admin.getUsername(),admin.getPassword(),admin.getId());
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常");
		}
		
		return temp==0?false:true;
	}
}
