package com.ms.library.service;

import java.util.List;

import com.ms.library.entity.Book;
import com.ms.library.exception.ServiceException;

public interface BookService {
	List<Object[]> findAllBookAndCategory();

	List<Object[]> findHotBook();

	Book findBookById(String bookId);

	List<Object[]> findAllBookAndCategoryByKey(String key) throws ServiceException;
	
	boolean addBook(Book b) throws ServiceException;
	
	boolean updateBook(Book b )throws ServiceException;
	
	boolean bookCanDelete(String id) throws ServiceException;
	
	boolean deleteBook(String bookId) throws ServiceException;
}
