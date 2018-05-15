<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html;  charset="UTF-8">
		<title>修改密码</title>
		<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />--%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/metro.min.css" />
		<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script> 
		<style type="text/css">
			* {
				font-family: "微软雅黑";
			}
			
			#content {
				width: 301px;
				margin: 0px auto;
			}
			
			#btn-submit {
				margin: 0px;
				padding: 0px;
				width: 100px;
				height: 32px;
				letter-spacing: 3px;
				font-weight: bold;
				background-color: #2E363F;
				color: white;
				font-size: 15px;
				float: right;
			}
			#bigtitle {
				letter-spacing: 10px;
				display: block;
				margin: 0px auto;
				text-align: center;
				font-size: 30px;
				margin-top: 30px;
				font-weight: bold;
				color: #2E363F;
			}
			.simple-text {
				margin: 0px;
				padding: 0px;
				width: 300px;
				height: 32px;
				margin-top: 7px;
				margin-bottom: 20px;
				font-size: 14px;
				letter-spacing: 1px;
				text-indent: 10px;
			}
			
			form {
				color: #009587;
				font-size: 16px;
				margin-top:45px;
			}
		</style>
		<script type="text/javascript">
		</script>
	</head>
<script type="text/javascript">
function check() {
	 //获取原密码
	 var pwd=document.getElementById("pwd").value;
	 //输入的原密码
	 var old=document.getElementById("oldPassword").value;
	 //输入的新密码
	 var news=document.getElementById("newPassword").value;
	 //确认密码
	 var rep=document.getElementById("repeatPassword").value;
	 var s=document.getElementById("s1");
	 
	 //输入的密码与旧密码一样
	if (pwd==old){
		//旧密码与新密码不能一样
		if (old!=news) {
			//新密码与确认密码要一样
			if(news==rep) {
			    return true; 	
			}	
		}
	}else{
		
		alert("密码修改失败!");
		return false;
	}
	 
	}

</script>
	<body>
		<div id="content">
			<div class="span12" id="header">
					<span id="bigtitle">
						修改密码
					</span>
			</div>
			
			<form action="${pageContext.request.contextPath }/user/modifyPassword.action" method="post" class="form-control">
				<table border="0" cellspacing="0" cellpadding="0">
					登录名：
					<br /><input type="text" name="username" id="username" class="simple-text" placeholder="请输入" value="${user.u_name }" readonly /><br />
					 原密码：
					<br /><input type="password" name="oldPassword" id="oldPassword" class="simple-text"" value=""/><br />
					新密码：
					<br /><input type="password" name="newPassword" id="newPassword" class="simple-text" placeholder="请输入新密码" value="" /><br /> 
					确认密码：
					<br /><input type="password" name="repeatPassword" id="repeatPassword" class="simple-text" placeholder="请再此输入新密码：" value="" /><br />
				    <br /><input type="hidden" name="pwd" id="pwd" class="simple-text"  value="${user.u_pwd }" /><br /> 
				    <br /><span id="s1"></span>
				</table>
			    <input type="submit" id="btn-submit" value="提交" onclick="return check()"/>
			</form>
		</div>
	</body>

</html>