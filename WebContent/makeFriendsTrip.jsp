<%@page import="njxzc.dao.ResultFromDb"%>
<%@page import="njxzc.dao.FindType"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="njxzc.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>makeFriendsTrip</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-1.11.0.min.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" type="text/css" href="css/style_common.css" />
    <link rel="stylesheet" type="text/css" href="css/style3.css" />
    <link rel="stylesheet" type="text/css" href="css/superScholar.css" />
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }>
    </script> -->
    <meta name="keywords" content="Bridal Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndriodCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <!--Google Fonts-->
    <!--
    <link href='http://fonts.useso.com/css?family=Noto+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Open+Sans:600italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    -->
    <!-- start-smoth-scrolling -->
    <!--<script src="http://ajax.useso.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>-->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
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

</head>
<body>
<!-- //end-smoth-scrolling -->
<!--header start here-->
<div class="header">
    <div class="container">
        <div class="header-main">
            <div class="head-right">
                <div class="top-nav">
                    <ul class="res">
                        <li><a href="indexContent.jsp">首页</a></li>
                        <li><a class="active" href="makeFriendsTrip.jsp">交友点</a></li>
                        <li><a href="result.jsp">成果墙</a></li>
                        <li><a href="mine1.jsp">我的</a></li>
                        <li><a href="about.jsp">关于我们</a></li>
                        <!--<li><a href="contact.jsp">联系</a></li>-->
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

<%
					
	Object obj = request.getAttribute("relationUser");
	Vector<User> resultUser = (Vector<User>)obj;
	//System.out.println(resultUser.get(0).getUsername());
	System.out.println("获取到的username是：");
	for(User user:resultUser){		
		System.out.println(user.getUsername()+","+user.getSex()+","+user.getBirthday()+","+user.getIntroduction());
	}	
	
	ResultFromDb fromDb = new ResultFromDb();
	FindType findType = new FindType();
	String typeUser[] = findType.getType("旅游搭档");	
	Vector<User> typeResult = fromDb.dataFromDB(typeUser);
	for(User user:typeResult){		
		System.out.println(user.getUsername()+","+user.getSex()+","+user.getBirthday()+","+user.getIntroduction());
	}
	/* for(int i = 0;i<8;i++){
		System.out.println(relationUser[i]);
	} */
	
%>

