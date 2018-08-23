package com.ms.library.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

//@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {

	CategoryService categoryService = new CategoryServiceImpl();
	BookService bs = new BookServiceImpl();
	private UserService us = new UserServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession se = request.getSession();
		
		String path = request.getParameter("path");
		User user = (User) se.getAttribute("User");
		User new_user = us.findUserByName(user.getUsername());
		se.setAttribute("User", new_user);
		
		if(path.equals("toAddCategory")){
			request.getRequestDispatcher("//WEB-INF/category/book_manage_list.jsp").forward(request, response);
		}
		if(path.equals("readerManage")){
			request.getRequestDispatcher("//WEB-INF/category/book_manage_list.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession se = request.getSession();
		
		String path = request.getParameter("path");
		User user = (User) se.getAttribute("User");
		User new_user = us.findUserByName(user.getUsername());
		se.setAttribute("User", new_user);
		
		if(path.equals("addCategory")){
			String categoryName = request.getParameter("categoryName");
			
			Category category = new Category();
			
			category.setId(IdUtil.getUUID());
			category.setCategory(categoryName);
			
			try {
				categoryService.addCategory(category);
				List<Object[]> bookList = bs.findAllBookAndCategory();
				request.setAttribute("bookList", bookList);
				request.setAttribute("message", "添加分类成功！");
				request.getRequestDispatcher("/WEB-INF/book/book_manage_list.jsp").forward(request, response);
			} catch (ServiceException e) {
				request.setAttribute("message", "添加分类失败！");
				request.getRequestDispatcher("//WEB-INF/category/book_manage_list.jsp").forward(request, response);
			}
		}
	}
}
