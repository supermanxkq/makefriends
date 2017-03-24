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
			});
			
			$(function(){
				$(".sb-icon-search").click(function(){
			      $(".bg, .search").slideDown();//从上往下显示页面
			  	});			    
			  $(".circles").click(function(){
			      $(".bg, .search").slideUp();    //从下往上消失页面
			  });
			  
			  /* $("#log-in").click(function(){
			      $(".bg2, .login").slideDown();//从上往下显示页面
			  	});		    
			  $(".circles2").click(function(){
			      $(".bg2, .login").slideUp();    //从下往上消失页面
			  });  */
			  
			  $("#sign-in").click(function(){
			      $(".bg3, .sign").slideDown();//从上往下显示页面
			  	});		    
			  $(".circles").click(function(){
			      $(".bg3, .sign").slideUp();    //从下往上消失页面
			  });	
			  
			  $(".mafriw").click(function(){
				  alert("登录后才可以查看这些内容哦");
			  })
			  $(".alert-text").click(function(){
				  alert("登录后才可以查看这些内容哦");
			  })
			});
	</script>
	
	
</head>

<%
ResultFromDb fromDb = new ResultFromDb();
SearchByQuality sbq = new SearchByQuality();
String findByQuality[] = sbq.searchQuality();
Vector<User> typeResult = fromDb.dataFromDB(findByQuality);
for(User user:typeResult){		
	System.out.println(user.getUsername()+","+user.getSex()+","+user.getBirthday()+","+user.getIntroduction());
}
%>

<body>
<!--header start here-->
<div class="header">
	<div class="container">
		<div class="header-main">
			<div class="head-right">
			  <div class="top-nav">
				<ul class="res">
					<li><a class="active" href="index.jsp">首页</a></li>
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

<!-- <script type="text/javascript">
$(function(){
	
})
</script> -->

<!--banner start here-->
<div class="banner">
	<div class="container">
		<h1 class="title-text">南京晓庄学院交友点</h1>
        <h4 class="title-texth4">找到属于自己的大学生活，我们有的不仅仅是交友</h4>
        <div class="center-top">
            <div class="welcome-right" id="log-in" style="float: none;display: inline;margin: 10px 20px;">
                <a href="login.jsp">已有账号登录</a>
            </div>
            <div class="welcome-right" id="sign-in" style="float: none;display: inline;margin: 10px 20px;">
                <a href="#">注册账号</a>
            </div>
        </div>
	</div>
