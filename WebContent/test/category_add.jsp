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
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>
<script language="javascript">
	function quit() {
		if (confirm("真的要退出系统吗?")) {
			window.location.href = "logout.jsp";
		}
	}
</script>
<script type="text/javascript">
function add() {
		var bool = true;
		if ($("#categoryName").val()=="") {
			alert("分类名称不能为空");
			bool = false;
		}
		if (bool) {
			$("form").submit();
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
								<td height="69" align="right">当前登录用户：${User.username }</td>
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
								<td height="20"  valign="middle"
									class="word_orange"><div style="font: left;display:inline;">当前位置：首页 &gt;&gt;&gt;&nbsp;添加书籍分类 &gt;&gt;&gt;&nbsp;</div><div style="float: right;;display:inline;" >${message }</div></td>
							</tr>
							<tr>
								<td valign="top">
								<div style="border: 1px solid red;width: 100%;height: 500px;background-color: palegoldenrod;">
									<form action="<%=basePath%>CategoryServlet" method="POST">
										<table  width="50%" style="margin: auto;margin-top: 40px" bgcolor="peru">
											<tr>
												<td colspan="3" style="color: red; text-align: center; padding-top: 8px; padding-bottom: 8px">
												<input type="hidden" name="path" value="addCategory"/>
													<span style="font-size: medium;"><b>添加书籍分类</b></span>
												</td>
												
											</tr>
											<tr >
												<td style="text-align: right;" width="20%">类名:</td>
												<td width="50%"> <input type="text" required  name="categoryName" style="margin-left: 10px;background-color:palegoldenrod; " id="categoryName"/></td>
												<td width="30%"><span style="color: red;" >*输入分类名称</span></td>
											</tr>
											
											<tr height="50px">
												<td style="text-align: right;" width="20%"></td>
												<td width="50%"> 
												<div style="text-align: center;">
			                                        <input type="button" value="添加" style="background-color: burlywood" onclick="add()"/>
			                                        <input type="reset" style="background-color: burlywood" value="重置"/>
												</div>				
												</td>
												<td width="30%"><span style="color: red;" ></span></td>
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
