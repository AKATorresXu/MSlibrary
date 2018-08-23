<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!-- saved from url=(0037)http://localhost:8080/dinner/main.jsp -->
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>四川图书馆管理系统</title>
<link href="./imagine/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value='/jquery/jquery.datepick.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>
</head>
<body onload="clockon(bgclock)">
	<table width="778" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tbody>
			<tr>
				<td height="118" valign="top" background="./imagine/top_bg.gif"
					bgcolor="#EEEEEE"><table width="100%" height="33" border="0"
						cellpadding="0" cellspacing="0">
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
								<script language="javascript" type="text/javascript">
			function myclose(){
				if(confirm("真的要关闭当前窗口吗?")){
					window.close();
				}
			}
			
			function register() {
			var pwd1=$("#pwd1").val();
			var pwd2=$("#pwd2").val();
		$(".error").text("");
		var bool = true;
		if(!$(":text[name=name]").val()) {
			$("#nameError").text("用户名不能为空");
			bool = false;
		}
		if(pwd1==""){
			$("#pwdError1").text("密码不能为空");
			bool = false;
		}
		if(pwd1 != pwd2){
			$("#pwdError2").text("两次密码不一致");
			bool = false;
		}
		if(!$("#man").attr("checked") && !$("#woman").attr("checked")) {
			$("#sexError").text("性别不能为空");
			bool = false;
		}
		if(!$(":text[name=tel]").val()) {
			$("#telError").text("手机不能为空");
			bool = false;
		}
		if(bool) {
			$("form").submit();
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
					<!--  <a href="http://localhost:8081/MSlibrary/index.jsp"
					class="word_white">首页</a> | <a
					href="http://localhost:8081/library/index.jsp" style="CURSOR:hand"
					class="word_white">个人设置</a> | <a
					href="http://localhost:8081/library/index.jsp" class="word_white"
					style="CURSOR:hand">图书管理</a> | <a
					href="http://localhost:8081/library/index.jsp" class="word_white"
					style="CURSOR:hand">图书借还</a> | <a
					href="http://localhost:8081/library/index.jsp" class="word_white"
					style="CURSOR:hand">图书查询</a> | <a
					href="http://localhost:8081/library/index.jsp" class="word_white">更改口令</a>-->
					| <a href="http://localhost:8081/MSlibrary/login.jsp"
					" onclick="quit()" class="word_white">退出系统</a>
				</td>
				<td width="2%" bgcolor="#B0690B">&nbsp;</td>
			</tr>
			<tr bgcolor="#DFA40C">
				<td height="9" colspan="4"
					background="./imagine/navigation_bg_bottom.gif"></td>
			</tr>
		</tbody>
	</table>


	<table width="778" height="510" border="1" align="center"
		cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
		class="tableBorder_gray">
		<tbody>
			<tr>
				<td align="center" valign="top" style="padding:5px;"><table
						width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td height="20" align="right" valign="middle"
									class="word_orange">当前位置：注册 &gt;&gt;&gt;&nbsp;</td>
							</tr>
							<tr>
								<td valign="top"><div
										style="border: 1px solid red;width: 100%;height: 500px">

										<div
											style="border: 1px solid red;width: 100%;height: 500px;background-color: palegoldenrod;">
											<form action="<c:url value='/RegisterServlet'/>" method="post">
												<!-- 向servlet传递一个名为method的参数，其值表示要调用servlet的哪一个方法 -->
												<!--<input type="hidden" name="method" value="add" />-->
												<table width="50%" height="100px" align="center"
													bgcolor="peru">

													<tr height="40px">
														<th colspan="4">用户注册</th>
													</tr>

													<tr height="20px">
														<td style="text-align: right;width:30%;">用户名：</td>
														<td style="padding-left: 20px;width: 30%;" colspan="2"><input
															type="text" name="name"/></td>
														<td align="left" style="width: 30px;"><label id="nameError" class="error">&nbsp;</label>
														</td>
													</tr>

													<tr height="20px">
														<td style="text-align: right;">密码：</td>
														<td style="padding-left: 20px;width: 50%" colspan="2"><input
															type="password" name="password1" id="pwd1" /></td>
														<td align="left"><label id="pwdError1" class="error">&nbsp;</label>
														</td>
													</tr>
													<tr height="20px">
														<td style="text-align: right;">确认密码：</td>
														<td style="padding-left: 20px;width: 50%" colspan="2"><input
															type="password" name="password1" id="pwd2" /></td>
														<td align="left"><label id="pwdError2" class="error">&nbsp;</label>
														</td>
													</tr>

													<tr height="20px">
														<td style="text-align: right;">性别：</td>
														<td style="padding-left: 20px;width: 50%" colspan="2"><input
															type="radio" name="sex" value="男" id="man" /> <label
															for="male">男</label> <input type="radio" name="sex"
															value="女" id="woman" /> <label for="woman">女</label></td>
														<td align="left"><label id="sexError" class="error">&nbsp;</label>
														</td>
													</tr>

													<tr height="20px">
														<td style="text-align: right;">手机号码：</td>
														<td style="padding-left: 20px;width: 50%" colspan="2"><input
															type="text" name="tel" /></td>
														<td align="left"><label id="telError" class="error">&nbsp;</label>
														</td>
													</tr>

											

													<tr height="100px" >
														<td colspan="2">
															<div style="text-align: right;">
																<input type="button" value="注册" onclick="register()"
																	style="margin: auto;background-color: sandybrown;">
															</div>
														</td>
														<td colspan="2">
															<div style="text-align: left;">
																<input type="reset" value="重置"
																	style="margin: auto;background-color: sandybrown;">
															</div>
														</td>
													</tr>

												</table>
											</form>
											<span>${message }</span>
										</div>



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
				<td height="11" colspan="4" background="./imagine/copyright_t.gif"></td>
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
