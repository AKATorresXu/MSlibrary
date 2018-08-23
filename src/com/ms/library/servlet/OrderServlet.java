package com.ms.library.servlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ms.library.entity.Book;
import com.ms.library.entity.Order;
import com.ms.library.entity.User;
import com.ms.library.exception.DaoExceprion;
import com.ms.library.service.BookService;
import com.ms.library.service.OrderService;
import com.ms.library.service.UserService;
import com.ms.library.service.impl.BookServiceImpl;
import com.ms.library.service.impl.OrderServiceImpl;
import com.ms.library.service.impl.UserServiceImpl;
import com.ms.utils.IdUtil;

//@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService bs = new OrderServiceImpl();
	private UserService us = new UserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getParameter("path");
		HttpSession se = request.getSession();
		User user = (User) se.getAttribute("User");
		User new_user = us.findUserByName(user.getUsername());
		se.setAttribute("User", new_user);
		
//		System.out.println(path);
		switch (path) {
		case "borrow":
			borrowBook(request,response);
			break;
			
		case "listBorrow":
			listBorrow(request,response);
			break;
		case "retuen":
			returnBook(request,response);
			return;
		case "pay" :
			try {
				payBook(request,response);
			} catch (DaoExceprion e) {
				e.printStackTrace();
			}
			break;
		case"toall":
			toAorrowAll(request,response,"all");
			break;
		case"toallexp":
			toAorrowAll(request,response,"exp");
			break;
		case"toallnoexp":
			toAorrowAll(request,response,"noexp");
			break;
		case"toalllose":
			toAorrowAll(request,response,"lose");
			break;
		default:
			break;
		}
		
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param type 查询类型
	 * @throws ServletException
	 * @throws IOException
	 */
	private void toAorrowAll(HttpServletRequest request, HttpServletResponse response,String type) throws ServletException, IOException {
		
		UserService rs = new UserServiceImpl();
		BookService books = new BookServiceImpl();
		List<Object[]> data = new ArrayList<>();
		List<Order> list = null;
		
		switch (type) {
		case "all":
			list = bs.findOrderAll();
			break;
		case "exp":
			list = bs.findOrderAllExp();
			break;
		case "noexp":
			list = bs.findOrderAllNoExp();
			break;
		case "lose":
			list = bs.findOrderAllLose();
			break;	
		default:
			break;
		}
		
		
		
		
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		for (Order bo : list) {
			
			Object[] obj =  new Object[6];
			Book book = books.findBookById(bo.getBook_id());
			User re = rs.findUserById(bo.getUser_id());
			DecimalFormat    df   = new DecimalFormat("######0.00");//小数格式化   
			
			obj[0] = bo;
			obj[1] = book.getBookname();
			int overDay = 0;	
			if(bo.getExpiredate()==null)
			{
				obj[2] = "未归还";
				long time = new Date().getTime() - bo.getBorrowdate().getTime();
				
				overDay = (int) (time/1000/60/60/24)+1;
				
				obj[3] = overDay;
				obj[4] = df.format(book.getBorrowprice()*overDay);
			}
			else
			{
				if("9999-12-31".equals(sdf.format(bo.getExpiredate())))
				{
					obj[2] = "书籍丢失";
					obj[3] = "丢失双倍赔偿";
					
				}
				else
				{
					obj[2] = bo.getExpiredate();
					long time = bo.getExpiredate().getTime() - bo.getBorrowdate().getTime();
					overDay = (int) (time/1000/60/60/24)+1;
					obj[3] = overDay;
				}
				obj[4] = df.format(bo.getPrice());
			}
			obj[5] = re.getUsername();
			data.add(obj);
		}
		
		request.setAttribute("datas", data);
		request.getRequestDispatcher("/WEB-INF/borrow/borrow_list_all.jsp").forward(request, response);
		
		
		
		
		
		
	}
	//锟介籍锟斤拷失
	private void payBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, DaoExceprion  {
		String borrowId = request.getParameter("borrowId");
		Order bo = bs.findOrderById(borrowId);
		if(bo.getExpiredate()!=null)
		{
			request.setAttribute("message", "归还失败！订单已经结算！");
			listBorrow(request,response);
			return;
		}
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse("9999-12-31");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		bo.setExpiredate(date);
		BookService books = new BookServiceImpl();
		Book book = books.findBookById(bo.getBook_id());
		bo.setPrice(book.getBookprice()*2);
		
		if(bo!=null&&book!=null)
		{
			bo.setExpiredate(date);
			bo.setPrice(book.getBookprice()*2);
			boolean b = bs.payBook(bo);
			
			if(b)
			{
				request.setAttribute("message", "归还扣款成功！");
			}
			else
			{
				request.setAttribute("message", "归还扣款失败！请查看余额");
			}
			
		}
		else
		{
			request.setAttribute("message", "未知错误！请联系管理员");
			
		}
		
		listBorrow(request,response);
		
		
		
	}
	//锟斤拷锟斤拷
	private void returnBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String borrowId = request.getParameter("borrowId");
		Order bo = bs.findOrderById(borrowId);
		if(bo.getExpiredate()!=null)
		{
			request.setAttribute("message", "归还失败！订单已经结算！");
			listBorrow(request,response);
			return;
		}
		
		BookService books = new BookServiceImpl();
		Book book = books.findBookById(bo.getBook_id());
		
		
		
		if(bo!=null&&book!=null)
		{
			bo.setExpiredate(new Date());
			long time = new Date().getTime() - bo.getBorrowdate().getTime();
			double overPrice =  ((time/1000/60/60/24)+1)*book.getBorrowprice();
			bo.setPrice(overPrice);
			boolean b = bs.returnBook(bo);
			
			if(b)
			{
				request.setAttribute("message", "归还扣款成功！");
			}
			else
			{
				request.setAttribute("message", "归还扣款失败！请查看余额");
			}
			
		}
		else
		{
			request.setAttribute("message", "未知错误！请联系管理员");
			
		}
		
		listBorrow(request,response);
	}
	//锟斤拷询锟斤拷锟斤拷锟叫憋拷
	protected void listBorrow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User re = (User) request.getSession().getAttribute("User"); 
		
		if(re==null)
		{
			request.setAttribute("errorMsg", "链接超时！请重新登录");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		
		
		List<Order> list = bs.findOrderByUserId(re.getId());
		List<Object[]> data = new ArrayList<>();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		DecimalFormat    df   = new DecimalFormat("######0.00");//小锟斤拷锟斤拷式锟斤拷   
		
		
		BookService bs = new BookServiceImpl();
		for (Order bo : list) {
			
			Object[] obj =  new Object[5];
			Book book = bs.findBookById(bo.getBook_id());
			
			obj[0] = bo;
			obj[1] = book.getBookname();
			int overDay = 0;	
			if(bo.getExpiredate()==null)
			{
				obj[2] = "未归还";
				long time = new Date().getTime() - bo.getBorrowdate().getTime();
				
				overDay = (int) (time/1000/60/60/24)+1;
				
				obj[3] = overDay;
				obj[4] = df.format(book.getBorrowprice()*overDay);
			}
			else
			{
				if("9999-12-31".equals(sdf.format(bo.getExpiredate())))
				{
					obj[2] = "书籍丢失";
					obj[3] = "丢失双倍赔偿";
					
				}
				else
				{
					obj[2] = bo.getExpiredate();
					long time = bo.getExpiredate().getTime() - bo.getBorrowdate().getTime();
					overDay = (int) (time/1000/60/60/24)+1;
					obj[3] = overDay;
				}
				obj[4] = df.format(bo.getPrice());
			}
			data.add(obj);
		}
		
		request.setAttribute("datas", data);
		HttpSession se = request.getSession();
		User user = (User) se.getAttribute("User");
		User new_user = us.findUserByName(user.getUsername());
		se.setAttribute("User", new_user);
		request.getRequestDispatcher("/WEB-INF/borrow/borrow_list.jsp").forward(request, response);
		
	
	}
	
	//锟斤拷锟斤拷
	private void borrowBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User re = (User) request.getSession().getAttribute("User"); 
		String bookId = request.getParameter("bookId");
		
		if(re==null)
		{
			request.setAttribute("errorMsg", "链接超时！请重新登录");
			request.getRequestDispatcher("/.jsp").forward(request, response);
			return;
		}
		Order borrow = new Order(IdUtil.getUUID(), bookId, re.getId(), new Date(), null, 0.0) ;
		boolean b = bs.borrowBook(borrow);
		List<Order> list = bs.findOrderByUserId(re.getId());
		List<Object[]> data = new ArrayList<>();
		BookService bs = new BookServiceImpl();
		DecimalFormat    df   = new DecimalFormat("######0.00");//小锟斤拷锟斤拷式锟斤拷   
		
		for (Order bo : list) {
			
			Object[] obj =  new Object[5];
			Book book = bs.findBookById(bo.getBook_id());
			
			obj[0] = bo;
			obj[1] = book.getBookname();
			int overDay = 0;	
			if(bo.getExpiredate()==null)
			{
				obj[2] = "未归还";
				long time = new Date().getTime() - bo.getBorrowdate().getTime();
				
				overDay = (int) (time/1000/60/60/24)+1;
				
				obj[3] = overDay;
			}else
			{
				obj[2] = bo.getExpiredate();
			}
			
			obj[4] = df.format(overDay*book.getBorrowprice());
			
			
			
			data.add(obj);
		}
		if(b)
		{
			request.setAttribute("message", "借书成功！");
			request.setAttribute("datas", data);
			request.getRequestDispatcher("/WEB-INF/borrow/borrow_list.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("message", "无法执行操作！");
			request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
		}
	}

}
