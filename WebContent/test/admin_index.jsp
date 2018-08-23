
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

<title>四川图书馆管理系统</title>
<link href="./imagine/style.css" rel="stylesheet">








</head>
<body onload="clockon(bgclock)">
	<table width="778" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tbody>
			<tr>
				<td height="118" valign="top" style="background-position:center;background-repeat:no-repeat;"
					background="./imagine/top_bg.gif" bgcolor="#EEEEEE"><table
						width="100%" height="33" border="0" cellpadding="0"
						cellspacing="0">
						<tbody>
							<tr>
								<td width="81%" height="10"></td>
								<td colspan="2"></td>
							</tr>
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
										&gt;&gt;&gt;&nbsp;</div>
									<div style="float: right;; display: inline;">${message }</div></td>
							</tr>
							<tr>
								<td valign="top"><table width="100%" border="0"
										cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td height="57"
													background="./imagine/main_booksort.gif">&nbsp;</td>
											</tr>
											<tr>
												<td height="72" valign="top"><table width="100%"
														height="63" border="0" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="2%" rowspan="2">&nbsp;</td>
																<td width="96%" align="center" valign="top">
																<table width="100%" border="1" cellpadding="0"
																		cellspacing="0" bordercolor="#FFFFFF"
																		bordercolordark="#B7B6B6" bordercolorlight="#FFFFFF">
																		<tbody>
																			<tr align="center">
																				<td width="5%" height="25">序号</td>
																				<td width="24%">图书名称</td>
																				<td width="14%">图书作者</td>
																				<td width="10%">图书库存</td>
																				<td width="10%">图书类型</td>
																				<td width="14%">价格(元/本)</td>
																				<td>借阅价格<br>(元/本/天)</td>
																				<td width="11%">借阅次数</td>
																			</tr>
																				<%
																					int i = 0;
																				 %>
																			<c:forEach items="${data}" var="data">
																			<tr align="center">
																				<td height="25" align="center"><%= ++i %></td>
																				<td style="padding:5px;">《${data[0].bookname }》</td>
																				<td style="padding:5px;">${data[0].author }</td>
																				<td style="padding:5px;">${data[0].restcount }</td>
																				<td align="center">${data[1]}</td>
																				<td align="center">${data[0].bookprice }</td>
																				<td width="11%" align="center">${data[0].borrowprice }</td>
																				<td width="8%" align="center">${data[0].borrowcount }</td>
																			</tr>
																			</c:forEach>

																		</tbody>
																	</table></td>
																<td width="2%" rowspan="2">&nbsp;</td>
															</tr>
															<tr>
																<td height="30" align="right" valign="middle"><a
																	href="#"><img
																		src="./imagine/more.GIF" width="50"
																		height="20" border="0">&nbsp;</a></td>
															</tr>
														</tbody>
													</table></td>
											</tr>
										</tbody>
									</table></td>
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
				<td valign="bottom" align="center">CopyRight &#169; 2013
					www.52itstyle.com <a href="http://www.52itstyle.com/">科帮网</a><a></a>
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
