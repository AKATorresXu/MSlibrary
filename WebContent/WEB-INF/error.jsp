<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!-- saved from url=(0037)http://localhost:8080/dinner/main.jsp -->
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>科帮网图书馆管理系统</title>
<link href="./imagine/style.css" rel="stylesheet">
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
									href="#"
									onclick="window.location.reload();" class="word_dark">刷新页面</a></td>
								<td width="9%"><a
									href="#"
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
	<div class="menuskin" id="popmenu"
		onmouseover="clearhidemenu();highlightmenu(event,&#39;on&#39;)"
		onmouseout="highlightmenu(event,&#39;off&#39;);dynamichide(event)"
		style="z-index: 100; position: absolute; left: 758px; top: 144px; visibility: hidden;">
		<table width="80">
			<tbody>
				<tr>
					<td id="library" onmouseover="overbg(library)"
						onmouseout="outbg(library)"><a
						href="#">图书馆信息</a></td>
				</tr>
				<tr>
					<td id="manager" onmouseover="overbg(manager)"
						onmouseout="outbg(manager)"><a
						href="#">管理员设置</a></td>
				</tr>
				<tr>
					<td id="para" onmouseover="overbg(para)" onmouseout="outbg(para)"><a
						href="#">参数设置</a></td>
				</tr>
				<tr>
					<td id="bookcase" onmouseover="overbg(bookcase)"
						onmouseout="outbg(bookcase)"><a
						href="#">书架设置</a></td>
				</tr>
			</tbody>
		</table>
	</div>
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
				      <a href="#" class="word_white">首页</a>
					| <a href="#" style="CURSOR:hand" class="word_white">个人设置</a>
					| <a href="#" class="word_white" style="CURSOR:hand">图书管理</a>
					| <a href="#" class="word_white" style="CURSOR:hand">图书借还</a>
					| <a href="#" class="word_white" style="CURSOR:hand">图书查询</a>
					| <a href="#" class="word_white">更改口令</a> 
					| <a href="#"" onclick="quit()" class="word_white">退出系统</a>
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
									class="word_orange">当前位置：首页 &gt;&gt;&gt;&nbsp;</td>
							</tr>
							<tr>
								<td valign="top"><div style="border: 1px solid red;width: 100%;height: 500px">
								
								
								<!-- 这里写内容 -->
								<p align="center">${message }</p>
								
								
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
