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
<link href="./imagine/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/jquery/jquery.datepick.css'/>">
<script type="text/javascript"
	src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>
<script language="javascript" type="text/javascript">
	function myclose() {
		if (confirm("真的要关闭当前窗口吗?")) {
			window.close();
		}
	}

	function edit() {
		$(".error").text("");
		var bool = true;
		if (!$(":text[name=name]").val()) {
			$("#nameError").text("用户名不能为空");
			bool = false;
		}
		if (!$("#man").attr("checked") && !$("#woman").attr("checked")) {
			$("#sexError").text("性别不能为空");
			bool = false;
		}
		if (!$(":text[name=tel]").val()) {
			$("#telError").text("手机不能为空");
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


	<table width="778" height="510" border="1" align="center"
		cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
		class="tableBorder_gray">
		<tbody>
			<tr>
				<td align="center" valign="top" style="padding: 5px;"><table
						width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td height="20" valign="middle" class="word_orange"><div
										style="font: left; display: inline;">当前位置：首页
										&gt;&gt;&gt;&nbsp;个人设置&gt;&gt;&gt;&nbsp;</div>
									<div style="float: right;; display: inline;">${message }</div></td>
							</tr>
							<tr>
								<td valign="top"><div
										style="border: 1px solid red; width: 100%; height: 500px">
										<div
											style="border: 1px solid red; width: 100%; height: 500px; background-color: palegoldenrod;">
											<form action="<c:url value='/ReaderServlet'/>" method="post">
												<!-- 向servlet传递一个名为method的参数，其值表示要调用servlet的哪一个方法 -->
												<input type="hidden" name="method" value="readerEdit" />
												<table width="50%" height="100px" align="center"
													bgcolor="#B0690B">

													<tr height="40px">
														<th colspan="4">个人设置</th>
													</tr>

													<tr height="20px">
														<td style="text-align: right; width: 30%;">用户名：</td>
														<td style="padding-left: 20px; width: 30%;" colspan="2"><input
															type="text" name="name" readonly="readonly" value="${User.username}"
															style="background-color: palegoldenrod" /></td>
														<td align="left" style="width: 30px;"><label
															id="nameError" class="error" style="color: black"></label></td>
													</tr>

													<tr height="20px">
														<td style="text-align: right;">性别：</td>
														<c:choose>
															<c:when test="${User.sex == '男'}">
																<td style="padding-left: 20px; width: 50%" colspan="2"><input
																	type="radio" name="sex" value="男" id="man"
																	checked="checked" /> <label for="male">男</label> <input
																	type="radio" name="sex" value="女" id="woman" /> <label
																	for="woman">女</label></td>
															</c:when>
															<c:otherwise>
																<td style="padding-left: 20px; width: 50%" colspan="2"><input
																	type="radio" name="sex" value="男" id="man"
																	checked="checked" /> <label for="male">男</label> <input
																	type="radio" name="sex" value="女" id="woman"
																	checked="checked" /> <label for="woman">女</label></td>
															</c:otherwise>
														</c:choose>
														<td align="left"><label id="sexError" class="error"
															style="color: red"></label></td>
													</tr>

													<tr height="20px">
														<td style="text-align: right;">手机号码：</td>
														<td style="padding-left: 20px; width: 50%" colspan="2"><input
															type="text" name="tel" value="${User.tel }"
															style="background-color: palegoldenrod" /></td>
														<td align="left"><label id="telError" class="error"
															style="color: red"></label></td>
													</tr>


													<tr height="100px">
														<td colspan="2">
															<div style="text-align: right;">
																<input type="button" value="提交" onclick="edit()"
																	style="margin: auto; background-color: sandybrown;">
															</div>
														</td>
														<td colspan="2">
															<div style="text-align: left;">
																<input type="reset" value="重置"
																	style="margin: auto; background-color: sandybrown;">
															</div>
														</td>
													</tr>

												</table>
											</form>
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
