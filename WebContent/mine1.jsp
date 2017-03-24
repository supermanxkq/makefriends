<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="njxzc.bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>mine1</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/css1.css">

<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/font-awesome.min.css" />

<style type="text/css">
.mine-text {
	text-align: center;
	margin: 0 auto;
	margin-top: 50px;
}

.main-bottom {
	width: 100%;
	background: #a6192e;
	height: 50px;
	margin-bottom: 10px;
}
</style>

</head>

<body>
	<!--header start here-->
	<div class="header">
		<div class="container">
			<div class="header-main">
				<div class="head-right">
					<div class="top-nav">
						<span class="menu"> <img src="images/icon.png" alt="" /> </span>
						<ul class="res">
							<li><a href="indexContent.jsp">首页</a></li>
							<li><a href="makeFriends.jsp">交友点</a></li>
							<li><a href="result.jsp">成果墙</a></li>
							<li><a href="mine1.jsp" class="active">我的</a></li>
							<li><a href="about.jsp" >关于我们</a></li>
							<!--<li><a href="contact.html">联系</a></li>-->
							<div class="clearfix"></div>
						</ul>
						<!-- script-for-menu -->
						<script>
							$("span.menu").click(function() {
								$("ul.res").slideToggle(300, function() {
									// Animation complete.
								});
							});
						</script>
						<!-- /script-for-menu -->
					</div>
					<div class="search-box">
						<div id="sb-search" class="sb-search">
							<form>
								<input class="sb-search-input" placeholder="Search"
									type="search" name="search" id="search"> <input
									class="sb-search-submit" type="submit" value=""> <span
									class="sb-icon-search"> </span>
							</form>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--header end here-->


	<div class="head">
		<div class="look">浏览数：</div>
		<div class="photo">
			<img src="img/touxiang.jpg" height="80px" width="80px">
		</div>
		<br /> <br /> <br />
		<%
								String username = (String)session.getAttribute("username");
								String dbDriver = "com.mysql.jdbc.Driver";
								String url = "jdbc:mysql://localhost:3306/makefriends?useUnicode=true&characterEncoding=utf-8";
								String name = "root";
								String password = "960107";
								Class.forName(dbDriver);
								Connection connection = null;
								Statement stmt = null;

								ResultSet rs = null;

								Class.forName(dbDriver);
								connection = DriverManager.getConnection(url, name, password);
								stmt = connection.createStatement();
								String sqlname = "select password,myType,desType,sex,academy,profession,birthday,height,province,city,grade,introduction from user where username="+"\""+username+"\"";
								System.out.print(sqlname);
								rs = stmt.executeQuery(sqlname);
								while (rs.next()) {
								System.out.print(rs.getString(12));
										
							    %>
		<div class="username">
			<%=session.getAttribute("username") %>
		</div>
		<br />

	</div>
	<!-- head end -->
	<div class="menu">

		<div id="Tab1">
			<div class="Menubox">
				<ul>
					<li id="one1" onClick="setTab('one',1,4)" class="hover">我的主页</li>
					<li id="one2" onClick="setTab('one',2,4)">我的相册</li>
					<li id="one3" onClick="setTab('one',3,4)">交友记录</li>
					<li id="one4" onClick="setTab('one',4,4)">完善资料</li>

				</ul>
			</div>
			<!-- Menubox end! -->

			<div class="Contentbox">
				<div id="con_one_1" class="hover">
					<div>
						<p style="float:left">发布新动态:</p>
					</div>
					<input type="text" class="trend3"> <input type="submit"
						class="submit">
					<div>
						<input type="text" class="trend1" name="trend1" value="已有动态1"
							readonly="readonly">
						<div class="t">
							<span class="zan"> <input type="image" src="img/zan.png"
								height="25px"> </span> <span class="pinglun"> <input
								type="image" src="img/pinglun.png" height="25px"> </span> <font
								class="count_of_zan">5</font>
						</div>
					</div>
					<br /> <br /> <br />
					<div>
						<input type="text" class="trend2" name="trend2" value="已有动态2"
							readonly="readonly">
						<div class="t">
							<span class="zan"> <input type="image" src="img/zan.png"
								height="25px"> </span> <span class="pinglun"> <input
								type="image" src="img/pinglun.png" height="25px"> </span> <font
								class="count_of_zan">5</font>
						</div>
					</div>
				</div>
				<!-- con_one_1 end! -->


				<div id="con_one_2" style="display:none">
					<div class="text">我的相册</div>
					<div class="photos">
						<div>
							<img src="img/touxiang.jpg" height="200px" width="200px">
							<img src="img/touxiang.jpg" height="200px" width="200px">
							<img src="img/touxiang.jpg" height="200px" width="200px">
						</div>
						<br/>
						<div>
							<!-- <span><img src="img/touxiang.jpg" height="200px" width="200px"></span>
							<span><img src="img/touxiang.jpg" height="200px" width="200px"></span> -->
							<span><input type="button" value="+" style="width:120px;height:120px;font-size:80px;"></span>
						</div>
						<!-- <div><input type="button" value="+" class="add_photo"></div> -->
					</div>
				</div>
				<!-- con_one_2 end! -->

				<div id="con_one_3" style="display:none">
					<hr color="grey">
					<div class="con_one_3_bellow">

						<div class="bellow_1">
							<span>当前在线好友人数： </span><br> <br>
							<div class="intype">
								<input type="text" name="perNum" value="0" readonly="readonly">
							</div>
						</div>
						<div class="bellow_2">
							<span>谁看过我:</span><br> <br>
							<div class="intype">
								<input type="text" value="A" name="nume" readonly="readonly">
							</div>
						</div>
						<div class="bellow_3">
							<span>我看过谁:</span><br> <br>
							<div class="intype">
								<input type="text" value="A" name="nume" readonly="readonly">
							</div>
						</div>
						<div class="bellow_4">
							<span>谁赞过我:</span><br> <br>
							<div class="intype">
								<input type="text" value="A" name="nume" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
				<div id="con_one_4" style="display:none">
					<div class="con_one_4_bellow" align="center'">
						<div class="bellow_4_1">
							<span>为保证材料真实有效，灰色字体信息不得随意修改哦</span>
						</div>

						<div class="bellow_4_2">
							<form action="modify" method="post">
								<table border="2" class="person_info" align="center">
								
									<tr>
										<td><span>昵称：</span></td>
										<td><input type="text" name="name" class="username-text" style="font-size: 15px;"
											value=<%=session.getAttribute("username") %> disabled="disabled">
										</td>
										
									</tr>

									<tr>
										<td><span>密码：</span></td>
										<td><input type="password" name="password"
											value=<%=rs.getString(1) %> disabled="disabled"></td>
										
									</tr>

									<tr>
										<td><span>我的类型：</span></td>
										<td><input type="text" name="myType"
											value=<%=rs.getString(2) %> disabled="disabled"></td>
										
									</tr>

									<tr>
										<td><span>目标类型：</span></td>
										<td><input type="text" name="desType"
											value=<%=rs.getString(3) %> disabled="disabled"></td>
										
									</tr>

									<tr>
										<td><span>性别：</span></td>
										<td><input type="text" name="sex" value=<%=rs.getString(4) %> disabled="disabled">
										</td>
										

									</tr>

									<tr>
										<td><span>学院：</span></td>
										<td><input type="text" name="academy"
											value=<%=rs.getString(5) %> disabled="disabled"></td>
										
									</tr>

									<tr>
										<td><span>专业：</span></td>
										<td><input type="text" name="profession"
											value=<%=rs.getString(6) %> disabled="disabled"></td>
										
									</tr>

									<tr>
										<td><span>出生年月:</span></td>
										<td><input type="text" name="birthday"
											value=<%=rs.getString(7) %> disabled="disabled"></td>
										
									</tr>

									<tr>
										<td><span>身高:</span></td>
										<td><input type="text" name="height"
											value=<%=rs.getString(8) %> disabled="disabled"></td>
										
									</tr>

									<tr>
										<td><span>所在省：</span></td>
										<td><input type="text" name="province"
											value=<%=rs.getString(9) %> disabled="disabled"></td>
										
									</tr>

									<tr>
										<td><span>所在市：</span></td>
										<td><input type="text" name="city"
											value=<%=rs.getString(10) %> disabled="disabled"></td>
										
									</tr>

									<tr>
										<td><span>年级：</span></td>
										<td><input type="text" name="grade"
											value=<%=rs.getString(11) %> disabled="disabled"></td>
										
									</tr>

									<tr>
										<td><span>介绍：</span></td>
										<td><input type="text" name="introduction" maxlength="100"
											value=<%=rs.getString(12).replace(" ","&nbsp;") %> disabled></td>
										
									</tr>

									
									<tr>
										<td colspan="2" align="center"><button>修改</button><input type="submit"
											value="保存"></td>
									</tr>
									<% } %>
								</table>
							</form>
						</div>
					</div>
					<!-- Contentbox end! -->
				</div>
				<!-- Tab1 end! -->
			</div>
			<!-- menu end -->

			<!-- <div class="footer">
				<div class="foot1">
					<br /> <br />
					<p>Copyright &copy; 2016.南京晓庄学院交友网</p>
				</div>
			</div> -->
		</div>
	</div>
	<!--footer start here-->
	<div class="footer">

		<div class="copyright">
			<div class="container">
				<div class="copy-main">
					<div class="copy-left">
						<ul>
							<li><a class="active" href="index.jsp">Home</a>
							</li>
							<li><a href="about.jsp">About</a>
							</li>
							<li><a href="about.jsp">Portfolio</a>
							</li>
							<li><a href="blog.jsp">Blog</a>
							</li>
							<li><a href="contact.jsp">Contact</a>
							</li>
						</ul>
					</div>
					<div class="copy-right">
						<p>Copyright &copy; 2016.南京晓庄学院</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--footer end her-->
</body>
</html>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script>
	$(function() {
		$(".loginB").click(function() {
			$(".bg, .login").slideDown();
		})
		$(".clickHight").click(function() {
			$(".bg, .login").slideUp();
		})

	})

	$(function() {
		$(".loginB").click(function() {
			$(".bg, .login").slideDown();
		})
		$(".clickTel").click(function() {
			$(".bg, .login").slideUp();
		})

	})

	$(function() {
		$(".loginB").click(function() {
			$(".bg, .login").slideDown();
		})

		$(".circles").click(function() {
			$(".bg, .login").slideUp();
		})

		$(".clickName").click(function() {
			$(".bg, .login").slideUp();
		})

	})
	function setTab(name, cursel, n) {
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById("con_" + name + "_" + i);
			menu.className = i == cursel ? "hover" : "";
			con.style.display = i == cursel ? "block" : "none";
		}
	}
	
	$(function(){
    var disabled = true;
    $('button').click(function(){
        $('input[type="text"]').removeAttr('disabled');   
        $('input[type="password"]').removeAttr('disabled'); 
        $(".username-text").attr("readonly","readonly");
        return false;
    });
});
</script>
