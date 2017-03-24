<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="njxzc.dao.*,njxzc.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">

<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bridal Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndriodCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }></script>
 -->

<!--Google Fonts-->
<!--
<link href='http://fonts.useso.com/css?family=Noto+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Open+Sans:600italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
-->
 
<!--<script src="http://ajax.useso.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>-->
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
				$(function(){
					$(".sb-icon-search").click(function(){
				      $(".bg, .search").slideDown();//从上往下显示页面
				  	});			    
					$(".circles").click(function(){
					      $(".bg, .search").slideUp();    //从下往上消失页面
					  });				  	  
				});
			});
			
			function relation(){
				var relation = document.getElementById("relation");
				//console.log("yes");
				relation.submit();
			}
	</script>
		
</head>
<body>
<%-- <%String username = (String)session.getAttribute("user");
out.println(username);----获取用户名称
%> --%>
<!--header start here-->
<div class="header">
	<div class="container">
		<div class="header-main">
			<div class="head-right">
			  <div class="top-nav">
				<ul class="res">
					<li><a class="active" href="indexContent.jsp">首页</a></li>
					<li><a href="makeFriends.jsp">交友点</a></li>
                    <li><a href="result.jsp">成果墙</a></li>
					<li><a href="mine1.jsp">我的</a></li>
                    <li><a href="about.jsp">关于我们</a></li>
				<div class="clearfix"> </div>
				</ul>

				<!-- script-for-menu -->
							 <script>
							   $( "span.menu" ).click(function() {
								 $( "ul.res" ).slideToggle( 300, function() {
								 // Animation complete.
								  });
							   });
							</script>
			    <!-- /script-for-menu -->
			 </div>				
			<div class="search-box">
				<div id="sb-search" class="sb-search">
					<form>
						<input class="sb-search-input" placeholder="Search" type="search" name="search" id="search">
						<input class="sb-search-submit" type="submit" value="">
						<span class="sb-icon-search"> </span>
					</form>
			   </div>
			</div>

			<div class="clearfix"> </div>
			  
		</div>
		
		<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--header end here-->

<!-- 获取 username-->
<%
	String username = (String)session.getAttribute("username");
	System.out.println("登录人姓名："+username);
	RecommendFriends friends = new RecommendFriends();
	String recommend[] = friends.recommendFriend(username);
	ResultFromDb re = new ResultFromDb();
	Vector<User> rec = re.dataFromDB(recommend);
	
	System.out.println("首页推荐的人是：");
	for(User user:rec){
		System.out.println(user.getUsername());
	}
%>

<!--banner start here-->
<div class="banner">
	<div class="container">
		<h1 class="title-text">南京晓庄学院交友点</h1>
        <h4 class="title-texth4">找到属于自己的大学生活，我们有的不仅仅是交友</h4>
        <div class="center-top">
            <div>
            	<span class="welcome2">WELCOME &nbsp;&nbsp;&nbsp;</span>
            	<span class="username"><%=username %></span>
            </div>
        </div>
	</div>
