<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加社团信息</title>
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
			
			.introduce{
				margin: 0px;
				padding: 0px;
				width: 300px;
				height: 200px;
				margin-top: 7px;
				margin-bottom: 20px;
			}
			
			form {
				color: #009587;
				font-size: 16px;
				margin-top: 30px;
			}
		</style>
		<script type="text/javascript">
		//添加
		function addAdmin(){
			return confirm("添加成功！");
		}
		</script>
	</head>

	<body>
		<div id="content">
			<form action="${pageContext.request.contextPath }/Community/addCommunity.action" method="post" class="form-control">
				<table border="0" cellspacing="0" cellpadding="0">
					<span style="color: red;">*</span>社团名称：
					<br /><input type="text" name="c_name" id="c_name"" class="simple-text" placeholder="请输入" required="required" />
					<br /> <span style="color: red;">*</span>社团负责人姓名：
					<br /><input type="text" name="c_people" id="c_people" class="simple-text" placeholder="请输入"  />
					<br /> <span style="color: red;">*</span>社团负责人学号：
					<br /><input type="text" name="c_num" id="c_num" class="simple-text" placeholder="请输入"  />
					<br />社团负责人性别：
					<br /> <input type="radio" class="simple-radio" name="c_sex"  id="c_sex" value="男"/>男 
                    &nbsp;&nbsp;&nbsp;<input type="radio" class="simple-radio" name="c_sex" value="女"/>女  <br />
					<br /> <span style="color: red;">*</span>社团负责人班级：
					<br /><input type="text" name="c_class" id="c_class" class="simple-text" placeholder="请输入" required="required" />
					<br /> <span style="color: red;">*</span>设置登录密码：
					<br /><input type="password" name="c_pwd" id="c_pwd" class="simple-text" placeholder="请输入"  />
					<br /><span style="color: red;">*</span>社团负责人电话：
					<br /><input type="tel" name="c_tel" id="c_tel" class="simple-text" maxlength="11" placeholder="请输入"  required="required" /><br />
					<br /><span style="color: red;">*</span>社团负责人qq：
					<br /><input type="text" name="c_qq" id="c_qq" class="simple-text" placeholder="请输入"  required="required" /><br />
					<br /><span style="color: red;">*</span>社团简介：
					<br /><textarea id="c_introduce" name="c_introduce" class="introduce" required="required" ></textarea><br />
				</table>
				<input type="submit" id="btn-submit" value="添加" onclick="return addAdmin()" />
			</form>
			
		</div>
	</body>

</html>