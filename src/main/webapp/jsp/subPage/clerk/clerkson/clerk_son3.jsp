<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8">
		<title>人事调动</title>
		<link rel="stylesheet" type="text/css" href="../../../ss/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="../../../css/metro.min.css" />
		<script src="../../../js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
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
			
			#div-part {
				width: 720px;
				margin-left: 25px;
			}
		</style>
	</head>

	<body>
		<div id="content">
			<form action="" method="get">
				<table border="0" cellspacing="0" cellpadding="0">
					<div id="div-part">
						<div id="div-part1">
							用户编号：<br /><input type="text" name="" id="" class="simple-text" disabled="disabled" placeholder="${user.u_id }"/><br /> 角色编号：
							<br /><input type="text" name="r_id" id="r_id" class="simple-text" placeholder="${user.r_id }"/> <br /> 用户职称：
							<br /><input type="text" name="r_id" id="r_id" class="simple-text" placeholder="${user.r_id }"  /><br />用户密码：
							<br /><input type="text" name="u_pwd" id="u_pwd" class="simple-text" placeholder="${user.u_pwd }" /><br /> 用户姓名：
							<br /><input type="text" name="u_name" id="u_name" class="simple-text" placeholder="${user.u_name }" /><br />
						</div>
						<div id="div-part2">
						           用户年龄：
							<br /><input type="text" name="u_age" id="u_age" class="simple-text"  placeholder="${user.u_age }"/><br />
							 用户性别：
							<br /><input type="text" name="u_sex" id="u_sex" class="simple-text"  placeholder="${user.u_sex }" /><br />用户电话：
							<br /><input type="text" name="u_tel" id="u_tel" class="simple-text"  placeholder="${user.u_tel }"/><br /> 用户状态：
							<br /><input type="text" name="u_taskstate" id="u_taskstate" class="simple-text"  placeholder="${user.u_taskstate }"/><br />用户邮箱：
							<br /><input type="text" name="u_email" id="u_email" class="simple-text"  placeholder="${user.u_email }"/><br />
							
						</div>
					</div>

		</div>
		</table>
		<input type="submit" id="btn-submit" value="提交" />
		</form>
		
		</div>
	</body>

</html>