<!--portfolio start here-->
<div class="portfolio">
    <div class="container">
        <div class="portfolio-main">
            <div class="portfolio-top">
                <h3>welcome to our 旅游所</h3>
                <p>休闲一刻，嗨起来，寻找自己的旅游伙伴</p>
            </div>
            <div class="portfolio-bottom">
                <div class="mk-text">
                    <h4>旅游集中营</h4>
                    <div class="welcome-right" style="margin-top: -30px;">
                        <a href="#">更多旅游朋友</a>
                    </div>
                </div>
                <div class="view view-third">
                    <a href="#"><img src="images/l1.jpg" alt="" class="img-responsive">
                        <div class="mask">
                            <h2><%=typeResult.get(0).getUsername() %></h2>
                        	<p><%=typeResult.get(0).getSex()+","+typeResult.get(0).getBirthday() %>岁<br><%=typeResult.get(0).getIntroduction() %></p>
                        	<span class="info">Read More</span>
                        </div></a>
                </div>
                <div class="view view-third">
                    <a href="single.jsp"><img src="images/l2.jpg" alt="" class="img-responsive">
                        <div class="mask">
                            <h2><%=typeResult.get(1).getUsername() %></h2>
                        	<p><%=typeResult.get(1).getSex()+","+typeResult.get(1).getBirthday() %>岁<br><%=typeResult.get(1).getIntroduction() %></p>
                        	<span class="info">Read More</span>
                        </div></a>
                </div>
                <div class="view view-third">
                    <a href="single.jsp"><img src="images/l3.jpg" alt="" class="img-responsive">
                        <div class="mask">
                            <h2><%=typeResult.get(2).getUsername() %></h2>
                        	<p><%=typeResult.get(2).getSex()+","+typeResult.get(2).getBirthday() %>岁<br><%=typeResult.get(2).getIntroduction() %></p>
                        	<span class="info">Read More</span>
                        </div></a>
                </div>
                <div class="view view-third">
                    <a href="single.jsp"><img src="images/l4.jpg" alt="" class="img-responsive">
                        <div class="mask">
                            <h2><%=typeResult.get(3).getUsername() %></h2>
                        	<p><%=typeResult.get(3).getSex()+","+typeResult.get(3).getBirthday() %>岁<br><%=typeResult.get(3).getIntroduction() %></p>
                        	<span class="info">Read More</span>
                        </div></a>
                </div>
                <div class="view view-third">
                    <a href="single.jsp"><img src="images/l5.jpg" alt="" class="img-responsive">
                        <div class="mask">
                            <h2><%=typeResult.get(4).getUsername() %></h2>
                        	<p><%=typeResult.get(4).getSex()+","+typeResult.get(4).getBirthday() %>岁<br><%=typeResult.get(4).getIntroduction() %></p>
                        	<span class="info">Read More</span>
                        </div></a>
                </div>
                <div class="view view-third">
                    <a href="single.jsp"><img src="images/l6.jpg" alt="" class="img-responsive">
                        <div class="mask">
                            <h2><%=typeResult.get(5).getUsername() %></h2>
                        	<p><%=typeResult.get(5).getSex()+","+typeResult.get(5).getBirthday() %>岁<br><%=typeResult.get(5).getIntroduction() %></p>
                        	<span class="info">Read More</span>
                        </div></a>
                </div>
                <div class="clearfix"> </div>
            </div>
            
             <div class="portfolio-bottom tuij">
                <div class="mk-text">
                    <h4>推荐给你</h4>
                    <div class="welcome-right" style="margin-top: -30px;">
                        <a href="#">更多推荐</a>
                    </div>
                </div>
                <div class="row" style="margin-left: 2px;margin-right: 2px;margin-top: 10px;">
                    <div class="col-md-2 tuij-margin">
                        <a href="" style="text-decoration: none;">
                            <img src="images/i1.jpg" alt="" class="img-responsive">
                            <span class="tuij-text"><%=resultUser.get(0).getUsername()+","+resultUser.get(0).getSex()+","+resultUser.get(0).getBirthday() %>岁</span>
                            <br/>
                            <span class="tuij-text"><%=resultUser.get(0).getIntroduction()%></span>
                        </a>
                    </div>
                    <div class="col-md-2">
                        <a href="" style="text-decoration: none;">
                            <img src="images/i2.jpg" alt="" class="img-responsive">
                            <span class="tuij-text"><%=resultUser.get(1).getUsername()+","+resultUser.get(1).getSex()+","+resultUser.get(1).getBirthday() %>岁</span>
                            <br/>
                            <span class="tuij-text"><%=resultUser.get(1).getIntroduction()%></span>
                        </a>
                    </div>
                    <div class="col-md-2">
                        <a href="" style="text-decoration: none;">
                            <img src="images/i3.jpg" alt="" class="img-responsive">
                            <span class="tuij-text"><%=resultUser.get(2).getUsername()+","+resultUser.get(2).getSex()+","+resultUser.get(2).getBirthday() %>岁</span>
                            <br/>
                            <span class="tuij-text"><%=resultUser.get(2).getIntroduction()%></span>
                        </a>
                    </div>
                    <div class="col-md-2">
                        <a href="" style="text-decoration: none;">
                            <img src="images/i4.jpeg" alt="" class="img-responsive">
                            <span class="tuij-text"><%=resultUser.get(3).getUsername()+","+resultUser.get(3).getSex()+","+resultUser.get(3).getBirthday() %>岁</span>
                            <br/>
                            <span class="tuij-text"><%=resultUser.get(3).getIntroduction()%></span>
                        </a>
                    </div>
                    <div class="col-md-2">
                        <a href="" style="text-decoration: none;">
                            <img src="images/i5.jpg" alt="" class="img-responsive">
                            <span class="tuij-text"><%=resultUser.get(4).getUsername()+","+resultUser.get(4).getSex()+","+resultUser.get(4).getBirthday() %>岁</span>
                            <br/>
                            <span class="tuij-text"><%=resultUser.get(4).getIntroduction()%></span>
                        </a>
                    </div>
                    <div class="col-md-2">
                        <a href="" style="text-decoration: none;">
                            <img src="images/i6.jpg" alt="" class="img-responsive">
                            <span class="tuij-text"><%=resultUser.get(5).getUsername()+","+resultUser.get(5).getSex()+","+resultUser.get(5).getBirthday() %>岁</span>
                            <br/>
                            <span class="tuij-text"><%=resultUser.get(5).getIntroduction()%></span>
                        </a>
                    </div>

                    <div class="clearfix"> </div>
                </div>
            </div>        
        </div>
    </div>
