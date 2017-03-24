<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/font-awesome.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<style type="text/css">
        .login{
            border: 1px solid #a6192e;
            border-radius: 10px;
            -moz-border-radius: 10px;
            width: 500px;
            height: 400px;
            background: #a6192e;
            position: fixed;
            left: 50%;
            top: 50%;
            margin-top: -200px;
            margin-left: -250px;
        }

        .circles2 {
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
        .login-top-back{
            border-radius: 10px;
            -moz-border-radius: 10px;
            width: 100%;
            background-color: #a6192e;
            height: 8%;
        }
        .login-left{
            width: 60%;
            background-color: #ffffff;
            height: 92%;
            float: left;
        }
        .login-right {
            width: 40%;
            background-color: #ffffff;
            height: 92%;
            float: right;
        }

        .login-left-text{
            display: inline;
            color: #000000;
            font-size: 17px;
            font-family: "Calibri";
        }
        .login-info{
            padding-left: 40px;
            font-family: "Calibri";
            font-size: 17px;
            height: 32px;
            width: 73%;
            border-radius: 5px;
            -moz-border-radius: 5px;
            border: 1px solid;
            margin-bottom: 20px;
        }
        .login-user{
            position: relative;
            left: 35px;
            top: 0px;
            font-size: 20px;
        }
        .login-left-top{
            margin-bottom: 20px;
            margin-top: 30px;
            text-align: center;
        }
        .login-left-content{
            text-align: center;
        }
        .problem2{
            margin-right: 30px;
            margin-top: 10px;;
            font-size: 12px;
            float: right;
            color: black;
        }
        .login-button{
            background-color: #a6192e;
            margin-top: 20px;
            width: 80%;
            border-radius: 5px;
            -moz-border-radius: 5px;
            border: 1px solid #a6192e;
            height: 35px;
            color:white;
        }
        .login-sign{
            margin-left: 30px;
            margin-top: 40px;
            color:white;
        }
        .qq{
            margin-top: 24px;
            text-align: center;
        }

        a{
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
            text-decoration: none;
            color:black;
        }

        .qq-img{
            font-size: 25px;
        }
        .qq-text{
            font-size: 12px;
            text-decoration: none;
        }
    </style>

</head>
<body>
<!-- <form action="userLogin" method="post">
		
        用户名：<input type="text" name="username" placeholder="e-mail/phone/username"><br>
        密码：<input type="password" name="password" placeholder="password"><br>
        认证码：<input type="text" name="checkcode">
         <img src="ValidateCode" onclick="change(this)" alt="换一张"  style="cursor:pointer">
         <a href="login.html">看不清，换一张</a><br>
   <input type="submit" value="登录">  
	</form> -->
	
	<form action="userLogin" method="post">
    <div class="login">

        <!--<div class="circles2">X</div>-->

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
                    <a href="login.jsp" style="font-size: 12px;">看不清，换一张</a> 
                </div>

               <!--  <div>
                    <span class="problem2"><a href="loginHelp.jsp" style="color: #a6192e;">Have problems with LoginIn</a></span>
                </div> -->

                <div>
                    <input class="login-button" type="submit" value="Login In"/>
                </div>

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
                <a href="sign.jsp"><input class="login-button login-sign" style="width: 70%" type="button" value="Sign In"/></a>
            </div>
        </div>
    </div>
</form>
	
	
	
	<script type="text/javascript">
		//验证码的图片切换
		function change(img) {
			img.src = img.src + "?" + new Date().getTime();
		}
	</script>
</body>
</html>