</div>
<!--banner end here-->
<!--services start here-->
<div class="container">
    <div class="services">
		<div class="services-main">
			<div class="ser-row1">
				<div class="col-md-4 service-grid ser-gd1">
					<!--<img src="images/icon1.png" alt="">-->
                    <a href="#"><i class="fa fa-graduation-cap mafriw"></i></a>
					<h3>学霸室</h3>
					<p>Super scholar , wait ! please make friends with me.I need your help in study</p>
					<div class="ser-btn">
						<a href="#" class="alert-text">更多</a>
					</div>
				</div>
				<div class="col-md-4 service-grid ser-gd2">
                    <a href="#"><i class="fa fa-soccer-ball-o mafriw"></i></a>
					<h3>运动区</h3>
					<p>Hi sportsman ! let's Exercise together . Can you make friends with me</p>
					<div class="ser-btn1">
                        <a href="#" class="alert-text">更多</a>
					</div>
				</div>
				<div class="col-md-4 service-grid ser-gd3">
                    <a href="#"><i class="fa  fa-camera-retro mafriw"></i></a>
					<h3>旅游所</h3>
					<p>Happy here ! Happy time ! Making friends for trip</p>
					<div class="ser-btn">
                        <a href="#" class="alert-text">更多</a>
					</div>
				</div>
			  <div class="clearfix"> </div>
			</div>
			<div class="ser-row2">
				<div class="col-md-4 service-grid ser-gd4">
                    <a href="#"><img src="images/icon5.png" alt=""></a>
					<h3>吃货街</h3>
					<p>Chowhound world ! welcome to Chowhound world . let's find the best food</p>
					<div class="ser-btn2">
                        <a href="#" class="alert-text">更多</a>
					</div>
				</div>
				<div class="col-md-4 service-grid ser-gd5">
                    <a href="#"><img src="images/icon2.png"></a>
					<h3>情感间</h3>
					<p>Sed ut perspiciatis unde omnis iste natus doloremque laudantium</p>
					<div class="ser-btn3">
                        <a href="#" class="alert-text">更多</a>
					</div>
				</div>
				<div class="col-md-4 service-grid ser-gd6">
                    <a href="#"><i class="fa fa-smile-o mafrib"></i></a>
					<h3>其他</h3>
					<p>Do you want to find your compatible friends ! come here</p>
					<div class="ser-btn2">
                        <a href="#" class="alert-text">更多</a>
					</div>
				</div>
			  <div class="clearfix"> </div>
			</div>
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
						     <img src="images/w2.jpg" alt="" class="img-responsive">
						     <div class="b-wrapper">
						     	<h2 class="b-animate b-from-left    b-delay03"> 
						     	<span class="glyphicon glyphicon-search" aria-hidden="true"> 
						     	</span> 
						     	</h2>
						  	</div></a>
                         <div class="work-details">
					   	  <h3><%=typeResult.get(0).getUsername() %></h3>
					   	 <p><%=typeResult.get(0).getIntroduction() %></p>
					   </div>
			   </div>
			   <div class="col-md-3 work-wrapper">		
							<a href="#" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/w2-1.jpg"  class="img-responsive"><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><span class="glyphicon glyphicon-search" aria-hidden="true"> </span></h2>
						  		</div></a>
                         <div class="work-details">
					   	 <h3><%=typeResult.get(1).getUsername() %></h3>
					   	 <p><%=typeResult.get(1).getIntroduction() %></p>
					   </div>
			   </div>
			   <div class="col-md-3 work-wrapper">		
							<a href="#" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/w1-1.jpg" class="img-responsive"><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><span class="glyphicon glyphicon-search" aria-hidden="true"> </span></h2>
						  		</div></a>
                         <div class="work-details">
					   	  <h3><%=typeResult.get(2).getUsername() %></h3>
					   	 <p><%=typeResult.get(2).getIntroduction() %></p>
					   </div>
			   </div>
			   <div class="col-md-3 work-wrapper">		
							<a href="#" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/w1.jpg" alt="" class="img-responsive"><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><span class="glyphicon glyphicon-search" aria-hidden="true"></h2>
						  		</div></a>
                         <div class="work-details">
					   	  <h3><%=typeResult.get(3).getUsername() %></h3>
					   	 <p><%=typeResult.get(3).getIntroduction() %></p>
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
<!--footer end her-->


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
                    <option value="4">情感类</option>
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


<div class="bg2"></div>

