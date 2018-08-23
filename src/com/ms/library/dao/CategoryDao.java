package com.ms.library.dao;

import java.util.List;

import com.ms.library.entity.Category;
import com.ms.library.exception.DaoExceprion;


public interface CategoryDao {
	int addCategory(Category ca) throws DaoExceprion; 
	int updateCategory(Category ca)throws DaoExceprion;
	Category findCategoryById(String id)throws DaoExceprion;
	List<Category> findCategoryAll()throws DaoExceprion;
	Category findCategoryByCategory(String category) throws DaoExceprion;
}
