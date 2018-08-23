package com.ms.library.service;

import java.util.List;

import com.ms.library.entity.Category;
import com.ms.library.exception.ServiceException;

public interface CategoryService {

	public List<Category> findCategoryAll() throws ServiceException ;
	public String findCategoryName(String id);
	public void addCategory(Category category) throws ServiceException;
}
