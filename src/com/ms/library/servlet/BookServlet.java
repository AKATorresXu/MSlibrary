package com.ms.library.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ms.library.entity.Book;
import com.ms.library.entity.Category;
import com.ms.library.entity.User;
import com.ms.library.exception.ServiceException;
import com.ms.library.service.BookService;
import com.ms.library.service.CategoryService;
import com.ms.library.service.UserService;
import com.ms.library.service.impl.BookServiceImpl;
import com.ms.library.service.impl.CategoryServiceImpl;
import com.ms.library.service.impl.UserServiceImpl;
import com.ms.utils.IdUtil;

//@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookService bs = new BookServiceImpl();
	private CategoryService cs = new CategoryServiceImpl();
	private UserService us = new UserServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getParameter("path");
		HttpSession se = request.getSession();
		User user = (User) se.getAttribute("User");
		User new_user = us.findUserByName(user.getUsername());
		se.setAttribute("User", new_user);
		switch (path) {
		case "findBook":
			findBookByName(request,response);
			break;
		case "select":
			try {
				bookList(request,response);
			} catch (ServiceException e) {
				e.printStackTrace();
			}
			break;
		case "toaddbook":
			try {
				toAddBook(request,response);
			} catch (ServiceException e) {
				e.printStackTrace();
			}
			break;
		case "tomanage":
			
			try {
				toManage(request,response);
			} catch (ServiceException e1) {
				e1.printStackTrace();
			}
			break;
		case "addbook":
			try {
				addBook(request,response);
			} catch (ServiceException e) {
				e.printStackTrace();
			}
			break;
		case "toupdate":
				toUpdateBook(request,response);
				break;
		case "update" :
				updateBook(request,response);
				break;
		case "delete":
				deleteBook(request,response);
				break;
		default:
			break;
		}
		
	}

	private void deleteBook(HttpServletRequest request, HttpServletResponse response) {
		
		String bookId = request.getParameter("bookId");
		boolean boo = false;
		try {
			boo = bs.deleteBook(bookId);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		if(boo)
		{
			try {
				request.setAttribute("message", "删除成功！");
				toManage(request,response);
			} catch (ServiceException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}
		else
		{
			request.setAttribute("message", "删除书籍失败！原因未知");
			try {
				request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void toUpdateBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bookId = request.getParameter("bookId");
		
		Book b = bs.findBookById(bookId);
		List<Category> cates = null;
		try {
			cates = cs.findCategoryAll();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("cates", cates);
		request.setAttribute("book", b);
		
		request.getRequestDispatcher("/WEB-INF/book/book_update.jsp").forward(request, response);;
		
		
		
		
		
	}

	private void toManage(HttpServletRequest request, HttpServletResponse response) throws ServiceException, ServletException, IOException {
		
		List<Object[]>  booklsit = null;
		String key = request.getParameter("key");
		if(key==null)
		{
			booklsit = bs.findAllBookAndCategory();
		}
		else
		{
			booklsit = bs.findAllBookAndCategoryByKey(key);
		}
		request.setAttribute("bookList", booklsit);
		request.getRequestDispatcher("/WEB-INF/book/book_manage_list.jsp").forward(request, response);
		
		
	}
	private void updateBook(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		String bookName = new String(request.getParameter("bookName").getBytes("iso-8859-1"),"UTF-8");
		String author = new String(request.getParameter("author").getBytes("iso-8859-1"),"UTF-8");
		String bookId = new String(request.getParameter("bookId").getBytes("iso-8859-1"),"UTF-8");
		int stock = Integer.parseInt(request.getParameter("stock"));
		int borrowcount = Integer.parseInt(request.getParameter("borrowcount"));
		String cateId = request.getParameter("cate");
		double bookprice = Double.parseDouble(request.getParameter("bookprice"));
		double borrowprice = Double.parseDouble(request.getParameter("borrowprice"));
		
		Book b = new Book(bookId, bookName, author, cateId, bookprice, borrowprice,borrowcount,stock);
		boolean boo = false;
		try {
			boo = bs.updateBook(b);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		if(boo)
		{
			try {
				request.setAttribute("message", "修改书籍成功！");
				toManage(request,response);
			} catch (ServiceException | ServletException | IOException e) {
				e.printStackTrace();
			}
		}
		else
		{
			request.setAttribute("message", "修改书籍失败！原因未知");
			try {
				request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		
		
	}

	
	
	
	//����鼮
	private void addBook(HttpServletRequest request, HttpServletResponse response) throws ServiceException, ServletException, IOException {
		
		
		String bookName = new String(request.getParameter("bookName").getBytes("iso-8859-1"),"UTF-8");
		String author = new String(request.getParameter("author").getBytes("iso-8859-1"),"UTF-8");
		int stock = Integer.parseInt(request.getParameter("stock"));
		String cateId = request.getParameter("cate");
		double bookprice = Double.parseDouble(request.getParameter("bookprice"));
		double borrowprice = Double.parseDouble(request.getParameter("borrowprice"));
		
		Book b = new Book(IdUtil.getUUID(), bookName, author,cateId,bookprice, borrowprice,0,stock);
		
		boolean boo = bs.addBook(b);
		
		if(boo)
		{
			try {
				toManage(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			};
			return;
		}
		else
		{
			request.setAttribute("message", "添加书籍失败！原因未知");
			request.getRequestDispatcher("/WEB-INF/500error.jsp").forward(request, response);
		}
		
		
	}

	private void toAddBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServiceException {
		
		
		List<Category> data = cs.findCategoryAll();
		
		request.setAttribute("data", data);
		request.getRequestDispatcher("/WEB-INF/book/addbook.jsp").forward(request, response);
		
		
		
	}

	private void bookList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServiceException {
		
		List<Object[]>  booklsit = null;
		String key = request.getParameter("key");
		if(key==null)
		{
			booklsit = bs.findAllBookAndCategory();
		}
		else
		{
			booklsit = bs.findAllBookAndCategoryByKey(key);
		}
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setAttribute("bookList", booklsit);
		request.getRequestDispatcher("/WEB-INF/book/book_list.jsp").forward(request, response);
	}

	private void findBookByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String bookId = request.getParameter("bookId");
//		String cate = new String(request.getParameter("cate").getBytes("iso-8859-1"),"utf-8");
		
		Book b = bs.findBookById(bookId);
		String cate = new CategoryServiceImpl().findCategoryName(b.getCategory_id());
		request.setAttribute("book", b);
		request.setAttribute("cate", cate);
		request.getRequestDispatcher("/WEB-INF/book/book_message.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
	}
}
