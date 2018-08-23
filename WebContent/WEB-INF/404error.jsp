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
<meta http-equiv=refresh content=5;url=<%=basePath %>>
<title>科帮网图书馆管理系统</title>
<link href="<%=basePath%>imagine/style.css" rel="stylesheet">

<style type="text/css">
#sub {
	background-color: lightgreen;
}
</style>
<script language="javascript">
	function quit() {
		if (confirm("真的要退出系统吗?")) {
			window.location.href = "<%=basePath%>ReaderServlet?method=logout";
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
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<table width="778" border="0" align="center" cellpadding="0"
		cellspacing="0" bgcolor="#FFFFFF">
		
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
									class="word_orange">当前位置：错误 &gt;&gt;&gt;&nbsp;</td>
							</tr>
							<tr>
								<td valign="top"><div style="border: 1px solid red;width: 100%;height: 500px;text-align: center;">
								
								<h1>未找到相关资源！请联系管理员处理！</h1>
								<h2 style=color:red><span id=jump>5</span> 秒钟后页面将自动返回登录页面...</h2>  
								<script>  
						             function countDown(secs){  
						                       jump.innerText=secs;  
						                       if(--secs>0)  
						                                setTimeout("countDown("+secs+" )",1000);  
						             }  
						             countDown(5);        
						       </script>  
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
