<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>makeFriends</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
    <!-- Custom Theme files -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   
    <script src="js/classie.js"></script>
    <script src="js/jquery-1.11.0.min.js"></script>
    <meta name="keywords" content="Bridal  Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndriodCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
   
   
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
        .mainbox{
            border: 1px solid;
            padding: 10px 0;
            margin: 0 -5px;;
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
                        <li><a class="active" href="makeFriends.jsp">交友点</a></li>
                        <li><a href="result.jsp">成果墙</a></li>
                        <li><a href="mine1.jsp">我的</a></li>
                        <li><a href="about.jsp">关于我们</a></li>
                        <!--<li><a href="contact.jsp">联系</a></li>-->
                        <div class="clearfix"> </div>
                    </ul>
                   
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
            <div class="about-top" style="margin-bottom: 40px;">
                <h3>交友点</h3>
                <p>在这里可以找到各式各样的朋友，我们的青春在这里挥洒，我们的记忆在这里回忆！留言间的发生故事，在这里也可以见证</p>
            </div>
            <div class="about-wedo">
                <div class="mk-text">
                    <h4>交友间</h4>
                </div>
                <div class="col-md-9 about-top-img">
                    <div id="flash">
                        <ul id="pic">
                            <li style="display:block"><img src="img/b.jpg" style="width: 700px;height: 350px;"></li>
                            <li><img src="images/b2.jpg" style="width: 700px;height: 350px;"></li>
                            <li><img src="images/b3.jpg" style="width: 700px;height: 350px;"></li>
                            <li><img src="images/b4.jpg" style="width: 700px;height: 350px;"></li>
                            <li><img src="images/b5.jpg" style="width: 700px;height: 350px;"></li>
                            <li><img src="images/b6.jpg" style="width: 700px;height: 350px;"></li>
                        </ul>
                        <ol id="num">
                            <li class="activate">1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                            <li>5</li>
                            <li>6</li>
                        </ol>
                        <a href="javascript:;" class="arrow" id="left">&lt;</a>
                        <a href="javascript:;" class="arrow" id="right">&gt;</a>
                    </div>
                </div>
                <div class="col-md3 about-wedo-right">
                    <div class="blog-cate" style="margin-top: 20px;">
                        <h3>分类</h3>
                        <ul>
                            <li><a href="makeFriendsSuperscholar.jsp">学霸---superscholar</a></li>
                            <li><a href="makeFriendsSports.jsp">运动---sports</a></li>
                            <li><a href="makeFriendsTrip.jsp">旅游---trivial together</a></li>
                            <li><a href="makeFriendsEating.jsp">吃货---eating! eating!!</a></li>
                            <li><a href="makeFriendsEmotion.jsp">情感---emotion</a></li>
                            <li><a href="makeFrineds.jsp">其他---others</a></li>
                        </ul>
                    </div>

                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
<div class="advantages" style="margin-top: 55px;">
    <div class="container">
        <div class="mk-text">
            <h4>留言地</h4><!--  留言间的留言字数要限定-->
        </div>
        <div class="advantag-main">

            <div class="col-md-4 fact-grid mainbox" style="margin-left: 10px;">
                <div class="col-md-12 advantag">
                    <h4><a href="single.jsp">There are variations passage</a></h4>
                    <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            
            <div class="col-md-4 fact-grid mainbox">
                <div class="col-md-12 advantag">
                    <h4><a href="single.jsp">There are variations passage</a></h4>
                    <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            
            <div class="col-md-4 fact-grid mainbox">
                <div class="col-md-12 advantag">
                    <h4><a href="single.jsp">There are variations passage</a></h4>
                    <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete</p>
                </div>
                <div class="clearfix"> </div>
            </div>

            <div class="clearfix"> </div>


            <div class="col-md-4 fact-grid mainbox" style="margin-top: 20px;margin-left: 10px;">
                <div class="col-md-12 advantag">
                    <h4><a href="single.jsp">There are variations passage</a></h4>
                    <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-4 fact-grid mainbox" style="margin-top: 20px;">
                <div class="col-md-12 advantag">
                    <h4><a href="single.jsp">There are variations passage</a></h4>
                    <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-4 fact-grid mainbox" style="margin-top: 20px;">
                <div class="col-md-12 advantag">
                    <h4><a href="single.jsp">There are variations passage</a></h4>
                    <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>

<!--footer start here-->
<div class="footer">
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