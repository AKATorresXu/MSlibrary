<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>四川图书馆-管理系统</title>
<!-- Meta tag Keywords -->
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	
	
	
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } 










</script>
<script type="text/javascript">
	function add() {
		var bool = true;
		if ($("#categoryName").val() == "") {
			alert("分类名称不能为空");
			bool = false;
		}
		if (bool) {
			$("#form1").submit();
		}
	}
</script>
<!--// Meta tag Keywords -->
<!-- css files -->
<link href="css1/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Bootstrap-Core-CSS -->
<link href="css1/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Style-CSS -->
<link rel="stylesheet" href="css1/font-awesome.css">
<!-- Font-Awesome-Icons-CSS -->
<link rel="stylesheet" href="css1/flexslider.css" type="text/css"
	media="screen" property="" />
<!-- Flexslider-CSS -->
<link rel="stylesheet" href="css1/team.css" type="text/css"
	media="screen" property="" />
<!-- Team-CSS -->
<link rel="stylesheet" href="css1/smoothbox.css" type='text/css'
	media="all" />
<!-- Smoothbox-CSS -->
<link href="css1/wickedpicker.css" rel="stylesheet" type='text/css'
	media="all" />
<!-- Time-script-CSS -->
<link href="js2/owl-carousel/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" href="css2/styles.css" />
<link rel="stylesheet" href="css2/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css2/isotope.css"
	media="screen" />
<link rel="stylesheet" href="js2/fancybox/jquery.fancybox.css"
	type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="cs2s/da-slider.css" />
<!-- //css files -->
<!-- online-fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Oleo+Script:400,700&amp;subset=latin-ext"
	rel="stylesheet">
<!-- //online-fonts -->
<script language="javascript" type="text/javascript">
	function myclose() {
		if (confirm("真的要关闭当前窗口吗?")) {
			window.close();
		}
	}
</script>
<script language="javascript" type="text/javascript">
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
			$("#form2").submit();
		}
	}
</script>
<script type="text/javascript">
	function CheckPwd() {

		var pwd = document.getElementById("newpwd").value;
		if (pwd == "") {

			$("#newpwderr").show();
		} else {
			$("#newpwderr").hide();
		}
	}

	function CheckNewPwd() {
		var pwd = document.getElementById("newpwd").value;
		var pwd_ = document.getElementById("newpwd_").value;

		if (pwd != pwd_) {
			$("#newpwderr_").show();

		} else {
			$("#newpwderr_").hide();
		}

	}

	function CheckOldPwd() {
		var pwd = document.getElementById("oldPwd").value;
		if (pwd == "") {
			$("#oldpwderr").show();
		} else {
			$("#oldpwderr").hide();
		}

	}

	function update() {
		var bool = true;
		var pwd1 = document.getElementById("oldPwd").value;
		if (pwd1 == "") {
			$("#oldpwderr").show();
			bool = false;
		} else {
			$("#oldpwderr").hide();
		}

		var pwd2 = document.getElementById("newpwd").value;
		var pwd_ = document.getElementById("newpwd_").value;

		if (pwd2 != pwd_) {
			$("#newpwderr_").show();
			bool = false;
		} else {
			$("#newpwderr_").hide();
		}

		var pwd3 = document.getElementById("newpwd").value;
		if (pwd3 == "") {

			$("#newpwderr").show();
			bool = false;
		} else {
			$("#newpwderr").hide();
		}

		if (bool) {
			$("#form1").submit();
		}
	}
