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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

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
								<td height="20"  valign="middle"
									class="word_orange"><div style="font: left;display:inline;">当前位置：首页 &gt;&gt;&gt;&nbsp;我的借书信息&gt;&gt;&gt;&nbsp;</div><div style="float: right;;display:inline;" >${message }</div></td>
							</tr>
							<tr>
								<td valign="top">
								
								
								
								<div style="border: 1px solid red;width: 100%;height: 500px;border-spacing: 0px;overflow:auto;" >
									<table width="100%"  style="text-align: center;">
										<thead >
											<tr bgcolor="burlywood">
												<th>书名</th>
												<th>借书时间</th>
												<th>归还时间</th>
												<th>借出天数</th>
												<th>总价</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody style="background-color: khaki">
										
										<c:forEach items="${datas }" var="data" varStatus="status">
											<tr <c:if test="${status.count%2==0 }">bgcolor="gainsboro"</c:if>>
												<td>${data[1] }</td>
												<td>${data[0].borrowdate }</td>
												<td>${data[2]}</td>
												<td>${data[3] }</td>
												<td>${data[4] }</td>
												<td>
													<form action="<%=basePath%>/OrderServlet" method="post" style="display:inline;">
														<input type="hidden" value="${data[0].id }" name="borrowId">
														<input type="hidden" value="retuen" name="path">
														<input id="sub" type="submit"  <c:if test="${data[2]!='未归还'}">disabled="disabled" style="background-color: silver"</c:if> value="归还" >
													</form>
													<form action="<%=basePath%>/OrderServlet" method="post" style="display:inline;">
														<input type="hidden" value="${data[0].id }" name="borrowId">
														<input type="hidden" value="pay" name="path">
														<input id="sub" type="submit"  <c:if test="${data[2]!='未归还'}">disabled="disabled" style="background-color: silver"</c:if>  value="丢失" >
													</form>
												</td>
											</tr>
										</c:forEach>
										</tbody>
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
