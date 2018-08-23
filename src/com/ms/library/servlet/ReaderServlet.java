package com.ms.library.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ms.library.entity.User;
import com.ms.library.exception.ServiceException;
import com.ms.library.service.BookService;
import com.ms.library.service.UserService;
import com.ms.library.service.impl.BookServiceImpl;
import com.ms.library.service.impl.UserServiceImpl;

//@WebServlet("/ReaderServlet")
public class ReaderServlet extends HttpServlet{
	BookService bookService = new BookServiceImpl();
	UserService readerService = new UserServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String method = request.getParameter("method");
		HttpSession se = request.getSession();
		User user = (User) se.getAttribute("User");
		User new_user = readerService.findUserByName(user.getUsername());
		se.setAttribute("User", new_user);
		// 返回首页
		if (method.equals("toindex")) {
			List<Object[]> hotBook = bookService.findHotBook();
			request.setAttribute("hotBook", hotBook);
			request.getRequestDispatcher("WEB-INF/book/book_index.jsp")
					.forward(request, response);
			// 跳转reader个人设置页面
		} else if (method.equals("toReaderEdit")) {
			request.getRequestDispatcher("//WEB-INF/reader/reader_edit.jsp")
					.forward(request, response);
			// 退出登录
		} else if (method.equals("logout")) {
			request.getSession().invalidate();
			response.sendRedirect("/MSlibrary/index.jsp");
		}else if (method.equals("toEditPassword")){
			request.getRequestDispatcher("//WEB-INF/reader/reader_editPassword.jsp")
			.forward(request, response);
		}
		
	}
	
	//更新用户信息
		private void readerEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			User sessionReader = (User) request.getSession().getAttribute("User");
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String tel = request.getParameter("tel");
			User reader = new User();
			HttpSession se = request.getSession();
			User user = (User) se.getAttribute("User");
			User new_user = readerService.findUserByName(user.getUsername());
			se.setAttribute("User", new_user);
			
			reader.setId(sessionReader.getId());
			reader.setUsername(name);
			reader.setSex(sex);
			reader.setTel(tel);
			
			try {
				readerService.updateUser(reader);
				request.setAttribute("message", "更新成功！");
				request.getSession().invalidate();
				request.getSession().setAttribute("User", reader);
				request.getRequestDispatcher("/WEB-INF/reader/reader_editPassword.jsp").forward(request, response);
			} catch (ServiceException e) {
				e.printStackTrace();
				request.setAttribute("message", "更新失败！");
				request.getRequestDispatcher("/WEB-INF/reader/reader_editPassword.jsp").forward(request, response);
			}
			
			
		}

		public void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");

			String method = request.getParameter("method");
			// �޸�����
			if (method.equals("readerPasswordEdit")) {
				User reader = new User();
				User sessionReader = (User) request.getSession().getAttribute(
						"User");

				String oldpassword = request.getParameter("oldPwd");
				String newpassword = request.getParameter("newpwd");

				reader.setId(sessionReader.getId());
				reader.setPassword(newpassword);

				User oldReader = readerService.findUserById(sessionReader
						.getId());
				if (!oldReader.getPassword().equals(oldpassword)) {
					request.setAttribute("message", "密码输入有误！");
					request.getRequestDispatcher(
							"//WEB-INF/reader/reader_editPassword.jsp").forward(
							request, response);
				} else if (oldReader.getPassword().equals(oldpassword)) {
					readerService.updateUserPassword(reader);
					request.setAttribute("errorMsg", "密码修改成功，请牢记您的密码！");
					request.getSession().invalidate();
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
			} else if("readerEdit".equals(method)){
				readerEdit(request,response);
			}
		}
}
