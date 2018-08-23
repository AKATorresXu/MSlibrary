package com.ms.library.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ms.library.dao.BookDao;
import com.ms.library.dao.CategoryDao;
import com.ms.library.dao.impl.BookDaoImpl;
import com.ms.library.dao.impl.CategoryDaoImpl;
import com.ms.library.entity.Book;
import com.ms.library.entity.Category;
import com.ms.library.exception.DaoExceprion;
import com.ms.library.exception.ServiceException;
import com.ms.library.service.BookService;

public class BookServiceImpl implements BookService{
	BookDao bookDao = new BookDaoImpl();
	CategoryDao categoryDao = new CategoryDaoImpl();
	
	@Override
	public List<Object[]> findAllBookAndCategory() {
		List<Book> bookList = null;
		List<Category> categoryList = null;

		List<Object[]> data = new ArrayList<Object[]>();
		try {
			bookList = bookDao.findBookAll();
			categoryList = categoryDao.findCategoryAll();
			for (Book b : bookList) {
				for (Category c : categoryList) {
					if (b.getCategory_id().equals(c.getId())) {
						Object[] bookAndCategory = { b, c.getCategory(),bookCanDelete(b.getId()) };
						data.add(bookAndCategory);
						break;
					}
				}
			}
		} catch (DaoExceprion e) {
			throw new RuntimeException(e);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public List<Object[]> findHotBook() {
		List<Book> hotBookList = null;
		List<Category> categoryList = null;
		List<Object[]> hotBook = new ArrayList<Object[]>();
		try {
			hotBookList = bookDao.findHotBook();
			categoryList = categoryDao.findCategoryAll();
			for (Book b : hotBookList) {
				for (Category c : categoryList) {
					if (b.getCategory_id().equals(c.getId())) {
						Object[] bookAndCategory = { b, c.getCategory()};
						hotBook.add(bookAndCategory);
						break;
					}
				}
			}
		} catch (DaoExceprion e) {
			throw new RuntimeException(e);
		}
		return hotBook;
	}

	@Override
	public Book findBookById(String bookId) {
		try {
			return bookDao.findBook(bookId);
		} catch (DaoExceprion e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Object[]> findAllBookAndCategoryByKey(String key) throws ServiceException {
		List<Category> categoryList = null;
		List<Book > bookList = null;
		List<Object[]> bookOfKey = new ArrayList<Object[]>();
		try {
			categoryList = categoryDao.findCategoryAll();
			bookList = bookDao.findBookAllByKey(key);
		} catch (DaoExceprion e) {
			e.printStackTrace();
			throw new ServiceException("数据查询异常");
		}
		
		for (Book b : bookList) {
			for (Category c : categoryList) {
				if (b.getCategory_id().equals(c.getId())) {
					Object[] bookAndCategory = { b, c.getCategory(),bookCanDelete(b.getId())};
					bookOfKey.add(bookAndCategory);
					break;
				}
			}
		}
		return bookOfKey;
	}

	@Override
	public boolean addBook(Book b) throws ServiceException {
		int temp = 0;
		try {
			temp = bookDao.addBook(b);
		} catch (DaoExceprion e) {
			e.printStackTrace();
			throw new ServiceException("书籍插入异常");
		}
		
		return temp==1?true:false;
	}

	@Override
	public boolean updateBook(Book b) throws ServiceException {
		int temp = 0;
		try {
			temp = bookDao.updateBook(b);
		} catch (DaoExceprion e) {
			e.printStackTrace();
			throw new ServiceException("书籍更新异常");
		}
		
		return temp==1?true:false;
	}

	@Override
	public boolean bookCanDelete(String id) throws ServiceException {
		try {
			return bookDao.canDelete(id);
		} catch (DaoExceprion e) {
			e.printStackTrace();
			throw new ServiceException("书籍判断查询异常");
		}
	}

	@Override
	public boolean deleteBook(String bookId) throws ServiceException {
		int temp = -1;
		try {
			temp = bookDao.deleteBook(bookId);
		} catch (DaoExceprion e) {
			e.printStackTrace();
			throw new ServiceException("书籍删除异常");
		}
		
		return temp==1?true:false;
	}

}
