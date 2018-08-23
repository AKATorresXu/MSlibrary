package com.ms.library.service.impl;

import java.util.List;

import com.ms.library.dao.CategoryDao;
import com.ms.library.dao.impl.CategoryDaoImpl;
import com.ms.library.entity.Category;
import com.ms.library.exception.DaoExceprion;
import com.ms.library.exception.ServiceException;
import com.ms.library.service.CategoryService;

public class CategoryServiceImpl implements CategoryService{

	CategoryDao categoryDao = new CategoryDaoImpl();
	@Override
	public List<Category> findCategoryAll() throws ServiceException {
		try {
			return categoryDao.findCategoryAll();
		} catch (DaoExceprion e) {
			e.printStackTrace();
			throw new ServiceException("service操作异常");
		}
	}

	@Override
	public String findCategoryName(String id) {
		String name = null;
		try {
			name = categoryDao.findCategoryById(id).getCategory();
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public void addCategory(Category category) throws ServiceException {
		Category cate = null;
		
		try {
			cate = categoryDao.findCategoryByCategory(category.getCategory());
			if(cate.getCategory()!=null){
				throw new ServiceException("分类名称已存在！");
			}else{
				categoryDao.addCategory(category);
			}
		} catch (DaoExceprion e) {
			e.printStackTrace();
			throw new ServiceException("service操作异常，添加失败！");
		}
		
	}

}
