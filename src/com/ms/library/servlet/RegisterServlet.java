package com.ms.library.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ms.library.entity.User;
import com.ms.library.exception.ServiceException;
import com.ms.library.service.UserService;
import com.ms.library.service.impl.UserServiceImpl;
import com.ms.utils.IdUtil;

//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{
	
	UserService readerService = new UserServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String name = request.getParameter("name");
		String password = request.getParameter("password1");
		String sex = request.getParameter("sex");
		String tel = request.getParameter("tel");
		
		User reader = new User();
		reader.setId(IdUtil.getUUID());
		reader.setUsername(name);
		reader.setPassword(password);
		reader.setSex(sex);
		reader.setTel(tel);
		reader.setBalance(0);
		
		try {
			readerService.addUser(reader);
			request.setAttribute("message", "恭喜您，注册成功");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} catch (ServiceException e) {
			request.setAttribute("message", "对不起，注册失败，用户名已存在！");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

}
