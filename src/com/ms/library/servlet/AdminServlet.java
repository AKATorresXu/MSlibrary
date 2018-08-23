package com.ms.library.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ms.library.entity.User;
import com.ms.library.exception.ServiceException;
import com.ms.library.service.BookService;
import com.ms.library.service.UserService;
import com.ms.library.service.impl.BookServiceImpl;
import com.ms.library.service.impl.UserServiceImpl;


public class AdminServlet extends HttpServlet{
	UserService userService = new UserServiceImpl();
	BookService bs = new BookServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String path = request.getParameter("path");
		
		switch (path) {
		case "toReaderManage":
			request.getRequestDispatcher("/WEB-INF/admin/reader_manage.jsp").forward(request, response);
			break;
		case "toupdatePwd":
			request.getRequestDispatcher("/WEB-INF/admin/updatepwd.jsp").forward(request, response);
			break;	
		case "updatePwd":
			try {
				updatePwd(request,response);
			} catch (ServiceException e) {
				e.printStackTrace();
			}
			break;	
		case "recharge":
			recharge(request,response);
			break;	
			
			
		default:
			break;
		}
	}
	
	private void recharge(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int money = Integer.valueOf(request.getParameter("money"));
		String name = request.getParameter("readerName");
		
		User reader = new User();
		reader.setUsername(name);
		reader.setBalance(money);
		
		try {
			userService.updateBalance(reader);
			
			List<Object[]> data = bs.findAllBookAndCategory();
			request.setAttribute("data", data);
			request.setAttribute("message", "充值成功！");
			request.getRequestDispatcher("/WEB-INF/admin/admin_index.jsp").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
			List<Object[]> data = bs.findAllBookAndCategory();
			request.setAttribute("data", data);
			request.setAttribute("message", "充值失败！");
			request.getRequestDispatcher("/WEB-INF/admin/admin_index.jsp").forward(request, response);
		}
	}


	

	private void updatePwd(HttpServletRequest request, HttpServletResponse response) throws ServiceException, ServletException, IOException {
		
		User admin = (User) request.getSession().getAttribute("User");
		String oldpwd = request.getParameter("oldPwd");
		
		String newPwd = request.getParameter("newpwd");
		boolean boo = false;
		
		if(oldpwd.equals(admin.getPassword()))
		{
			admin.setPassword(newPwd);
			System.out.println(admin.getPassword());
			userService.updateUserPassword(admin);
			request.getSession().invalidate();
			request.setAttribute("errorMsg", "密码修改成功！请重新登录！");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		
//		if(boo)
//		{
//			request.getSession().invalidate();
//			request.setAttribute("errorMsg", "密码修改成功！请重新登录！");
//			request.getRequestDispatcher("/login.jsp").forward(request, response);
//		}
		else
		{
			request.setAttribute("message", "密码修改失败！请检查密码是否正确！");
			request.getRequestDispatcher("/WEB-INF/admin/updatepwd.jsp").forward(request, response);
		}
		
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