</div>
<!--banner end here-->
<!--services start here-->
<div class="container">
    <div class="services">
		<div class="services-main">
		  <form action="relation" method="get" id="relation">
			<div class="ser-row1">
				<div class="col-md-4 service-grid ser-gd1">
					<!--<img src="images/icon1.png" alt="">-->
                    <a href="relation?type-tag=1"><i class="fa fa-graduation-cap mafriw"></i></a>
					<h3>学霸室</h3>
					<p>Super scholar , wait ! please make friends with me.I need your help in study</p>
					<div class="ser-btn">
						<a href="relation?type-tag=1">更多</a>
					</div>
				</div>
				<div class="col-md-4 service-grid ser-gd2">
                    <a href="relation?type-tag=2"><i class="fa fa-soccer-ball-o mafriw"></i></a>
					<h3>运动区</h3>
					<p>Hi sportsman ! let's Exercise together . Can you make friends with me</p>
					<div class="ser-btn1">
                        <a href="relation?type-tag=2">更多</a>
					</div>
				</div>
				<div class="col-md-4 service-grid ser-gd3">
                    <a href="relation?type-tag=3"><i class="fa  fa-camera-retro mafriw"></i></a>
					<h3>旅游所</h3>
					<p>Happy here ! Happy time ! Making friends for trip</p>
					<div class="ser-btn">
                        <a href="relation?type-tag=3">更多</a>
					</div>
				</div>
			    <div class="clearfix"> </div>
			</div>
			<div class="ser-row2">
				<div class="col-md-4 service-grid ser-gd4">
                    <a href="relation?type-tag=4"><img src="images/icon5.png" alt=""></a>
					<h3>吃货街</h3>
					<p>Chowhound world ! welcome to Chowhound world . let's find the best food</p>
					<div class="ser-btn2">
                        <a href="relation?type-tag=4">更多</a>
					</div>
				</div>
				<div class="col-md-4 service-grid ser-gd5">
                    <a href="relation?type-tag=5"><img src="images/icon2.png"></a>
					<h3>情感间</h3>
					<p>Sed ut perspiciatis unde omnis iste natus doloremque laudantium</p>
					<div class="ser-btn3">
                        <a href="relation?type-tag=5">更多</a>
					</div>
				</div>
				<div class="col-md-4 service-grid ser-gd6">
                    <a href="relation?type-tag=6"><i class="fa fa-smile-o mafrib"></i></a>
					<h3>其他</h3>
					<p>Do you want to find your compatible friends ! come here</p>
					<div class="ser-btn2">
                        <a href="relation?type-tag=6">更多</a>
					</div>
				</div>
			    <div class="clearfix"> </div>
			</div>
		  </form>
		</div>
	</div>
</div>
<!--services end here-->
<!--welcome strip here-->
<div class="welcome">
	<div class="container">
		<div class="welcome-main">
			<div class="welcome-grid">
				<div class="welcome-left">
					<h4>南京晓庄学院交友人物榜</h4>
					<p>别走 ！男神在这里！！别走 ！女神在等你</p>
				</div>
				<div class="welcome-right">
					<a href="#">更多男女神</a>
				</div>
			  <div class="clearfix"> </div>
			</div>
		</div>
	</div>
</div>
<!--welcome strip end here-->
<!--works start here-->
<div class="work">
	<div class="container">
		<div class="work-main">
			   <div class="col-md-3 work-wrapper">		
							<a href="#" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/w2.jpg" alt="" class="img-responsive"><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"> <span class="glyphicon glyphicon-search" aria-hidden="true"> </span> </h2>
						  		</div></a>
                         <div class="work-details">
					   	  <h3><%=rec.get(0).getUsername() %></h3>
					   	 <p><%=rec.get(0).getIntroduction() %></p>
					   </div>
			   </div>
			   <div class="col-md-3 work-wrapper">		
							<a href="#" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/w1-1.jpg" class="img-responsive"><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><span class="glyphicon glyphicon-search" aria-hidden="true"> </span></h2>
						  		</div></a>
                         <div class="work-details">
					   	  <h3><%=rec.get(1).getUsername() %></h3>
					   	 <p><%=rec.get(1).getIntroduction() %></p>
					   </div>
			   </div>
			   <div class="col-md-3 work-wrapper">		
							<a href="images/w1.jpg" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/w2-1.jpg"  class="img-responsive"><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><span class="glyphicon glyphicon-search" aria-hidden="true"> </span></h2>
						  		</div></a>
                         <div class="work-details">
					   	  <h3><%=rec.get(2).getUsername() %></h3>
					   	 <p><%=rec.get(2).getIntroduction() %></p>
					   </div>
			   </div>
			   <div class="col-md-3 work-wrapper">		
							<a href="images/w1.jpg" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/w1.jpg" alt="" class="img-responsive"><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><span class="glyphicon glyphicon-search" aria-hidden="true"></h2>
						  		</div></a>
                         <div class="work-details">
					   	  <h3><%=rec.get(3).getUsername() %></h3>
					   	 <p><%=rec.get(3).getIntroduction() %></p>
					   </div>
			   </div>
			   
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<link rel="stylesheet" href="css/swipebox.css">
	<script src="js/jquery.swipebox.min.js"></script> 
	    <script type="text/javascript">
			jQuery(function($) {
				$(".swipebox").swipebox();
			});
</script>
<!--works end here-->

