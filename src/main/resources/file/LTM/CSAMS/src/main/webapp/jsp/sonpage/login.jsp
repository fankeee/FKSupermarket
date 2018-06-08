<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta charset="utf-8" />
	<title>桂林理工大学管理系统</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
	<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js"type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath }/jsp/js/gVerify.js"></script>
	<style type="text/css">
* {
	font-family: "微软雅黑";
	letter-spacing: 2px;
}

#container {
	
}

#div-bgimg {
	width: 100%;
	height: 100%;
	z-index: -1;
	position: absolute;
	left: 0px;
}

#bgimg {
	width: 100%;
	height: 100%;
}

#header {
	height: 200px;
}

#footer {
	height: 165px;
}

#main {
	height: 366px;
}

#main-login {
	border-radius: 3px;
	background-color: rgba(255, 275, 255, .85);
	box-shadow: 7px 7px 10px -3px white;
}

#form1 {
	height: 280px;
}

#text-account {
	text-indent: 10px;
	width: 60%;
	height: 35px;
	margin: 0px auto;
	position: relative;
	top: 25px;
}

#text-password {
	text-indent: 10px;
	width: 60%;
	height: 35px;
	margin: 0px auto;
	position: relative;
	top: 40px;
}

#warn {
	text-indent: 10px;
	width: 70%;
	height: 20px;
	text-align:center;
	float:left;
	margin: 0px auto;
	position: absolute;
	top: 276px;
	left:17%;
}

#code_input {
	text-indent: 10px;
	width: 30%;
	height: 35px;
	/* margin: 0px auto; */
	position: relative;
	top: 56px;
	left: 50%;
}

#st1 {
	margin-left: 82px;
}

#btn-submit {
	width: 20%;
	height: 30px;
	font-size: 15px;
	font-weight: bold;
	color: white;
	background-color: #2E363F;
	position: relative;
	left: 10%;
	top: 65px;
	margin-left: 58px;
}

#btn-login {
	width: 20%;
	height: 30px;
	font-size: 15px;
	font-weight: bold;
	color: white;
	background-color: #2E363F;
	position: relative;
	left: 8%;
	top: 65px;
	margin-left: 58px;
}

#title {
	text-align: center;
	padding-top: 15px;
	color: #2E363F;
	font-weight: bold;
}

#bigtitle {
	font-family: "隶书";
	letter-spacing: 10px;
	padding: 80px;
	display: block;
	margin: 0px auto;
	text-align: center;
	font-size: 90px;
	font-weight: bold;
	color: white;
	text-shadow: 3px 3px 5px #262626;
}

#mark {
	float: right;
	position: relative;
	top: 135px;
	text-shadow: 1px 1px 1px #262626;
	color: #228ADA;
}
</style>
</head>

<body>

	<div class="container-fluid" id="container">
		<div id="div-bgimg">
			<img src="${pageContext.request.contextPath }/jsp/img/timg1.jpg"
				id="bgimg" />
		</div>
		<div class="row-fluid">
			<div class="span12" id="header">
				<span id="bigtitle"> 社团管理系统 </span>
			</div>
		</div>
		<div class="row-fluid" id="main">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div id="main-login">
					<h1 id="title">登录</h1>
					<form id="form1">

						<select id="st1">
							<option >请选择</option>
							<option value="3">普通用户</option>
							<option value="1">社团管理员</option>
							<option value="2">系统管理员</option>
						</select> <span id=""> 请选择用户类型 </span> <input type="text"
							class="input-group" name="text-account" id="text-account"
							onfocus="clearWarning()" placeholder="请输入账号" /> <input
							type="password" class="input-group" name="text-password"
							id="text-password" onfocus="clearWarning()" placeholder="请输入密码" />
						<input type="text" class="input-group" name="code_input"
							id="code_input" onfocus="clearWarning()" placeholder="请输入验证码" />
						<div id="v_container"
							style="width: 110px; height: 45px; padding-top: 13px; padding-left: 78px"></div>
						<span id="warn" style="color: red"></span> 
						<input type="button" id="btn-submit" class="btn" onclick="login()" value="登录" />
						<a href="regist.jsp"><input type="button" class="btn" id="btn-login" value="注册" /></a>
					</form>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

</body>

<script>
		var verifyCode = new GVerify("v_container");
		//登陆验证
		function login(){
			var num=$("#text-account").val();//学号
			var pwd=$("#text-password").val();//密码
			var options=$("#st1 option:selected"); 
			var myselect=options.val();//拿到选中项的值
			var myselect1=options.text(); //拿到选中项的文本
			var res = verifyCode.validate(document.getElementById("code_input").value);
			if(num == null || num == ""){
				//alert("请输入账号密码！");
				$("#warn").html("请输入账号！");
			}else if(pwd == null || pwd == ""){
				$("#warn").html("请输入密码！");
			}else{
				//系统管理员
				if(res){
					if(myselect == "2"){
						//ajax
						$.ajax({
							method:"POST",
							url: "${pageContext.request.contextPath }/Manager/findManagerByNum.action",
							data: { num : num, pwd:pwd }	
						}).done(function(msg){
							var jsonObj = JSON.parse(msg);
							if(msg){
								window.location.href = "${pageContext.request.contextPath }/Activity/show.action";
							}else{
								//登陆失败
								$("#warn").html("账号不存在或密码错误，请重新输入！");
							}	
						})
					}else if(myselect == "1"){
						//社团管理员
						$.ajax({
							method:"POST",
							url: "${pageContext.request.contextPath }/Community/findCommunityByNum.action",
							data: { num : num, pwd:pwd }	
						}).done(function(msg){
							var jsonObj = JSON.parse(msg);
							if(msg){
								window.location.href = "${pageContext.request.contextPath }/Activity/show.action";
							}else{
								//登陆失败
								$("#warn").html("账号不存在或密码错误，请重新输入！");
							}
							
						})
					}else{
						//普通用户
						$.ajax({
							method:"POST",
							url: "${pageContext.request.contextPath }/Member/findMemberByNum.action",
							data: { num : num, pwd:pwd }	
						}).done(function(msg){
							var jsonObj = JSON.parse(msg);
							if(msg){
								window.location.href = "${pageContext.request.contextPath }/Activity/show.action";
							}else{
								//登陆失败
								$("#warn").html("账号不存在或密码错误，请重新输入！");
							}
							
						})
					}
				}else{
					//验证码不正确，重新输入
					//alert("验证码输入错误，请重新输入！");
					$("#warn").html("<font color='red'>请输入验证码！</font>");
					$("#code_input").val("");
				}
			}
			
			
			
		}
	</script>

	<!-- 获取焦点自动清除提示信息  -->
	<script type="text/javascript">
		function clearWarning(){
		//alert("fuck");
		$("#warn").html("");
	}
	</script>

</html>