<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!-- saved from url=(0037)http://localhost:8080/dinner/main.jsp -->
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>四川图书馆管理系统</title>
<link href="<%=basePath%>imagine/style.css" rel="stylesheet">

<style type="text/css">
#sub {
	background-color: lightgreen;
}
</style>
<script language="javascript">
	function quit() {
		if (confirm("真的要退出系统吗?")) {
			window.location.href = "logout.jsp";
		}
	}
</script>

</head>
<body onload="clockon(bgclock)">
	<table width="778" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tbody>
			<tr>
				<td height="118" valign="top" background="./imagine/top_bg.gif"
					bgcolor="#EEEEEE">
					<table width="93%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td height="30" align="right">当前登录用户：${User.username }</td>
							</tr>
							<tr>
								<td height="20" align="right">用户余额：${User.balance }</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<table width="778" border="0" align="center" cellpadding="0"
		cellspacing="0" bgcolor="#FFFFFF">
		<tbody>
			<tr bgcolor="#DFA40C">
				<td width="3%" height="27">&nbsp;</td>
				<td width="29%"><div id="bgclock" class="word_white"></div></td>
				<td width="66%" align="right" bgcolor="#B0690B" class="word_white">
					<a href="<%=basePath%>ReaderServlet?method=toindex"
					class="word_white">首页</a> <a
					href="<%=basePath%>ReaderServlet?method=toReaderEdit"
					style="CURSOR: hand" class="word_white">|&nbsp;个人设置</a> <a
					href="<%=basePath%>OrderServlet?path=listBorrow"
					class="word_white" style="CURSOR: hand">|&nbsp;图书借还</a> <a
					href="<%=basePath%>BookServlet?path=select" class="word_white"
					style="CURSOR: hand">|&nbsp;图书查询</a> <a
					href="<%=basePath%>ReaderServlet?method=toEditPassword"
					class="word_white">|&nbsp;更改口令</a> <a href="<%=basePath%>ReaderServlet?method=logout"
					 onclick="quit()" class="word_white">|&nbsp;退出系统</a>
				</td>
				<td width="2%" bgcolor="#B0690B">&nbsp;</td>
			</tr>
			<tr bgcolor="#DFA40C">
				<td height="9" colspan="4"
					background="./imagine/navigation_bg_bottom.gif"></td>
			</tr>
		</tbody>
	</table>


	<table width="778" height="510" border="0" align="center"
		cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
		class="tableBorder_gray">
		<tbody>
			<tr>
				<td align="center" valign="top" style="padding:5px;"><table
						width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td height="20" align="right" valign="middle"
									class="word_orange">当前位置：首页 &gt;&gt;&gt;&nbsp;《${book.bookname }》信息&gt;&gt;&gt;&nbsp;</td>
							</tr>
							<tr>
								<td valign="top">
								<div style="border: 1px solid red;width: 100%;height: 500px;background-color: palegoldenrod;">
									
									<table width="50%" height="100px" align="center" bgcolor="peru">
										
										<tr height="40px">
										<th colspan="2">《${book.bookname }》信息列表</th>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">书名：</td>
										<td style="padding-left: 20px;width: 50%">${book.bookname}</td>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">作者：</td>
										<td style="padding-left: 20px;width: 50%">${book.author}</td>
										</tr >
										
										<tr height="20px">
										<td style="text-align: right;">分类：</td>
										<td style="padding-left: 20px;width: 50%">${cate }</td>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">库存：</td>
										<td style="padding-left: 20px;width: 50%">${book.restcount }&nbsp;本（册）</td>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">借阅次数：</td>
										<td style="padding-left: 20px;width: 50%">${book.borrowcount }&nbsp;次</td>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">一天计价：</td>
										<td style="padding-left: 20px;width: 50%">${book.borrowprice }&nbsp;元/天</td>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">丢失赔偿价格：</td>
										<td style="padding-left: 20px;width: 50%">${book.bookprice }&nbsp;元/天</td>
										</tr>
										<tr height="100px">
										
											<td colspan="2">
												<form method="post" action="<%=basePath%>OrderServlet?path=borrow">
													<input type="hidden" value="${book.id }" name="bookId">
													<div style="text-align: center;">
													<input id = "sub" type="submit" value="借阅《${book.bookname }》" 
													<c:if test="${book.restcount==0}">disabled="disabled" title="库存数量不足无法借阅" style="background-color: silver;"</c:if>
													
													>
													</div>
												</form>
											</td>
										</tr>
										
									</table>
								</div></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>

	<table width="778" height="66" border="0" align="center"
		cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
		<tbody>
			<tr>
				<td height="11" colspan="4"
					background="./imagine/copyright_t.gif"></td>
			</tr>
			<tr>
				<td width="124" height="23">&nbsp;</td>
				<td valign="bottom" align="center">CopyRight &#169; 2017
					www.chinasofti.com <a href="http://www.chinasofti.com/">中软国际</a><a></a>
				</td>
				<td width="141">&nbsp;</td>
			</tr>
			<tr>
				<td height="23">&nbsp;</td>
				<td align="center">本站请使用IE6.0或以上版本 1024*768为最佳显示效果</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td height="8"></td>
				<td height="8"></td>
				<td height="8"></td>
			</tr>
		</tbody>
	</table>



</body>
</html>
