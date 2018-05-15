<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=0.95, user-scalable=no" />

<title>登录</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/template/ue-content/templates/images/ue_grid.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/template/ue-content/templates/images/style.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/template/ue-content/templates/css/style.css" />


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.login.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/ajaxfileupload.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/camera.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.7.2.min.js"></script>

<script language="javascript"
	src="${pageContext.request.contextPath }/js/jquery.easing.min.js"></script>

<script language="javascript"
	src="${pageContext.request.contextPath }/js/custom.js"></script>

<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"
	type="text/javascript" charset="utf-8"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/camera.js"></script>

<style type="text/css">
#camera_errbox {
	width: 320px;
	height: auto;
	border: 1px solid #333333;
	padding: 10px;
	color: #000;
	text-align: left;
	margin: 20px auto;
	font-size: 14px;
}

#loginalert {
	width: 500px;
	background: url(${pageContext.request.contextPath }/img/loginBG.jpg);
}

#camera_errbox b {
	padding-bottom: 15px;
}

#f1 {
	font-style: normal;
	color: #000000;
	font-size: large;
}

.pd97 {
	padding-left: 25px;
	padding-bottom: 25px;
}

.borderstyle {
	/*-webkit-box-shadow: 0 0 5px 3px rgba(255, 0, 0, .6), 0 0 5px 6px rgba(105, 232, 241, .6), 0 0 5px 10px rgba(255, 255, 0, .6);
				-moz-box-shadow: 0 0 5px 3px rgba(255, 0, 0, .6), 0 0 5px 6px rgba(105, 232, 241, .6), 0 0 5px 10px rgba(255, 255, 0, .6);
				-ms-box-shadow: 0 0 5px 3px rgba(255, 0, 0, .6), 0 0 5px 6px rgba(105, 232, 241, .6), 0 0 5px 10px rgba(255, 255, 0, .6);
				-o-box-shadow: 0 0 5px 3px rgba(255, 0, 0, .6), 0 0 5px 6px rgba(105, 232, 241, .6), 0 0 5px 10px rgba(255, 255, 0, .6);
				box-shadow: 0 0 5px 3px rgba(255, 0, 0, .6), 0 0 5px 6px rgba(105, 232, 241, .6), 0 0 5px 10px rgba(255, 255, 0, .6);*/
	-webkit-box-shadow: 0 0 10px rgba(0, 204, 204, .5);
	-moz-box-shadow: 0 0 10px rgba(0, 204, 204, .5);
	box-shadow: 0 0 10px rgba(0, 204, 204, .5);
}

#canvas {
	/* float: left; */
	margin-left: 20px;
}

#media span {
	margin-left: 50px;
}

#media {
	width: 800px;
	margin: 0 auto;
}

#btn {
	width: 200px;
	margin: 20px auto;
}
</style>
<!-- 鼠标移出事件 -->
<script type="text/javascript">
	function ajaxExce() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var usernameReg=new RegExp("^[0-9]{1,11}$");
		var passwordReg=new RegExp("^[A-Za-z0-9]{1,30}$");
		//alert(username.value);
		if (username == "") {
			// 用户名非空验证
			$("#login_warning").html("<font color='red'>用户名不能为空！</font>");
			return false;
		} else if(password == ""){
			// 密码非空验证
			$("#login_warning").html("<font color='red'>密码不能为空！</font>");
			return false;
		} else if(!usernameReg.test(username)){
			// 用户名数字验证
			$("#login_warning").html("<font color='red'>不合法用户名！</font>");
			return false;
		} else if(!passwordReg.test(password)){
			// 密码合法验证（字母、数字、下划线）
			$("#login_warning").html("<font color='red'>不合法密码！</font>");
			return false;
		} 
		$.ajax({
			method : "POST",
			url : "${pageContext.request.contextPath }/UserController/checkUserID.action",
			data : {
				username : username
			}
		}).done(function(msg) {
			var jsonObj = JSON.parse(msg);
			if (jsonObj == true) {
				$("#login_warning").html("<font color='red'></font>");
				return true;
			} else {
				$("#login_warning").html("<font color='red'>用户名不存在！</font>");
				return false;
			}
		});
		
	}