</div>
<!--portfolio end here-->
<!--footer start here-->
<div class="footer">
    <div class="container">
        <div class="mk-text">
            <h4>旅游休闲故事厅</h4>
            <div class="welcome-right" style="margin-top: -30px;">
                <a href="#">更多旅游故事</a>
            </div>
        </div>
        <div class="footer-main">
            <div class="col-md-12 footer-grid">
                <h3 class="mk-h3" style="margin-left: 15px;">Recent Post</h3>
                <div class="ftr-sub-gd">
                    <div class="col-md-3 ftr-gd1-img">
                        <a href="#"><img src="images/f1.jpg" alt="" class="img-responsive" style="width: 200px;height: 100px;"></a>
                    </div>
                    <div class="col-md-9 ftr-gd1-text">
                        <h4><a href="#">人生那么长，学渣一下又何妨！</a></h4>
                        <p><a href="#">我打小就是学霸，光荣榜上第一的位置永远都是我的名字。我自信地以为，也许我的人生会一直这样下去，永远高高在上，永远占据第一。
                            可是自从上了高中，这种骄傲就不复存在了，惨不忍睹的数学成绩瞬间把我打入了十八层地狱。
                        </a>
                        </p>
                        <p class="mk-p"><a href="" class="mk-a">更多</a></p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="ftr-sub-gd">
                    <div class="col-md-3 ftr-gd1-img">
                        <a href="#"><img src="images/f1.jpg" alt="" class="img-responsive" style="width: 200px;height: 100px;"></a>
                    </div>
                    <div class="col-md-9 ftr-gd1-text">
                        <h4><a href="#">胖妞的世界</a></h4>
                        <p><a href="#">我不是一夜之间胖起来的，但是我却仿佛在一夜之间被肥胖给毁灭了。 那是几年前我更加年轻的时候，我和我的第N任男朋友在饭店里吃一顿丰盛的自助餐。我在故意错过一顿午饭的情况下，
                                                 轻松在半小时内干掉了十个肉串，五个鸡翅，两盘杏鲍菇和三块黑森林...
                        </a>
                        </p>
                        <p class="mk-p"><a href="" class="mk-a">更多</a></p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="ftr-sub-gd">
                    <div class="col-md-3 ftr-gd1-img">
                        <a href="#"><img src="images/f1.jpg" alt="" class="img-responsive" style="width: 200px;height: 100px;"></a>
                    </div>
                    <div class="col-md-9 ftr-gd1-text">
                        <h4><a href="#">胖妞的世界</a></h4>
                        <p><a href="#">我不是一夜之间胖起来的，但是我却仿佛在一夜之间被肥胖给毁灭了。 那是几年前我更加年轻的时候，我和我的第N任男朋友在饭店里吃一顿丰盛的自助餐。我在故意错过一顿午饭的情况下，
                                                 轻松在半小时内干掉了十个肉串，五个鸡翅，两盘杏鲍菇和三块黑森林...
                        </a>
                        </p>
                        <p class="mk-p"><a href="" class="mk-a">更多</a></p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
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