<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>四川图书馆-管理系统</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--// Meta tag Keywords -->
<!-- css files -->
<link href="css1/bootstrap.css" rel="stylesheet" type="text/css" media="all" /> <!-- Bootstrap-Core-CSS -->
<link href="css1/style.css" rel="stylesheet" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css1/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
<link rel="stylesheet" href="css1/flexslider.css" type="text/css" media="screen" property="" /> <!-- Flexslider-CSS -->
<link rel="stylesheet" href="css1/team.css" type="text/css" media="screen" property="" /> <!-- Team-CSS -->
<link rel="stylesheet" href="css1/smoothbox.css" type='text/css' media="all" /> <!-- Smoothbox-CSS -->
<link href="css1/wickedpicker.css" rel="stylesheet" type='text/css' media="all" /> <!-- Time-script-CSS -->
<!-- //css files -->
<!-- online-fonts -->
<link href="http://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Oleo+Script:400,700&amp;subset=latin-ext" rel="stylesheet">
<!-- //online-fonts -->
<script language="javascript">
function check(form){
	var p1 = form.pwd1;
    var p2 = form.pwd2;
    if (p1.value != p2.value) {
        p2.oninvalid();
        return false;
    }
    $("form").submit();
    return true;
}
onload = function() {
    var p2 = document.forms["form2"].pwd2;
    p2.oninvalid = function() {
        this.setCustomValidity("密码不一致，请重新输入");
    }
    p2.oninput = function() {
        this.setCustomValidity("");
    }

}
</script>
<script language="javascript" type="text/javascript">
			function myclose(){
				if(confirm("真的要关闭当前窗口吗?")){
					window.close();
				}
			}
			
			
	
</script>
</head>
<body>
<!-- banner -->
<div data-vide-bg="video/food">
	<div class="center-container">
		<div class="banner wthree">
			<div class="container">
				<div class="banner_top">
					<div class="col-md-6 col-sm-4 col-xs-4 logo">
						<h1><a href="index.jsp"><img src="video/login.gif"/><span></span></a></h1>
					</div>
					<div class="col-md-6 col-sm-8 col-xs-8 w3_menu">
					
						<div class="col-md-6 col-sm-5 col-xs-5 top-nav-text">
							<a class="page-scroll" href="#myModal2" data-toggle="modal" data-hover="LOGIN" style="color:#008B00;font-size:20px">登录</a>
						</div>
						<div class="col-md-3 col-sm-4 col-xs-4 top-nav-text">
							<a class="page-scroll" href="#myModal3" data-toggle="modal" data-hover="LOGIN"style="color:#008B00;font-size:20px">注册</a>
						</div>
						
						<div class="mobile-nav-button">
							<div class="mobile-nav-button__line"></div>
							<div class="mobile-nav-button__line"></div>
							<div class="mobile-nav-button__line"></div>
						</div>
						<nav class="mobile-menu">
							<ul>
								<li class="active"><a href="index.jsp">回到主页</a></li>
								
							</ul>
						</nav>
					</div>
					<div class="clearfix"> </div>
				</div>
				<!--Slider-->	
				
				 
			</div>
		</div>
		<!-- modal -->
		<div class="modal about-modal w3-agileits fade" id="myModal2" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					</div> 
					<div class="modal-body login-page "><!-- login-page -->     
						<div class="login-top sign-top">
							<div class="agileits-login">
							<h5>请登录</h5>
							<form name="form1" action="<c:url value='/LoginServlet'/>" method="post">
								<input type="text" class="email" name="name" placeholder="用户名/手机/邮箱：" id ="name" required oninvalid="setCustomValidity('请输入账号')" oninput="setCustomValidity('')"/>
								<input type="password" class="password" name="pwd" placeholder="密码：" required oninvalid="setCustomValidity('请输入密码')" oninput="setCustomValidity('')"/>
								<div class="wthree-text"> 
									<ul> 
										<li>
											<label class="anim">
												<input type="checkbox" class="checkbox">
												<span> 记住密码 </span> 
											</label> 
										</li>
									</ul>
									<div class="clearfix"> </div>
								</div>  
								<div class="w3ls-submit"> 
									<input name="Submit" type="submit" value="登     录" onClick="return check(form1)">  	
								</div>	
							</form>

							</div>  
						</div>
					</div>  
				</div> <!-- //login-page -->
			</div>
		</div>
		<!-- //modal --> 
		<!-- modal -->
		<div class="modal about-modal w3-agileits fade" id="myModal3" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					</div> 
					<div class="modal-body login-page "><!-- login-page -->     
						<div class="login-top sign-top">
							<div class="agileits-login">
							<h5>欢迎注册四川图书馆</h5>
							<form name="form2" action="<c:url value='/RegisterServlet'/>" method="post" onsubmit="return check(this);">
								<input type="text" name="name" placeholder="用户名：" required oninvalid="setCustomValidity('请填写用户名')" oninput="setCustomValidity('')"/><label align="left" id="nameError" class="error">&nbsp;</label>
								<input type="password" name="password1" id="pwd1" placeholder="密码：" required oninvalid="setCustomValidity('请填写密码')" oninput="setCustomValidity('')" /><label align="left" id="pwdError1" class="error">&nbsp;</label>
								<input type="password" name="password1" id="pwd2"  placeholder="确认密码：" ><label align="left" id="pwdError2" class="error">&nbsp;</label>
								<input type="text" name="tel" placeholder="电话" required oninvalid="setCustomValidity('请填写电话号码')" oninput="setCustomValidity('')"/><label  align="left" id="telError" class="error">&nbsp;</label>
								<div class="wthree-text"> 
									<ul> 
										<li>
											<label class="anim">
												<input type="checkbox" class="checkbox">
												<span> 我同意使用协议</span> 
											</label> 
										</li>
									</ul>
									<div class="clearfix"> </div>
								</div>  
								<div class="w3ls-submit"> 
									<input type="submit" value="注      册">  	
								</div>	
							</form>
							
							</div>  
						</div>
					</div>  
				</div> <!-- //login-page -->
			</div>
		</div>
		<div style="width:1600px;border:0px red solid;text-align:center;">
        <span style="width:100px;color:red;">${errorMsg }${message }</span>
    </div>
	
		<!-- //modal --> 
	</div>
	
	</div>