</script>
<!-- 登录验证 -->
<script type="text/javascript">
	function check() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var usernameReg=new RegExp("^[0-9]{1,11}$");
		var passwordReg=new RegExp("^[A-Za-z0-9]{1,30}$");
		//alert(username.value);
		if (username == "") {
			// 用户名非空验证
			$("#login_warning").html("<font color='red'>用户名不能为空！</font>");
			return false;
		} else if(password == ""){
			// 密码非空验证
			$("#login_warning").html("<font color='red'>密码不能为空！</font>");
			return false;
		} else if(!usernameReg.test(username)){
			// 用户名数字验证
			$("#login_warning").html("<font color='red'>不合法用户名！</font>");
			return false;
		} else if(!passwordReg.test(password)){
			// 密码合法验证（字母、数字、下划线）
			$("#login_warning").html("<font color='red'>不合法密码！</font>");
			return false;
		} 
		
		
		$.ajax({
			method : "POST",
			url : "${pageContext.request.contextPath }/UserController/checkUserID.action",
			data : {
				username : username
			}
		}).done(function(msg) {
			var jsonObj = JSON.parse(msg);
			if (jsonObj == true) {
				$("#login_warning").html("<font color='red'></font>");
				return true;
			} else {
				$("#login_warning").html("<font color='red'>用户名不存在！</font>");
				return false;
			}
		});
		
		return true;
	};
</script>
<!-- 获取焦点自动清除提示内容  -->
<script type="text/javascript">
function func(){
	//alert("fuck");
	$("#login_warning").html("");
}
</script>
<!-- 获取焦点自动清除提示信息  -->
<script type="text/javascript">
function clearWarning(){
	//alert("fuck");
	$("#login_warning").html("");
}
</script>
<!-- 异步登录 -->
<script type="text/javascript">
	function login(){
		//alert("ffffffffff");
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		$.ajax({
			method : "POST",
			url : "${pageContext.request.contextPath }/UserController/accountLogin.action",
			data : {
				username : username,
				password : password
			}
		}).done(function(msg) {
			var jsonObj = JSON.parse(msg);
			if (jsonObj == false) {
				$("#login_warning").html("<font color='red'>密码错误！</font>");
			} else {
				//alert("登录成功！");
				window.location.href="${pageContext.request.contextPath }/jsp/homePage.jsp"
			}
		});
	}
</script>
<!-- 刷脸登录 -->
<script type="text/javascript">
	function convertCanvasToImage() {
		var pic = document.getElementById("canvas").toDataURL("image/png");
		pic = pic.replace(/^data:image\/(png|jpg);base64,/, "");
		//alert("666");
		$.ajaxFileUpload({
			url : 'FaceServlet',
			//fileElementId:'canvas',
			data : {
				imageData : pic
			},
			dataType : 'JSON',
			success : function(data, status) {
				
				var result = data.toString().substr(5, data.length - 11);
				//alert(','+$.trim(result)+',');
				if($.trim(result) == "true"){
					//alert("aa");
					window.location.href="${pageContext.request.contextPath }/jsp/homePage.jsp"
				}else{
					$("#face_warning").html("<font color='red'>登录失败！</font>");
				}
				
			},
			error : function(data, status, e) {
				//alert("验证失败...data:" + data + ",status:" + status + ",e:" + e);
				alert("服务器响应失败处理函数或处理后台返回数据错误");
			}
		});
	}