<form action="userLogin" method="post">
<div class="login">

    <div class="circles2">X</div>

    <div class="login-top-back"></div>
    <div class="login-left">
        <div class="login-left-content">
            <div class="login-left-top">
                <span class="login-left-text">南京晓庄学院交友站登录</span>
            </div>

            <div style="margin-top: 20px;">
                <i class="fa fa-user login-user"></i>
                <input name="username" class="login-info" type="text" placeholder="e-mail/phone/username"/>
            </div>

            <div>
                <i class="fa fa-unlock login-user"></i>
                <input name="password" class="login-info" type="password" placeholder="password"/>
            </div>

			<div>
                 <i class="fa fa-unlock login-user"></i>
                 <input name="checkcode" class="login-info" type="text" placeholder="请填写下方的验证码" style="font-size: 14px;"/>
                 <img src="ValidateCode" onclick="change(this)" alt="换一张"  style="cursor:pointer;width: 35%;height: 35%;">
                 <a href="#" style="font-size: 12px;">看不清，换一张</a> 
            </div>

           <!--  <div>
                <span class="problem2"><a href="loginHelp.jsp" style="color: #a6192e;">Have problems with LoginIn</a></span>
            </div> -->
            
           <!--  <div>
                <input class="login-button" type="submit" value="Login In"/>
            </div> -->

        </div>
    </div>
    <div class="login-right">
        <div class="login-left-top" style="margin-top: 28px;">
            <span class="login-left-text">其他方式登录</span>
        </div>
        <div class="qq">
            <i class="fa fa-qq qq-img"></i>
            <span class="qq-text"><a href="http://w.qq.com/">QQ</a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>

        <div class="qq WECHAT">
            <i class="fa fa-wechat qq-img"></i>
            <span class="qq-text"><a href="https://wx.qq.com/">WECHAT</a></span>
        </div>

        <div class="qq WEIBO">
            <i class="fa fa-weibo qq-img"></i>
            <span class="qq-text"><a href="http://weibo.com/">WEIBO</a></span>&nbsp;&nbsp;
        </div>

        <div>
            <input class="login-button login-sign" style="width: 70%" type="button" value="login"/>
        </div>
    </div>
    
</div>
</form>





<div class="bg3"></div>