<!-- //banner -->
<!-- grids -->
<div class="about-agile">
	<h4 class="ms"style="background-color:#eb422a;color:#fff">
	<marquee scrollamount="15">欢迎登录四川图书馆管理系统，我们将为您提供在线借阅图书服务</marquee>
	</h4>
	<div class="col-md-6 about-grids-w3l" >
		<div class="about-first-w3">
			<div class="col-md-4 col-sm-4 col-xs-4 welcome-img">
				<img src="Images/1.jpg" class="img-responsive zoom-img" alt=""/>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-4 welcome-img">
				<img src="Images/2.jpg" class="img-responsive zoom-img" alt=""/>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-4 welcome-img">
				<img src="Images/3.jpg" class="img-responsive zoom-img" alt=""/>
			</div>
			<div class="clearfix"> </div>
		</div>
		<div class="about-first-w3">
			<div class="col-md-4 col-sm-4 col-xs-4 welcome-img">
				<img src="Images/4.jpg" class="img-responsive zoom-img" alt=""/>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-4 welcome-img">
				<img src="Images/5.jpg" class="img-responsive zoom-img" alt=""/>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-4 welcome-img">
				<img src="Images/6.jpg" class="img-responsive zoom-img" alt=""/>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<div style="height:38px">
	<iframe id="fancybox-frame" name="fancybox-frame1502155789724" frameborder="0" scrolling="no" hspace="0"  src="http://i.tianqi.com/index.php?c=code&a=getcode&id=38&h=60&w=610"></iframe>
	</div>
	<div class="col-md-6 w3layouts_event_right">
		<h3>书香四川</h3>
		<div class="slider">
			<div class="flexslider">
				<ul class="slides">
					<li>
						<div class="w3_event_right_grid">
							<div class="w3layouts_event_right_para">
								<p>四川省图书馆始建于1912年10月，是我国成立较早的公共图书馆之一，也是我国西南地区成立最早的公共图书馆，拥有藏书500万册/件，其中包括珍贵的古籍善本77.6万册、民国文献22万册，数字资源达123TB。</p>
							</div>
						</div>
					</li>
					<li>
						<div class="w3_event_right_grid">
							<div class="w3layouts_event_right_para">
								<p> 四川省图书馆新馆位于天府广场西侧(人民西路4号)，占地总面积17亩，总建筑面积5.2万平方米，饱和藏书量可达到750余万册/件，新设读书广场、学术报告厅、展览厅、多媒体厅、活动室、读者沙龙等综合文化服务区域。全馆总座位数为3267个、信息节点为3488个，可同时接待读者6000余人。</p>
							</div>
						</div>
					</li>
					<li>
						<div class="w3_event_right_grid">
							<div class="w3layouts_event_right_para">
								<p> 四川省图书馆新馆将秉承“以人为本、读者至上、服务一流”的宗旨，与读者共享知识，共建书香四川。</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="clearfix" > </div>
</div>