</script>	
</head>
<body style="padding-top:90px;background: url(${pageContext.request.contextPath }/img/loginBG.jpg); background-repeat: no-repeat;"
	onLoad="init(this)" oncontextmenu="return false"
	onselectstart="return false">

	<div id="header">
		<div class="common">
			<div class="login fr">
				<div class="loginmenu">
					<a title="登录或注册"></a>
				</div>
				<div class="pd59">
					<ul>
						<li class="openlogin"><a href="#" onclick="return false;"
							style="width: 100px; font-size: 18px; color: black; margin-right: 5px; background-color: rgb(255, 102, 0);">用户登录</a></li>
						<li class="reg"><a href="#" onclick="return false;"
							style="width: 100px; font-size: 18px; color: black;">刷脸登录</a></li>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<div class="clear"></div>

	<div class="loginmask"></div>
	<div id="loginalert">
		<div class="pd20 loginpd">
			<h3>
				<i class="closealert fr"></i>
				<div class="clear"></div>
			</h3>
			<div class="loginwrap">
				<div class="loginh">
					<div class="fl">用户登录</div>
					<div class="clear"></div>
				</div>
				<h3>
					<span></span> <span class="" name="login_warning"
						id="login_warning"></span>
					<div class="clear"></div>
				</h3>
				<div class="clear"></div>

				<!--登录表单 -->
				<form action="javascript:login();" method="post" id="login_form"
					onsubmit="">
					<div class="logininput">
						<input type="text" name="username" id="username"
							class="loginusername" placeholder="数字用户名" onblur="ajaxExce()" onfocus="clearWarning()"/> 
						<input type="password" name="password" id="password"
							class="loginuserpasswordt" placeholder="密码" onblur="ajaxExce()" onfocus="clearWarning()"/> 
						
						<input type="password" name="password" id="password"
							class="loginuserpasswordp" style="display: none" />

					</div>
					<div class="loginbtn">
						<div class="loginsubmit fl">

							<div class="controls">
								<button class="btn btn-success" onclick="return check()">登录</button>
							</div>
							<div class="loginsubmiting">
								<div class="loginsubmiting_inner"></div>
							</div>
						</div>
						<!--<div class="logcheckbox fl">
								<input id="bcdl" type="checkbox" checked="true" /> 保持登录
							</div>-->

						<!-- 忘记密码 -->
						<!-- <div class="fr">
							<a href="users/modify_pwd.jsp"><span
								style="font-family: '微软雅黑'; font-size: medium;">忘记密码？</span></a>
						</div>
						<div class="clear"></div> -->
					</div>
				</form>
			</div>
		</div>

		<!--第三方登录-->
		<div class="thirdlogin">
			<div class="pd50">
				<div class="pd97">
					<font id="f1">用第三方帐号直接登录</font>
				</div>

				<ul>
					<li id="sinal"><a href="#">微博账号登录</a></li>
					<li id="qql"><a href="#">QQ账号登录</a></li>
					<div class="clear"></div>
				</ul>
				<div class="clear"></div>
			</div>
		</div>
	</div>

	<!--刷脸登录-->
	<div id="reg_setp"
		style="background: url(${pageContext.request.contextPath }/img/1.jpg);">
		<div class="back_setp">返回</div>
		<div class="blogo"></div>

		<div id="setp_quicklogin">
			<span class="" name="face_warning" id="face_warning">&nbsp;</span>
			<div id="media">
				<!-- 摄像头 -->
				<video id="navy_video" width="320px" height="240px" autoplay
					class="borderstyle"> </video>

				<!-- 拍照预览 -->
				<span>预览</span>
				<canvas id="canvas" width="240px" height="180px" class="borderstyle">
				</canvas>

			</div>

			<div id="btn">
				<input id="snap" type="button" class="btn btn-info" value="拍照" />
				<button type="button" class="btn btn-info"
					onclick="javascript:convertCanvasToImage()">登录</button>
			</div>

			<!-- 获取电脑摄像头失败提示 -->
			<div id="camera_errbox">
				<b>请点击“允许”按钮，授权网页访问您的摄像头！</b>
				<div>若您并未看到任何授权提示，则表示您的浏览器不支持Media Capture或您的机器没有连接摄像头设备。</div>
			</div>

		</div>
	</div>
</body>
</html>