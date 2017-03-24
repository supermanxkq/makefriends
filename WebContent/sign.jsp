<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.11.0.min.js"></script>
<title>注册</title>

</head>
<body>
<div class="sign" style="display: block;width:600px;height:450px;">

    <!-- <div class="circles" style="margin-top: -4px;">X</div> -->

    <div class="sign-top-back" style="width: 620px;"></div>

	 <div class="sign-top-text" style="margin-top: 10px;">
          <span class="sign-left-text" >注册信息</span>
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