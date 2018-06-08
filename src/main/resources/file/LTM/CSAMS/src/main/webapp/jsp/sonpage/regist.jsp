<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="utf-8" />
		<title>注册</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			* {
				font-family: "微软雅黑";
				letter-spacing: 2px;
			}
			
			#container {}
			
			#main-regist {
				margin: 0px auto;
				padding-top: 20px;
				padding-left: 10px;
				width: 365px;
				border-radius: 3px;
				height: 500px;
				background-color: rgba(255, 255, 255, .85);
				box-shadow: 7px 7px 10px -3px #262626;
			}
			
			#div-part {
				width: 400px;
				margin-left: 25px;
			}
			
			#div-part1
			{
				width: 360px;
				float: left;
			}
			
			#div-bgimg {
				width: 100%;
				height: 100%;
				z-index: -1;
				position: absolute;
				left: 0px;
			}
			
			form {
				font-size: 16px;
				margin-top: 30px;
			}
			
			#bgimg {
				width: 100%;
				height: 100%;
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
			
			#aa{
				margin-top: 900px;
			}
			
			#btn-submit {
				margin-top: 10px;
				padding: 0px;
				width: 100px;
				height: 32px;
				letter-spacing: 3px;
				font-weight: bold;
				background-color: #2E363F;
				color: white;
				font-size: 15px;
				float: right;
				margin-right: 40px;
			}
			
			#bigtitle {
				padding-top: 40px;
				padding-bottom: 20px;
				display: block;
				margin: 0px auto;
				text-align: center;
				font-size: 35px;
				font-weight: bold;
				color: #2E363F;
				letter-spacing: 15px;
			}
			
			#warn {
				text-indent: 10px;
				width: 70%;
				height: 20px;
				text-align:center;
				float:left;
				margin: 0px auto;
				position: absolute;
				top: 130px;
				left:17%;
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
					<span id="bigtitle">
						注册
					</span>
				</div>
			</div>
			<div class="row-fluid" id="main-regist">
					<table border="0" cellspacing="0" cellpadding="0">
						<div id="div-part">
						<span id="warn" style="color: red"></span> 
							<div id="div-part1">
								学号：<br /><input type="text" name="m_num" id="m_num" class="simple-text" onfocus="clearWarning()"  placeholder="请输入" /><br /> 密码：
								<br /><input type="password" name="m_pwd" id="m_pwd" class="simple-text" onfocus="clearWarning()" placeholder="请输入" /> <br /> 确认密码：
								<br /><input type="password" name="m_pwd1" id="m_pwd1" class="simple-text" onfocus="clearWarning()" placeholder="请输入" /><br /> 姓名：
								<br /><input type="text" name="m_name" id="m_name" class="simple-text" onfocus="clearWarning()" placeholder="请输入" /><br /> 性别：
								<input type="radio" class="ipt" name="m_sex"  id="m_sex" value="男"/>男  &nbsp;&nbsp;&nbsp;
                    			<input type="radio" class="ipt" name="m_sex" value="女"/>女 <br />班级:
                    			<br /><input type="text" name="m_class" id="m_class" class="simple-text" onfocus="clearWarning()" placeholder="请输入" />
							</div>
						</div>

					</table>
					<a href="login.jsp" id="aa" >>>前去登录</a>
					<input type="button" id="btn-submit" onclick="regist()" value="提交" />
				
			</div>
		</div>

	</body>
	
	<script type="text/javascript">
	function regist(){
		var m_num=$("#m_num").val();//学号
		var m_pwd=$("#m_pwd").val();//密码
		var pwd1=$("#m_pwd1").val();//确认密码
		var m_name=$("#m_name").val(); 
		var m_sex=$("#m_sex").val(); 
		var m_class=$("#m_class").val(); 
		if(m_num == null || m_num == ""){
			//alert("请输入账号密码！");
			$("#warn").html("请输入学号！");
		}else if(m_pwd == null || m_pwd == ""){
			$("#warn").html("请输入密码！");
		}else if(m_pwd != pwd1){
			$("#warn").html("两次密码不一致，请重新输入！");
		}else if(m_name == null || m_name == ""){
			$("#warn").html("请输入姓名！");
		}else if(m_class == null || m_class == ""){
			$("#warn").html("请输入姓名！");
		}else{
			$.ajax({
				method:"POST",
				url: "${pageContext.request.contextPath }/Member/addMember1.action",
				data: { m_num : m_num, m_pwd:m_pwd, m_nam:m_name, m_sex:m_sex, m_class:m_class}	
			}).done(function(msg){
				var jsonObj = JSON.parse(msg);
				if(jsonObj){
					alert("注册成功！");
					var m_num=$("#m_num").val("");//学号
					var m_pwd=$("#m_pwd").val("");//密码
					var pwd1=$("#m_pwd1").val("");//确认密码
					var m_name=$("#m_name").val(""); 
					var m_sex=$("#m_sex").val(""); 
					var m_class=$("#m_class").val(""); 
				}else{
					alert("注册失败！");
					var m_num=$("#m_num").val("");//学号
					var m_pwd=$("#m_pwd").val("");//密码
					var pwd1=$("#m_pwd1").val("");//确认密码
					var m_name=$("#m_name").val(""); 
					var m_sex=$("#m_sex").val(""); 
					var m_class=$("#m_class").val(""); 
				}	
			})
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