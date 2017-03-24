<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="css/font-awesome.min.css"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }>
</script> -->
<meta name="keywords" content="Bridal  Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndriodCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />

<!-- start-smoth-scrolling -->
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
			  
			})
	</script>
    <style type="text/css">
        .mk-text{
            background: #a6192e;
            height: 50px;
            margin-left: 5px;

        }
        .mk-text h4{
            color: #ffffff;
            margin-left: 20px;
            padding-top: 15px;
        }
        .contact-ab{
            display: inline;
        }
        .contact-ab-phone{
            display: inline;
        }
        .about-div{
            margin-top: 10px;;
        }
        
        .search{
         	display:none;
            border: 1px solid #a6192e;
            border-radius: 10px;
            -moz-border-radius: 10px;
            width: 400px;
            height: 500px;
            background: white;
            position: fixed;
            left: 50%;
            top: 50%;
            margin-top: -220px;
            margin-left: -200px;
            z-index:1000;
            padding: 10px;
        }

        .circles {
            width: 20px;
            height: 20px;
            line-height: 20px;
            text-indent: 4px;
            color: #FFF;
            background: #333;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
            float: right;

        }
        .search-top-back{
            border-radius: 8px;
            -moz-border-radius: 8px;
            width: 399px;
            background-color: #a6192e;
            height: 8%;
            margin: -10px;
        }
        .search-left{
            margin-left: 10%;
            margin-top:10px;
            width: 80%;
            background-color: #ffffff;
            height: 92%;
            float: left;
        }

        .search-left-text{
            display: inline;
            color: #000000;
            font-size: 15px;
            font-family: "Calibri";
        }

        .search-left-top{
            margin-bottom: 20px;
            margin-top: 20px;
            text-align: center;
        }
        .search-left-content{
            text-align: center;
        }
        .problem{
            margin-right: 30px;
            margin-top: 15px;;
            font-size: 12px;
            float: right;
        }
        .search-button{
            background-color: #a6192e;
            margin-top: 20px;
            width: 80%;
            border-radius: 5px;
            -moz-border-radius: 5px;
            border: 1px solid #a6192e;
            height: 35px;
            color:white;
        }
        .friendsType{
            border: 1px solid #a6192e;
            margin-top: 15px;;
            margin-left: 10px;
            width: 60%;
            height: 30px;
            border-radius: 2px;
            -moz-border-radius: 2px;
        }
    </style>
</head>
<body>
<!-- //end-smoth-scrolling -->
<!--header start here-->
<div class="header">
	<div class="container">
		<div class="header-main">
			<div class="head-right">
			  <div class="top-nav">
					<span class="menu"> <img src="images/icon.png" alt=""/></span>
                  <ul class="res">
                      <li><a href="indexContent.jsp">首页</a></li>
                      <li><a href="makeFriends.jsp">交友点</a></li>
                      <li><a href="result.jsp">成果墙</a></li>
                      <li><a href="mine1.jsp">我的</a></li>
                      <li><a href="about.jsp" class="active" >关于我们</a></li>
                      <!--<li><a href="contact.html">联系</a></li>-->
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
<!--start-about-->
<div class="about">
	<div class="container">
		<div class="about-main">
				<div class="about-top">
					<h3>About</h3>
					<p>我们的团队，我们的创意，我们的联系方式，我们的网站</p>
				</div>
			</div>
	 </div>
</div>

<div class="team-mem" style="margin-top: 35px">
		<div class="container">
            <div class="mk-text">
                <h4>我们团队</h4>
            </div>
			   <div class="team-main" style="margin-top: 20px;">
					<div class="team-top">
						<div class="col-md-2 team-top-left" style="margin-left: 3%;">
							<img src="images/t1.jpg" alt="" class="img-responsive">
							<div class="team-details">
								<h4>Mark Johnson</h4>
								<P>Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium.</P>
							</div>
						</div>
						<div class="col-md-2 team-top-left" style="margin-left: 2%;">
							<img src="images/t2.jpg" alt="" class="img-responsive">
							<div class="team-details">
								<h4>Bradley Grosh</h4>
								<P>Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium.</P>
							</div>	
						</div>
						<div class="col-md-2 team-top-left" style="margin-left: 2%;">
							<img src="images/t3.jpg" alt="" class="img-responsive">
							<div class="team-details">
								<h4>Bradley Grosh</h4>
								<P>Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium.</P>
							</div>	
						</div>
						<div class="col-md-2 team-top-left" style="margin-left: 2%;">
							<img src="images/t4.jpg" alt="" class="img-responsive">
							<div class="team-details">
								<h4>Bradley Grosh</h4>
								<P>Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium.</P>
							</div>	
						</div>
                        <div class="col-md-2 team-top-left" style="margin-left: 2%;">
                            <img src="images/t4.jpg" alt="" class="img-responsive">
                            <div class="team-details">
                                <h4>Bradley Grosh</h4>
                                <P>Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium.</P>
                            </div>
                        </div>
					<div class="clearfix"> </div>
				</div>
			</div>
	  </div>
</div>
<!--end-team-->
<!--footer start here-->
<div class="footer">

    <div class="contact">
        <div class="container">
            <div class="mk-text" style="margin-top: -63px;">
                <h4>联系我们</h4>
            </div>
            <div class="contact-main">
                <div class="contact-bottom">
                    <div class="col-md-5 contact-left">
                        <div class="contact-head">
                            <h3>联系信息</h3>
                        </div>
                        <h4>地址：南京市江宁区弘景大道3601号南京晓庄学院</h4>
                        <p>如果你对我们网站有什么意见或者建议，欢迎联系我们，你可以发送邮件可以call电话，当然也可以提交右边的表格给我们，你们的建议，我们会慎重考虑</p>
                        <div class="addre">
                            <h5>信息</h5>
                            <p>地址 : 南京市江宁区弘景大道3601号南京晓庄学院</p>
                            <p>电话 : 12345576899 </p>
                            <p>email : 1247732674@qq.com</p>
                        </div>
                    </div>
                    <div class="col-md-7 contact-right">
                        <div class="contact-head">
                            <h3>联系表格</h3>
                        </div>
                        <p>Name</p>
                        <input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/>
                        <p>E-mail</p>
                        <input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/>
                        <p>Subject</p>
                        <input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/>
                        <p>Messages</p>
                        <textarea onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/> </textarea>
                        <input type="submit" value="Send">
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>


	</div>
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
                <select name="friendsHeight" class="friendsType">
                    <option value="0">请选择学院</option>
                    <option value="1">信息工程学院</option>
                    <option value="2">电子工程学院</option>
                    <option value="2">音乐学院</option>
                    <option value="2">美术学院</option>
                    <option value="3">商学院</option>
                    <option value="4">旅游管理学院</option>
                    <option value="2">生物化学环境科学学院</option>
                    <option value="2">文学院</option>
                    <option value="2">食品安全科学学院</option>
                </select>
                &nbsp;
            </div>

            <div>
                &nbsp;&nbsp;&nbsp;<span>专业</span>&nbsp;&nbsp;&nbsp;
                <select name="friendsHeight" class="friendsType">
                    <option value="0">请选择专业</option>
                    <option value="1">计算机专业</option>
                    <option value="2">网络工程专业</option>
                    <option value="2">数学专业</option>
                    <option value="0">师范专业</option>
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

        </div>
    </div>

</div>


</body>
</html>