<div class="sign">

    <div class="circles" style="margin-top: -4px;">X</div>

    <div class="sign-top-back"></div>

	 <div class="sign-top-text">
          <span class="sign-left-text">注册信息</span>
     </div>

	<form action="addUser" method="post" name="userSign">
	    <div class="sign-left">
	        <div class="sign-left-content">
	            <div>
	                &nbsp;&nbsp;&nbsp;&nbsp;<span>姓名</span>&nbsp;&nbsp;&nbsp;
	                <input type="text" class="signFriendsType" name="username">
	                <span style="color:#a6192e">*</span>
	            </div>
	
				<div>
	                &nbsp;&nbsp;&nbsp;&nbsp;<span>性别</span>&nbsp;&nbsp;&nbsp;
	                <select name="sex" class="signFriendsType">
	                    <option value="0">请选择性别</option>
	                    <option value="男">男</option>
	                    <option value="女">女</option>
	                </select>
	                <span style="color:#a6192e">*</span>
	            </div>
	
				<div>
	                <span>自我类型</span>
	                <select name="myType" class="signFriendsType">
	                    <option value="0">请选择自我类型</option>
	                    <option value="学霸型">学霸型</option>
	                    <option value="运动">运动</option>
	                    <option value="旅游搭档">旅游搭档</option>
	                    <option value="吃货陪">吃货陪</option>
	                    <option value="情感类">情感类</option>
	                    <option value="其他">其他</option>
	                </select>
	                <span style="color:#a6192e">*</span>
	            </div>
	            
	             <div>
	                &nbsp;&nbsp;&nbsp;<span>学院</span>&nbsp;&nbsp;&nbsp;
	                <select name="academy" class="signFriendsType" onchange="changeprofession()">
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
	                &nbsp;&nbsp;&nbsp;<span>年级</span>&nbsp;&nbsp;&nbsp;
	                <select name="grade" class="signFriendsType">
	                    <option value="0">请选择年级</option>
	                    <option value="13级">13级</option>
	                    <option value="14级">14级</option>
	                    <option value="15级">15级</option>
	                    <option value="16级">16级</option>
	                </select>
	                &nbsp;
	            </div>
	            
	            
	            <div>
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>省</span>&nbsp;&nbsp;&nbsp;&nbsp;
	                <select name="province" class="signFriendsType"  onchange="changecity()">
	                    <option value="0">请选择省</option>
	                    <option value="江苏省">江苏省</option>
	                    <option value="湖南省">湖南省</option>
	                    <option value="陕西省">陕西省</option>
	                    <option value="山东省">山东省</option>
	                    <option value="河北省">河北省</option>
	                </select>
	                &nbsp;
	            </div>
	            
	            <div>
	            	<span>自我介绍</span>
	            	<textarea class="introd" name="introduction">
	            		
	            	</textarea>
	            </div>
	        </div>
	    </div>
	
	    <div class="sign-right">
	        <div class="sign-left-content">         
				
				 <div>
	                &nbsp;&nbsp;&nbsp;&nbsp;<span>密码</span>&nbsp;&nbsp;&nbsp;
	                <input type="password" class="signFriendsType" name="password">
	                <span style="color:#a6192e">*</span>
	            </div>
							
	            <div>
	                &nbsp;&nbsp;&nbsp;&nbsp;<span>身高</span>&nbsp;&nbsp;&nbsp;
	                <input type="text" name="height" class="signFriendsType"  placeholder="cm"
	                 id="height"      onblur="validateHeight()">
	                &nbsp;
	            </div>
				
	            <div>
	                <span>交友类型</span>
	                <select class="signFriendsType" name="desType" id="desFriends">
	                    <option value="0">请选择交友类型</option>
	                    <option value="学霸型">学霸型</option>
	                    <option value="运动">运动</option>
	                    <option value="旅游搭档">旅游搭档</option>
	                    <option value="吃货陪">吃货陪</option>
	                    <option value="情感类">情感类</option>
	                    <option value="其他">其他</option>
	                </select>
	                <span style="color:#a6192e">*</span>
	            </div>
	
				<div>
	                &nbsp;&nbsp;&nbsp;&nbsp;<span>专业</span>&nbsp;&nbsp;&nbsp;
	                <select class="signFriendsType" name="profession">
	                    <option value="0">请选择专业</option>
	                </select>
	                &nbsp;
	            </div>
				
	            <div>
	            	&nbsp;&nbsp;&nbsp;&nbsp;<span>生日</span>&nbsp;&nbsp;&nbsp;
	            	<input type="text" class="signFriendsType" name="birthday" placeholder="1990-1-1"
	            	onblur="checkDateInput(this)">
	            	&nbsp;
	                <!-- &nbsp;&nbsp;&nbsp;&nbsp;<span>生日</span>&nbsp;&nbsp;&nbsp;
	                <select name="friendsPro" class="signFriendsType" name="birthday">
	                    <option value="0">请选择专业</option>
	                    <option value="1">计算机专业</option>
	                    <option value="2">网络工程专业</option>
	                    <option value="2">数学专业</option>
	                    <option value="0">师范专业</option>
	                </select>
	                &nbsp; -->
	            </div>
	
				<div>
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>市</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            
	                <select class="signFriendsType" name="city">
	                    <option value="0">请选择市</option>
	                  
	                </select>
	                
	                &nbsp;
	            </div>         
	                    
				<input type="hidden" name="des">
	            <div>
	                <input class="sign-button" type="submit" value="SIGN-IN"/>
	            </div>
	
	        </div>
	    </div>
    </form>

</div>

