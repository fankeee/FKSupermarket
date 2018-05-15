<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8">
		<title>添加员工</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/css_for_table.css" />
		<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			* {
				font-family: "微软雅黑";
			}
			
			#content {
				width: 722px;
				height: 400px;
				margin: 0px auto;
				border: 1px solid #EEEEEE;
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
				margin-top: 5px;
				margin-right: 35px;
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
			.simple-radio{
				margin: 0px;
				padding: 0px;
				width: 50px;
				height: 32px;
				margin-top: 7px;
				margin-left: 17px;
				margin-bottom: 20px;
				font-size: 14px;
				letter-spacing: 1px;
				text-indent: 10px;
				
			}
			
			form {
				color: #009587;
				font-size: 16px;
				margin-top: 30px;
			}
			
			#div-part1,
			#div-part2,
			#div-part3 {
				width: 360px;
				float: left;
			}
			#div-part{
				width: 720px;
				margin-left: 25px;
			}
		</style>
<!-- 		<script type="text/javascript">
			function reloadPage(){
				/* parent.location.reload(); */
		
				parent.document.location.href='${pageContext.request.contextPath }/jsp/sonpage/clerk/clerk.jsp?chosen=son1';
			}
		</script> -->
		<script type="text/javascript">
			function addUser(){
				u_name = $("#u_name").val();
				r_id = $("#r_id").val();
				u_pwd = $("#u_pwd").val();
				u_age = $("#u_age").val();
				u_tel = $("#u_tel").val();
				u_email = $("#u_email").val();
				u_sex = $("#u_sex").val();
				$.ajax({
					method:"post",
					url:"${pageContext.request.contextPath }/UserController/addUser.action",
					data:{
						u_name : u_name,
						r_id : r_id,
						u_pwd : u_pwd,
						u_age : u_age,
						u_tel : u_tel,
						u_email : u_email,
						u_sex : u_sex
					}
				}).done(function(msg){
					alert("新员工的登录名："+msg.u_id);
					window.location.href="${pageContext.request.contextPath}/jsp/subPage/clerk/clerkson/clerk_son1.jsp";
				});
			}
		</script>
	</head>

	<body>
		<div id="content">
			<form action="javascript:addUser()" method="post">
				<table border="0" cellspacing="0" cellpadding="0">
					<div id="div-part">
						<div id="div-part1">
							员工姓名：<br /><input type="text" name="u_name" id="u_name" class="simple-text" placeholder="请输入"  required /><br />
							员工类型：<br /><!-- <input type="text" name="r_id" id="r_id" class="simple-text" placeholder="1(管理员)2(库存)3(收银)" pattern="[0-3]{1,1}" required /><br /> -->  
									<select name="r_id" id="r_id" class="simple-text">
										<option value ="1" selected >收银员</option>
										<option value ="2">库存员</option>
										<option value ="3">管理员</option>
									</select><br />
							系统密码：<br /><input type="password" name="u_pwd" id="u_pwd" class="simple-text" placeholder="请输入6-10位数字密码" pattern="[0-9]{6,10}" required /><br /> 
						</div>
						<div id="div-part2">
							员工年龄：<br /><input type="text" name="u_age" id="u_age" class="simple-text" min=18 max=65 pattern="[0-9]{1,3}" placeholder="请输入"  required /><br /> 
							员工电话：<br /><input type="text" name="u_tel" id="u_tel" class="simple-text" placeholder="请输入" pattern="[0-9]{11,11}" required /><br /> 
							员工性别：
						        <br /> <input type="radio" class="simple-radio" name="u_sex"  id="u_sex" value="男"/>男 
	                             <input type="radio" class="simple-radio" name="u_sex" value="女"/>女  <br />
						</div>
					</div>
				</table>
				<input type="submit" id="btn-submit" value="提交" onclick="" />
				<input type="reset" id="btn-submit" value="重置" />
			</form>			   			
		</div>
	</body>

</html>