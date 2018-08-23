package com.ms.library.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.ms.library.dao.CategoryDao;
import com.ms.library.entity.Category;
import com.ms.library.exception.DaoExceprion;
import com.ms.utils.JdbcUtil;

public class CategoryDaoImpl implements CategoryDao {

	@Override
	public int addCategory(Category ca) throws DaoExceprion {
		String sql = "insert into category values(?,?)";

		try {
			return JdbcUtil.updateMethod(sql, ca.getId(), ca.getCategory());
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，数据插入错误");
		}
	}

	@Override
	public int updateCategory(Category ca) throws DaoExceprion {
		String sql = "update category set `category`=? where id=? ";

		try {
			return JdbcUtil.updateMethod(sql, ca.getCategory(), ca.getId());
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常，数据更新错误");
		}
	}

	@Override
	public Category findCategoryById(String id) throws DaoExceprion {
		String sql = "select * from category where id =?";

		List<Category> list = null;

		try {
			list = JdbcUtil.selectMethod(Category.class, sql, id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常");
		}

		return list == null || list.size() == 0 ? null : list.get(0);
	}

	@Override
	public List<Category> findCategoryAll() throws DaoExceprion {
		String sql = "select * from category;";

		try {
			return JdbcUtil.selectMethod(Category.class, sql);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常");
		}
	}

	@Override
	public Category findCategoryByCategory(String category) throws DaoExceprion {
		Category cate = null;
		String sql = "SELECT * FROM category WHERE `category`=?";
		Object[] obj = { category };
		try {
			cate = new Category();
			List<Category> list = JdbcUtil.selectMethod(Category.class, sql,
					obj);
			if (list!=null&&list.size()!=0) {
				cate = list.get(0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoExceprion("持久层异常");
		}
		return cate;
	}

}