<script type="text/javascript">
	$(function(){
		$("#desFriends").change(function(){
			var select = $("#desFriends").get(0).selectedIndex;
			userSign.des.value = select;
		});
	});
	
	var city=[
	  		["南京","苏州","南通","常州"],
	  		["长沙市","株洲市","湘潭市","衡阳市","邵阳市","岳阳市","张家界市"],
	  		["西安市","铜川市","宝鸡市","咸阳市"],
	  		["济南","青岛","淄博 ","枣庄","东营","烟台","日照"],
	  		["石家庄市","唐山市","秦皇岛市","邯郸市","邢台市","保定市","张家口市"]
	  	   ];
	  	
	  	function changecity(){
	  	  var sltProvince=document.userSign.province;
	  	  var sltCity=document.userSign.city;     
	  	  var provinceCity=city[sltProvince.selectedIndex - 1];	
	  	  sltCity.length=1;	
	  	  for(var i=0;i<provinceCity.length;i++){
	  	    sltCity[i+1]=new Option(provinceCity[i],provinceCity[i]);
	  	  }
	  	}
	  	
	  	var profession=[
	  	  		["计算机专业","软件工程","网络工程"],
	  	  		["小学教师","幼师"],
	  	  		["自动化专业","光电子专业"],
	  	  		["声乐专业","器乐专业"],
	  	  		["素描专业"],
	  	  		["金融专业","会计专业","经管专业"],
	  	  		["旅游管理专业"],
	  	  		["环境监测专业"],
	  	  		["文秘专业"],
	  	  		["食品安全检测"]
	  	  	   ];
	  	function changeprofession(){
	  		  var sltAcademy=document.userSign.academy;
	  		  var sltProfession=document.userSign.profession;     
	  		  var academyProfession=profession[sltAcademy.selectedIndex - 1];	
	  		  sltProfession.length=1;	
	  		  for(var j=0;j<academyProfession.length;j++){
	  			  sltProfession[j+1]=new Option(academyProfession[j],academyProfession[j]);
	  		  }
	  		}
	  	
	  	var findProfession=[
	  	    	  		["计算机专业","软件工程","网络工程"],
	  	    	  		["小学教师","幼师"],
	  	    	  		["自动化专业","光电子专业"],
	  	    	  		["声乐专业","器乐专业"],
	  	    	  		["素描专业"],
	  	    	  		["金融专业","会计专业","经管专业"],
	  	    	  		["旅游管理专业"],
	  	    	  		["环境监测专业"],
	  	    	  		["文秘专业"],
	  	    	  		["食品安全检测"]
	  	    	  	   ];
	  	    	function changeprofessionFind(){
	  	    		  var sltfriendsAcademy=document.userFind.friendsAcademy;
	  	    		  var sltfriendsProfession=document.userFind.friendsProfession;     
	  	    		  var academyProfession=findProfession[sltfriendsAcademy.selectedIndex - 1];	
	  	    		  sltfriendsProfession.length=1;	
	  	    		  for(var j=0;j<academyProfession.length;j++){
	  	    			  sltfriendsProfession[j+1]=new Option(academyProfession[j],academyProfession[j]);
	  	    		  }
	  	    	}
	  	    	
	  	    //生日格式 
		    	function checkDateInput(obj){ 
					if (obj.value.length==0) return false; 
					var objValue=obj.value.replace(/[-\.]/g,"/"); 
					try{ 
						var a=new Date(objValue); 
						if (isNaN(a)){ 
							obj.value=""; 
							alert("注意：\n\n你输入的日期不正确,已被清除!"); 
							obj.focus(); 
							return false; 
						} 
					var b; 
					if (a.getFullYear()<1900||a.getFullYear()>2200) {
						var Today=new Date(); 
					    b=Today.getFullYear()+"-"+(a.getMonth()+1)+"-"+a.getDate(); 
					} else if (a.getFullYear()<1930) 
					   b=(a.getFullYear()+100)+"-"+(a.getMonth()+1)+"-"+a.getDate(); 
					   else b=a.getFullYear()+"-"+(a.getMonth()+1)+"-"+a.getDate(); 
					   obj.value=obj.value.replace(/[-\.\/]0*/g,"-"); 
					if (b!=obj.value){ 
					   obj.value=b; 
					   alert("注意：\n\n你输入的日期不正确,已进行修改。"); 
					   obj.select(); 
					   obj.focus(); 
					   return false; 
					  } 
					} 
					catch(Exception){ 
					  obj.value=""; 
					  alert("注意：\n\n你输入的日期不正确，已被清除!"); 
					  obj.focus(); 
					  return false; 
					 } 
					return true; 
					} 
		    	//身高的数字限制   
			  	   function validateHeight(){
			  		 // alert(1);
			  		   var reg = new RegExp("^[0-9]*$");
			  		   var obj = document.getElementById("height");
			  		   if(!reg.test(obj.value)){
			  			   alert("请输入数字");
			  			   obj.value = null;
			  		   }
			  	   }

	  	    
</script>

</body>
</html>