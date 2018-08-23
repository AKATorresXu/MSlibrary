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


			<span style="width: 100px; color: red;">${errorMsg }${message }</span>
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
			<h2>我的借阅记录</h2>
			
		</div>
		<div class="col-lg-3 col-md-3 col-xs-6"
			style="border: 0px solid #ac2925; border-radius: 3px; width: 100%; height: 500px; border-spacing: 0px; overflow: auto;">
			<table width="100%"  style="text-align: center;">
										<thead >
											<tr bgcolor="#3CB371">
												<th>书名</th>
												<th>借书时间</th>
												<th>归还时间</th>
												<th>借出天数</th>
												<th>总价</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody style="background-color: #fff">
										
										<c:forEach items="${datas }" var="data" varStatus="status">
											<tr <c:if test="${status.count%2==0 }">bgcolor="#EED8AE"</c:if>>
												<td>${data[1] }</td>
												<td>${data[0].borrowdate }</td>
												<td>${data[2]}</td>
												<td>${data[3] }</td>
												<td>${data[4] }</td>
												<td>
													<form action="<%=basePath%>/OrderServlet" method="post" style="display:inline;">
														<input type="hidden" value="${data[0].id }" name="borrowId">
														<input type="hidden" value="retuen" name="path">
														<input id="sub" type="submit" class="btn btn-danger btn-lg"   <c:if test="${data[2]!='未归还'}">disabled="disabled" style="background-color: silver"</c:if> value="归还" >
													</form>
													<form action="<%=basePath%>/OrderServlet" method="post" style="display:inline;">
														<input type="hidden" value="${data[0].id }" name="borrowId">
														<input type="hidden" value="pay" name="path">
														<input id="sub" type="submit" class="btn btn-danger btn-lg"   <c:if test="${data[2]!='未归还'}">disabled="disabled" style="background-color: silver"</c:if>  value="丢失" >
													</form>
												</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
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