<!--foot start-->
<div class="copyright">
	<div class="container">
		<div class="copy-main">
			<div class="copy-left">
				<ul>
					<li><a class="active" href="index.jsp">Home</a></li>
					<li><a href="about.jsp">About</a></li>
					<li><a href="about.jsp">Portfolio</a></li>
					<li><a href="blog.jsp">Blog</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
			</div>
			<div class="copy-right"> 
			   <p>Copyright &copy; 2016.南京晓庄学院  </p>
			</div>
		</div>
	</div>
</div>
</div>


<div class="bg"></div>
<div class="search">
    <div class="circles" style="margin-top: -4px;">X</div>
    <div class="search-top-back"></div>

    <div class="search-left">
        <div class="search-left-content">
           <form name="userFind">
            <div class="search-left-top">
                <span class="search-left-text">寻找自己的好伙伴</span>
            </div>

            <div>
                <span>交友类型</span>
                <select name="friendsType" class="friendsType">
                    <option value="0">请选择交友类型</option>
                    <option value="1">学霸型</option>
                    <option value="2">运动</option>
                    <option value="3">旅游搭档</option>
                    <option value="4">吃货陪</option>
                    <option value="5">其他</option>
                </select>
                <span style="color:#a6192e">*</span>
            </div>

            <div>
                &nbsp;&nbsp;&nbsp;<span>性别</span>&nbsp;&nbsp;&nbsp;
                <select name="friendsSex" class="friendsType">
                    <option value="0">请选择性别</option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>
                <span style="color:#a6192e">*</span>
            </div>

            <div>
                &nbsp;&nbsp;&nbsp;<span>身高</span>&nbsp;&nbsp;&nbsp;
                <select name="friendsHeight" class="friendsType">
                    <option value="0">请选择身高</option>
                    <option value="1">150-155/CM</option>
                    <option value="2">155-160/CM</option>
                    <option value="2">160-165/CM</option>
                    <option value="2">165-170/CM</option>
                    <option value="3">170-175/CM</option>
                    <option value="4">175-180/CM</option>
                    <option value="2">180-185/CM</option>
                    <option value="2">185+/CM</option>
                </select>
                &nbsp;
            </div>

            <div>
                &nbsp;&nbsp;&nbsp;<span>学院</span>&nbsp;&nbsp;&nbsp;
                <select name="friendsAcademy" class="friendsType" onchange="changeprofessionFind()">
                    <option value="0">请选择学院</option>
                    <option value="信息">信息工程学院</option>
                    <option value="教院">教师学院</option>
                    <option value="电子">电子工程学院</option>
                    <option value="音乐">音乐学院</option>
                    <option value="美术">美术学院</option>
                    <option value="商">商学院</option>
                    <option value="旅管">旅游管理学院</option>
                    <option value="生化环">生物化学环境科学学院</option>
                    <option value="文学">文学院</option>
                    <option value="食品">食品安全科学学院</option>
                </select>
                &nbsp;
            </div>

            <div>
                &nbsp;&nbsp;&nbsp;<span>专业</span>&nbsp;&nbsp;&nbsp;
                <select name="friendsProfession" class="friendsType">
                    <option value="0">请选择专业</option>
                </select>
                &nbsp;
            </div>

            <div>
                &nbsp;&nbsp;&nbsp;<span>年级</span>&nbsp;&nbsp;&nbsp;
                <select name="friendsHeight" class="friendsType">
                    <option value="0">请选择年级</option>
                    <option value="1">13级</option>
                    <option value="2">14级</option>
                    <option value="2">15级</option>
                    <option value="2">16级</option>
                </select>
                &nbsp;
            </div>

            <!--<div>
                &nbsp;&nbsp;&nbsp;<span>地域</span>&nbsp;&nbsp;&nbsp;
                <select name="friendsHeight" class="friendsType">
                    <option value="0">请选择地域</option>
                    <option value="1">江苏省</option>
                </select>
                &nbsp;
            </div>-->

            <div>
                <span class="problem"><a href="loginHelp.jsp" style="color: #a6192e;">Have problems with Finding</a></span>
            </div>

            <div>
                <input class="search-button" type="button" value="Find"/>
            </div>
			</form>
        </div>
    </div>

</div>
<!--footer end her-->