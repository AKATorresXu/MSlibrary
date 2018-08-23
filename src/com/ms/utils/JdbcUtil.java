package com.ms.utils;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ms.library.entity.Book;
import com.ms.library.entity.User;
import com.ms.utils.JdbcTool;

public class JdbcUtil {


	public static <T> List<T> selectMethod(Class<T> clazz, String sql,
			Object... args) throws SQLException  {
		T entity = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<T> list = new ArrayList<T>();
		// 获取连接
		try{
		connection = JdbcTool.getConnection();
		// 创建preparedstatement对象
		preparedStatement = connection.prepareStatement(sql);
		// 赋值
		if (args != null) {
			for (int i = 0; i < args.length; i++) {
				preparedStatement.setObject(i + 1, args[i]);
			}
		}
		// 执行查询
		resultSet = preparedStatement.executeQuery();
		// 得到ResultSetMetaData对象
		ResultSetMetaData rsmd = resultSet.getMetaData();
		// 处理结果集，利用ResultSetMetaData
		while (resultSet.next()) {
			// 利用反射创建对象
			entity = clazz.newInstance();
			for (int i = 0; i < rsmd.getColumnCount(); i++) {
				String columnLabel = rsmd.getColumnLabel(i + 1);
				Object columnValue = resultSet.getObject(i + 1);
				Field field = clazz.getDeclaredField(columnLabel);// 获取属性
				field.setAccessible(true);// 打开访问权限
				field.set(entity, columnValue);// 赋值
			}

			list.add(entity);// 将实例传入list中
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			JdbcTool.closeResore(resultSet, preparedStatement, connection);
		}
		// 释放资源
		
		return list;
	}
	
	/**
	 * 更新的方法 返回更新的记录数量
	 * @throws SQLException 
	 */
	public static int updateMethod(String sql, Object... args) throws SQLException  {
		int flag = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try{
		connection = JdbcTool.getConnection();
		preparedStatement = connection.prepareStatement(sql);
		if (args != null) {
			for (int i = 0; i < args.length; i++) {
				preparedStatement.setObject(i + 1, args[i]);// 赋值操作---给preparestatement
			}
		}
		
		flag = preparedStatement.executeUpdate();// 执行sql语句
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			// 释放资源
			preparedStatement.close();
			connection.close();
		}
		
		return flag;
	}

	
	public static int updateMethod(String[] sql, List<Object[]> list)
			throws Exception {
		int flag = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		connection = JdbcTool.getConnection();
		// 关闭自动提交，管理事务
		connection.setAutoCommit(false);
		try {
			
			for (int i = 0; i < sql.length; i++) {
				preparedStatement = connection.prepareStatement(sql[i]);
				if (list.get(i) != null) {
					for (int k = 0; k < list.get(i).length; k++) {
						preparedStatement.setObject(k + 1, list.get(i)[k]);// 赋值操作---给preparestatement
					}
				}
				flag += preparedStatement.executeUpdate();// 执行sql语句
			}
			
		} 
		catch (Exception e) {
			System.err.println("插入时出现异常~~");
			System.out.println(e);
			connection.rollback();
		} finally {
			// 释放资源
			connection.setAutoCommit(true);
			preparedStatement.close();
			connection.close();
		}

		
		
		return flag;
	}

}
