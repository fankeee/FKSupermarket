<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8">
		<title>个人设置</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/ss/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
		<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
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
			
			#spanId {
				margin: 0px;
				padding: 0px;
				width: 300px;
				height: 32px;
				text-align: center;
				float:left;
				margin-top: 30px;
				margin-bottom: 10px;
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
			
			function checkPwd(){
				var num=$("#num").val();
				var oldPwd=$("#oldPwd").val();
				var newPwd=$("#newPwd").val();
				var rePwd=$("#rePwd").val();
				var role=${role};//1:社团联系人，2：系统管理员
				if(oldPwd == null || oldPwd==''){
					$("#spanId").html("请输入密码！");
				}else if(newPwd == null || newPwd==''){
					$("#spanId").html("请输入新密码！");
				}else if(rePwd == null || rePwd==''){
					$("#spanId").html("请再次确认密码！");
				}else if(newPwd != rePwd){
					$("#spanId").html("两次密码不一致，请重新确认！");
					$("#rePwd").val("");
				}else{
					//社团联系人修改密码
					if(role == "2"){
						$.ajax({
							method:"post",
							url:"${pageContext.request.contextPath }/Manager/updateManagerPwd.action",
							data:{num:num, oldPwd:oldPwd, newPwd:newPwd}
						}).done(function(msg){
							var jsonObj = JSON.parse(msg);
							if(msg){
								alert("修改密码成功！");
								var oldPwd=$("#oldPwd").val("");
								var newPwd=$("#newPwd").val("");
								var rePwd=$("#rePwd").val("");
							}else{
								alert("修改密码失败！");
								$("#oldPwd").val("");
								$("#newPwd").val("");
								("#rePwd").val("");
							}
						})
					}else if(role == "1"){
						$.ajax({
							method:"post",
							url:"${pageContext.request.contextPath }/Admin/updateAdminPwd.action",
							data:{num:num, oldPwd:oldPwd, newPwd:newPwd}
						}).done(function(msg){
							var jsonObj = JSON.parse(msg);
							if(msg){
								alert("修改密码成功！");
								var oldPwd=$("#oldPwd").val("");
								var newPwd=$("#newPwd").val("");
								var rePwd=$("#rePwd").val("");
							}else{
								alert("修改密码失败！");
								$("#oldPwd").val("");
								$("#newPwd").val("");
								("#rePwd").val("");
							}
						})
					}else{
						$.ajax({
							method:"post",
							url:"${pageContext.request.contextPath }/Member/updateMemberPwd.action",
							data:{num:num, oldPwd:oldPwd, newPwd:newPwd}
						}).done(function(msg){
							var jsonObj = JSON.parse(msg);
							if(jsonObj){
								alert("修改密码成功！");
								var oldPwd=$("#oldPwd").val("");
								var newPwd=$("#newPwd").val("");
								var rePwd=$("#rePwd").val("");
							}else{
								alert("修改密码失败！");
								$("#oldPwd").val("");
								$("#newPwd").val("");
								("#rePwd").val("");
							}
						})
					}
				}
			}
		
		</script>
		
		<!-- 获取焦点自动清除提示信息  -->
	<script type="text/javascript">
		function clearWarning(){
		//alert("fuck");
		$("#spanId").html("");
	}
	</script>
	</head>

	<body>
		<div id="content">
			<div class="span12" id="header">
					<span id="bigtitle">
						修改密码
					</span>
					<span id="spanId" style="color: red" ></span>
			</div>
			
			<form action="" method="post" class="form-control">
				
				<table border="0" cellspacing="0" cellpadding="0">
					登录名：
					<br /><input type="text" name="num" id="num" class="simple-text" value="${num }" readonly="readonly"  /><br /> 原密码：
					<br /><input type="password" name="oldPwd" id="oldPwd" class="simple-text" onfocus="clearWarning()" placeholder="请输入：" /><br />
					新密码：
					<br /><input type="password" name="newPwd" id="newPwd" class="simple-text" onfocus="clearWarning()" placeholder="请输入新密码" /><br /> 确认密码：
					<br /><input type="password" name="rePwd" id="rePwd" class="simple-text" onfocus="clearWarning()" placeholder="请再此输入新密码：" /><br />
				</table>
			</form>
			<input type="button" id="btn-submit" onclick="checkPwd()" value="提交" />
		</div>
	</body>

</html>