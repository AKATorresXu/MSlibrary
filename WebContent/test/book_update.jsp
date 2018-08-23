
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>科帮网图书馆管理系统</title>
<link href="./imagine/style.css" rel="stylesheet">
<style type="text/css">
#sub{
	background-color: sandybrown;
	margin: auto;
}
input {
	background-color: palegoldenrod;
}
select
{
background-color: palegoldenrod;
}
</style>
</head>
<body onload="clockon(bgclock)">
	<table width="778" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tbody>
			<tr>
				<td height="118" valign="top"
					background="./imagine/top_bg.gif" bgcolor="#EEEEEE"><table
						width="100%" height="33" border="0" cellpadding="0"
						cellspacing="0">
						<tbody>
							<tr>
								<td width="81%" height="10"></td>
								<td colspan="2"></td>
							</tr>
							<tr>
								<td height="20">&nbsp;</td>
								<td width="10%"><a
									href="http://localhost:8080/dinner/main.jsp#"
									onclick="window.location.reload();" class="word_dark">刷新页面</a></td>
								<td width="9%"><a
									href="http://localhost:8080/dinner/main.jsp#"
									onclick="myclose()" class="word_dark">关闭系统</a></td>
								<script language="javascript">
			function myclose(){
				if(confirm("真的要关闭当前窗口吗?")){
					window.close();
				}
			}
		</script>
							</tr>
						</tbody>
					</table>
					<table width="93%" height="79" border="0" cellpadding="0"
						cellspacing="0">
						<tbody>
							<tr>
								<td height="69" align="right" valign="bottom">当前登录用户：${User.username }</td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>






	<script src="./imagine/onclock.JS.下载"></script>
	<script src="./imagine/menu.JS.下载"></script>
	<table width="778" border="0" align="center" cellpadding="0"
		cellspacing="0" bgcolor="#FFFFFF">
		<tbody>
			<tr bgcolor="#DFA40C">
				<td width="3%" height="27">&nbsp;</td>
				<td width="29%"><div id="bgclock" class="word_white"></div></td>
				<script language="javascript">
			function quit(){
				if(confirm("真的要退出系统吗?")){
					window.location.href="logout.jsp";
				}
			}
		</script>
				<td width="66%" align="right" bgcolor="#B0690B" class="word_white">
				      <a href="<%=basePath%>LoginServlet" class="word_white">首页</a>
					| <a href="<%=basePath%>AdminServlet?path=toReaderManage" style="CURSOR:hand" class="word_white">用户充值</a>
					| <a href="<%=basePath%>BookServlet?path=tomanage" class="word_white" style="CURSOR:hand">图书管理</a>
					| <a href="<%=basePath%>OrderServlet?path=toall" class="word_white" style="CURSOR:hand">订单查询</a>
					| <a href="<%=basePath%>AdminServlet?path=toupdatePwd" class="word_white">更改口令</a> 
					| <a href="<%=basePath%>ReaderServlet?method=logout"  class="word_white">退出系统</a>
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
									<td height="20" valign="middle" class="word_orange"><div
										style="font: left; display: inline;">当前位置：首页
										&gt;&gt;&gt;&nbsp;《${book.bookname }》修改&gt;&gt;&gt;&nbsp;</div>
									<div style="float: right;; display: inline;">${message }</div></td>
							</tr>
							<tr>
								<td valign="top">
								<div style="border: 1px solid red;width: 100%;height: 500px;background-color: palegoldenrod;">
									<form method="post" action="<%=basePath%>BookServlet?path=update">
									<table width="70%" height="100px" align="center" bgcolor="peru">
										
										<tr height="40px">
										<th colspan="2">《${book.bookname }》信息修改</th>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">书名：</td>
										<td style="padding-left: 20px;width: 50%">
											<input type="text" name="bookName" value="${book.bookname}"/>
										</td>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">作者：</td>
										<td style="padding-left: 20px;width: 50%">
										
										<input type="text" name="author" value="${book.author}"/></td>
										</tr >
										
										<tr height="20px">
										<td style="text-align: right;">分类：</td>
										<td style="padding-left: 20px;width: 50%">${cate }
											<select name ="cate"  style="margin-left: 10px;display: inline;">
														
														<c:forEach items="${cates }" var="cate"> 
															<option value="${cate.id }"  <c:if test="${cate.id==book.category_id }">
															selected="selected"
															</c:if> >
															${cate.category }</option>
														</c:forEach>
													</select>
										</td>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">库存：</td>
										<td style="padding-left: 20px;width: 50%">
										<input type="text" name="stock" value="${book.restcount}"/>
										&nbsp;本（册）
										</td>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">借阅次数：</td>
										<td style="padding-left: 20px;width: 50%">
										<input type="text" name="borrowcount" readonly="readonly" value="${book.borrowcount}"/>
										&nbsp;次</td>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">一天计价：</td>
										<td style="padding-left: 20px;width: 50%">
										<input type="text" name="borrowprice" value="${book.borrowprice}"/>
										&nbsp;元/天</td>
										</tr>
										
										<tr height="20px">
										<td style="text-align: right;">丢失赔偿价格：</td>
										<td style="padding-left: 20px;width: 50%">
										<input type="text" name="bookprice" value="${book.bookprice}"/>
										&nbsp;元/本</td>
										</tr>
										<tr height="100px">
										
											<td colspan="2">
												
													<input type="hidden" value="${book.id }" name="bookId">
													<div style="text-align: center;">
													<input id = "sub" type="submit" value="更新《${book.bookname }》"/>
													</div>
											</td>
										</tr>
									</table>
									</form>
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