</script>
</head>
<body onload="clockon(bgclock)">
	<!-- banner -->

	<div data-vide-bg="video/food">
		<div class="center-container">
			<div class="banner wthree">
				<div class="container">
					<div class="banner_top">
						<div class="col-md-6 col-sm-4 col-xs-4 logo">
							<h1>
								<a href="index.jsp"><img src="video/login.gif" /><span></span></a>
							</h1>
						</div>
						<div class="col-md-6 col-sm-8 col-xs-8 w3_menu">
							<div
								style="height: 50px; width: 566px; background-color: #000; opacity: 0.46;">
								<div class="col-md-6 col-sm-5 col-xs-5 top-nav-text"
									style="width: 35%;">
									<a class="page-scroll" href="#myModal22" data-toggle="modal"
										data-hover="LOGIN">欢迎：${User.username }</a>
								</div>
								<div class="col-md-3 col-sm-4 col-xs-4 top-nav-text">
									<a class="page-scroll" href="#myModal22" data-toggle="modal"
										data-hover="LOGIN">用户余额：${User.balance }</a>
								</div>
								<div class="col-md-3 col-sm-4 col-xs-4 top-nav-text">
									<a class="page-scroll" href="#myModal3" data-toggle="modal"
										data-hover="LOGIN"> <%
 	java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
 	java.util.Date currentTime = new java.util.Date();
 	String time = simpleDateFormat.format(currentTime).toString();
 	out.println(time);
 %>
									</a>
								</div>
							</div>
							<div class="mobile-nav-button">
								<div class="mobile-nav-button__line"></div>
								<div class="mobile-nav-button__line"></div>
								<div class="mobile-nav-button__line"></div>
							</div>
							<nav class="mobile-menu">
								<ul>
									<li class="active"><a
										href="<%=basePath%>ReaderServlet?method=toindex">首页</a></li>
									
									<li><a href="<%=basePath%>OrderServlet?path=listBorrow"
										class="word_white" style="CURSOR: hand">|&nbsp;图书借还</a></li>
									<li><a href="<%=basePath%>BookServlet?path=select"
										class="word_white" style="CURSOR: hand">|&nbsp;图书查询</a></li>
									<li><a
										href="<%=basePath%>ReaderServlet?method=toEditPassword"
										class="word_white">|&nbsp;个人设置</a></li>
									<li><a href="index.jsp">|&nbsp;退出系统</a></li>
								</ul>
							</nav>
						</div>

						<div class="clearfix"></div>
					</div>
					<!--Slider-->


				</div>

			</div>
			<!-- modal -->



		</div>

		<!-- //modal -->
		<div class="modal about-modal w3-agileits fade" id="category_add"
			tabindex="-1" role="dialog">

			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

				</div>

				<!-- //login-page -->
			</div>
		</div>
	</div>

	<!-- //banner -->
	<!-- grids -->

	<div class="container">
		<div class="heading text-center">
			<!-- Heading -->

		</div>

		<div class="row flat">
			<form action="<c:url value='/ReaderServlet'/>" method="post" id="form1">

				<div class="col-lg-333 col-md-333 col-xs-6" style="width: 50%;">
					<input type="hidden" name="method" value="readerPasswordEdit" />
					<ul class="plan plan1">

						<li class="plan-name">修改密码</li>
						<li class="plan-price"><strong>原始密码:</strong> <input
							type="password" required name="oldPwd"
							class="btn btn-lg" 
							style="background:#fff;border-color: #d43f3a;color:#303030;" onBlur="CheckOldPwd()" id="oldPwd" />
							<label id="oldpwderr" style="display: none; color: red;"><span>*密码不能为空</span></label></li>
						<li class="plan-price"><strong>新 密 码 :</strong> <input
							type="password" required name="newpwd"
							class="btn btn-lg" 
							style="background:#fff;border-color: #d43f3a;color:#303030;"onBlur="CheckPwd()" id="newpwd" />
							<label id="newpwderr" style="display: none; color: red;"><span>*新密码不能为空</span></label></li>
						<li class="plan-price"><strong>重复密码:</strong> <input
							type="password" required name="newpwd_"
							class="btn btn-lg" 
							style="background:#fff;border-color: #d43f3a;color:#303030;" onBlur="CheckNewPwd()"
							id="newpwd_" /> <label id="newpwderr_"
							style="display: none; color: red;"><span>*两次密码不一致</span></label></li>
						<li class="plan-action">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="button" value="修改" onclick="update()"
							class="btn btn-danger btn-lg" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"
							class="btn btn-danger btn-lg" value="重置" /><strong>&nbsp;&nbsp;&nbsp;&nbsp;${message }</strong></li>
					</ul>
				</div>
			</form>
			<form action="<c:url value='/ReaderServlet'/>" method="post"
				id="form2">
				<div class="col-lg-3 col-md-3 col-xs-6" style="width: 50%;">
					<input type="hidden" name="method" value="readerEdit" />
					<ul class="plan plan1">

						<li class="plan-name">个人设置</li>
						<li class="plan-price"><strong>用户名：</strong> <input
							type="text" name="name" value="${User.username}" class="btn btn-lg" 
							style="background:#fff;border-color: #d43f3a;color:#303030;"/> 
							<label id="nameError"
					class="error" style="color: red"></label></li>
						<li class="plan-price"><strong>性别：</strong>
						<c:choose >
						<c:when test="${User.sex == '男'}">
							<td class="btn btn-dangers btn-lg"><input
								type="radio" name="sex" value="男" id="man" checked="checked" />
								<label for="male">男</label> <input type="radio" name="sex"
								value="女" id="woman" /> <label for="woman">女</label></td>
						</c:when>
						<c:otherwise>
							<td class="btn btn-dangers btn-lg"><input
								type="radio" name="sex" value="男" id="man" checked="checked" />
								<label for="male">男</label> <input type="radio" name="sex"
								value="女" id="woman" checked="checked" /> <label for="woman">女</label></td>
						</c:otherwise>
					</c:choose>
						</li>
						<li class="plan-price"><strong>手机号码：</strong> <input
							type="text" name="tel" value="${User.tel }" class="btn btn-lg" 
							style="background:#fff;border-color: #d43f3a;color:#303030;"/> <label id="telError" class="error"
						style="color: red"></label></li>
						<li class="plan-action">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input
							type="button" value="提交" onclick="edit()"
							class="btn btn-danger btn-lg" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"
							class="btn btn-danger btn-lg" value="重置" /><strong>&nbsp;&nbsp;&nbsp;&nbsp;${message }</strong></li>
							<li></li>
					</ul>
					
				</div>
				
				
			</form>
		</div>
	</div>

	</div>


	<!-- //delicious-food -->
	<!-- footer -->
	<div class="footer" id="contact">

	<div class="container">
		<div class="agile-footer-grids">
			<div class="col-md-3 col-sm-6 col-xs-6 w3-agile-footer-grid">
				<div class="logo-2">
					<h2><a href="index.jsp">SiChuan<span>Library</span></a></h2>
				</div>
				<ul>
					<li>四川省成都市青羊区人民西路4号</li>
					<li>邮编：610015</li>

					<li>联系电话：</li>
					<li>+86 028 86655171</li>
				</ul>				
			</div>
			<div class="col-md-3 col-sm-6 col-xs-6 w3-agile-footer-grid">
				<h3>OpenDays</h3>
				<div class="col-md-5 col-sm-5 col-xs-5 agile-opening">
					<ul>
						<li>星期一 </li>
						<li>星期二 </li>
						<li>星期三 </li>
						<li>星期四 </li>
						<li>星期五 </li>
						<li>星期六 </li>
						<li>星期天 </li>
					</ul>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6 agile-opening">
					<ul>
						<li>8am-10pm</li>
						<li>9am-10pm</li>
						<li>7am-11pm</li>
						<li>5am-11pm</li>
						<li>6am-12pm</li>
						<li>7am-12pm</li>
						<li>4am-12pm</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
				
			</div>
			<div class="col-md-6 w3-agile-footer-grid grid-w3-1">
				<div class="contact-block-left">
					<iframe src="map.html" width="600" height="300" frameborder="0" scrolling="no"></iframe>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
			<p style="color:#fff;">
				Copyright &copy; 2017.MuJinLin.XuTing.LiuHeng All rights reserved.
					
			</p>
		</div>
	</div>
	<!-- copyright -->
	