<div class="delicious_food" id="gallery">
	<div class="container">
		<h3 class="w3l-title" style="background-color:#eb422a;color:#fff;">热门书籍详情</h3>
		<div class="agile_delicious_food_grids">
			<div class="agile_delicious_food_grid">
				<a class="sb" href="Images/g9.jpg" title="在本书中，列维特和史蒂芬·都伯纳取材日常生活，以经济学的方式来探索日常事物背后的世界：念书给婴儿听会不会使他日后成为一个好学生？游泳池比枪支还危险？贩毒集团的...">
					<div class="view view-sixth">
						<img src="Images/g9.jpg" alt=" " class="img-responsive" />
						<div class="mask">
							<h4>魔鬼经济学</h4>
							<p>在本书中，列维特和史蒂芬·都伯纳取材日常生活，以经济学的方式来探索日常事物背后的世界：念书给婴儿听会不会使他日后成为一个好学生？游泳池比枪支还危险？贩毒集团的...</p>
						</div>
					</div>
				</a>
			</div>
			<div class="agile_delicious_food_grid">
				<a class="sb" href="Images/g2.jpg" title="由卡耐基开创并倡导的个人成功学，已经成为这个时代有志青年迈向成功的阶梯，通过他的传播和教导，使无数人明白了积极的意义，并由此改变了他们的命运。卡耐基留给我们的不仅仅是几本书和一所学校，其真正价值是：他把个人成功的技巧传授给了每一个想出人头地的年轻人。">
					<div class="view view-sixth">
						<img src="Images/g2.jpg" alt=" " class="img-responsive" />
						<div class="mask">
							<h4>如何提高你的洞察力</h4>
							<p>由卡耐基开创并倡导的个人成功学，已经成为这个时代有志青年迈向成功的阶梯，通过他的传播和教导，使无数人明白了积极的意义，并由此改变了他们的命运。卡耐基留给我们的不仅仅是几本书和一所学校，其真正价值是：他把个人成功的技巧传授给了每一个想出人头地的年轻人。</p>
						</div>
					</div>
				</a>
			</div>
			<div class="agile_delicious_food_grid">
				<a class="sb" href="Images/g3.jpg" title="我们其实都期望世界上有另一个自己，在过着不同于自己的生活，做着自己不敢做的事，过着自己想要过的生活，成为自己想要成为的人，通过两个人不同的生活境遇，却遇到了彼此，建立了一段友谊，我们或许可以实现我们心中两颗心的和解与共生。">
					<div class="view view-sixth">
						<img src="Images/g3.jpg" alt=" " class="img-responsive" />
						<div class="mask">
							<h4>世界上的另一个你</h4>
							<p>我们其实都期望世界上有另一个自己，在过着不同于自己的生活，做着自己不敢做的事，过着自己想要过的生活，成为自己想要成为的人，通过两个人不同的生活境遇，却遇到了彼此，建立了一段友谊，我们或许可以实现我们心中两颗心的和解与共生。</p>
						</div>
					</div>
				</a>
			</div>
			
			
			<div class="clearfix"> </div>
			
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
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
	<!-- //js -->
	<!-- responsiveslider -->
	<script src="js/responsiveslides.min.js"></script>
		<script>
			// You can also use "$(window).load(function() {"
			$(function () {
			  // Slideshow 4
			  $("#slider3").responsiveSlides({
				auto: true,
				pager:true,
				nav:false,
				speed: 500,
				namespace: "callbacks",
				before: function () {
				  $('.events').append("<li>before event fired.</li>");
				},
				after: function () {
				  $('.events').append("<li>after event fired.</li>");
				}
			  });
		
			});
		 </script>
	<!-- //responsiveslider -->
	<!-- menu -->
	<script>
		$(document).ready(function () {
		  $('.mobile-nav-button').on('click', function() {
		  $( ".mobile-nav-button .mobile-nav-button__line:nth-of-type(1)" ).toggleClass( "mobile-nav-button__line--1");
		  $( ".mobile-nav-button .mobile-nav-button__line:nth-of-type(2)" ).toggleClass( "mobile-nav-button__line--2");  
		  $( ".mobile-nav-button .mobile-nav-button__line:nth-of-type(3)" ).toggleClass( "mobile-nav-button__line--3");  
		  
		  $('.mobile-menu').toggleClass('mobile-menu--open');
		  return false;
		}); 
		});
	</script>
	<!-- //menu -->
	<!-- flexSlider-for-grids-section -->
		<script defer src="js/jquery.flexslider.js"></script>
		<script type="text/javascript">
			$(window).load(function(){
			  $('.flexslider').flexslider({
				animation: "slide",
				start: function(slider){
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
				visibleItems: 4,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
				responsiveBreakpoints: { 
					portrait: { 
						changePoint:480,
						visibleItems: 2
					}, 
					landscape: { 
						changePoint:640,
						visibleItems:3
					},
					tablet: { 
						changePoint:768,
						visibleItems: 4
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
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
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
		$().UItoTop({ easingType: 'easeOutQuart' });
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- //for-bottom-to-top smooth scrolling -->
	<!-- Calendar -->
	<link rel="stylesheet" href="css1/jquery-ui.css" />
	<script src="js/jquery-ui.js"></script>
		<script>
			$(function() {
			$( "#datepicker,#datepicker1,#datepicker2,#datepicker3" ).datepicker();
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
			$('.timepicker').wickedpicker({twentyFour: false});
		</script>
	<!-- //Time -->

<!-- //js-scripts -->
</body>
</html>