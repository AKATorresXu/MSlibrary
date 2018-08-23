package com.ms.library.dao;
import java.util.List;

import com.ms.library.entity.Book;
import com.ms.library.exception.DaoExceprion;

public interface BookDao {
	int addBook(Book book) throws DaoExceprion;
	int updateBook(Book book)throws DaoExceprion;
	List<Book> findBookAll()throws DaoExceprion;
	List<Book> findBookAll(String type)throws DaoExceprion;
	Book findBook(String id)throws DaoExceprion;
	List<Book> findHotBook()throws DaoExceprion;
	List<Book> findBookAllByKey(String key)throws DaoExceprion;
	int deleteBook(String bookId) throws DaoExceprion;
	boolean canDelete(String id) throws DaoExceprion;
}
