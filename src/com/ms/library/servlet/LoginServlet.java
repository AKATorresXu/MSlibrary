package com.ms.library.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ms.library.service.UserService;
import com.ms.library.entity.User;
import com.ms.library.service.BookService;
import com.ms.library.service.CategoryService;
import com.ms.library.service.impl.BookServiceImpl;
import com.ms.library.service.impl.CategoryServiceImpl;
import com.ms.library.service.impl.UserServiceImpl;

//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
	UserService UserService = new UserServiceImpl();
	BookService bookService = new BookServiceImpl();
	CategoryService categoryService = new CategoryServiceImpl();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String name = request.getParameter("name");
		String password = request.getParameter("pwd");
		
		User user = UserService.findUserByName(name);
		if(user == null) {
			request.setAttribute("errorMsg", "用户不存在！");
			request.getRequestDispatcher("/index.jsp").forward(request,
					response);
		}
		else if(!user.getPassword().equals(password)) {
			request.setAttribute("errorMsg", "密码错误！");
			request.getRequestDispatcher("/index.jsp").forward(request,
					response);
		}
		else {
			if(user.getType() == 1) {
				List<Object[]> data = bookService.findAllBookAndCategory();
				request.setAttribute("data", data);
				request.getSession().setAttribute("User", user);
				request.getRequestDispatcher("/WEB-INF/admin/admin_index.jsp").forward(request,
						response);
			}
			else {
				List<Object[]> hotBook = bookService.findHotBook();
				request.setAttribute("hotBook", hotBook);
				request.getSession().setAttribute("User", user);
				request.getRequestDispatcher("WEB-INF/book/book_index.jsp").forward(request,
						response);
			}
		}
		
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Object[]> data = bookService.findAllBookAndCategory();
		req.setAttribute("data", data);
		req.getRequestDispatcher("/WEB-INF/admin/admin_index.jsp").forward(req,
				resp);
	}
}