</div>
	<!-- //footer -->

	<!-- js-scripts -->

	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<!-- Necessary-JavaScript-File-For-Bootstrap -->
	<!-- //js -->
	<!-- responsiveslider -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function() {
			// Slideshow 4
			$("#slider3").responsiveSlides({
				auto : true,
				pager : true,
				nav : false,
				speed : 500,
				namespace : "callbacks",
				before : function() {
					$('.events').append("<li>before event fired.</li>");
				},
				after : function() {
					$('.events').append("<li>after event fired.</li>");
				}
			});

		});
	</script>
	<!-- //responsiveslider -->
	<!-- menu -->
	<script>
		$(document)
				.ready(
						function() {
							$('.mobile-nav-button')
									.on(
											'click',
											function() {
												$(
														".mobile-nav-button .mobile-nav-button__line:nth-of-type(1)")
														.toggleClass(
																"mobile-nav-button__line--1");
												$(
														".mobile-nav-button .mobile-nav-button__line:nth-of-type(2)")
														.toggleClass(
																"mobile-nav-button__line--2");
												$(
														".mobile-nav-button .mobile-nav-button__line:nth-of-type(3)")
														.toggleClass(
																"mobile-nav-button__line--3");

												$('.mobile-menu').toggleClass(
														'mobile-menu--open');
												return false;
											});
						});
	</script>
	<!-- //menu -->
	<!-- flexSlider-for-grids-section -->
	<script defer src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				start : function(slider) {
					$('body').removeClass('loading');
				}
			});
		});
	</script>
	<!-- //flexSlider-for-grids-section -->
	<!-- flexSlider-for-menu-section -->
	<script type="text/javascript">
		$(window).load(function() {
			$("#flexiselDemo1").flexisel({
				visibleItems : 4,
				animationSpeed : 1000,
				autoPlay : true,
				autoPlaySpeed : 3000,
				pauseOnHover : true,
				enableResponsiveBreakpoints : true,
				responsiveBreakpoints : {
					portrait : {
						changePoint : 480,
						visibleItems : 2
					},
					landscape : {
						changePoint : 640,
						visibleItems : 3
					},
					tablet : {
						changePoint : 768,
						visibleItems : 4
					}
				}
			});

		});
	</script>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>
	<!-- //flexSlider-for-menu-section -->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->
	<!-- for-bottom-to-top smooth scrolling -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */
			$().UItoTop({
				easingType : 'easeOutQuart'
			});
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- //for-bottom-to-top smooth scrolling -->
	<!-- Calendar -->
	<link rel="stylesheet" href="css1/jquery-ui.css" />
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3")
					.datepicker();
		});
	</script>
	<!-- //Calendar -->
	<!-- video-js -->
	<script src="js/jquery.vide.min.js"></script>
	<!-- //video-js -->
	<!-- smoothbox -->
	<script type="text/javascript" src="js/smoothbox.jquery2.js"></script>
	<!-- //smoothbox -->
	<!-- Time -->
	<script type="text/javascript" src="js/wickedpicker.js"></script>
	<script type="text/javascript">
		$('.timepicker').wickedpicker({
			twentyFour : false
		});
	</script>
	<!-- //Time -->

	<!-- //js-scripts -->
</body>
</html>