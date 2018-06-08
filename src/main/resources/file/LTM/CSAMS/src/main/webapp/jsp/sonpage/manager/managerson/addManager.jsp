<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>添加系统管理员</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/ss/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
		<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			* {
				font-family: "微软雅黑";
			}
			
			#content {
				width: 480px;
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
				/* float: right; */
				margin-left: 200px;
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
			
			#mobile{
				width: 180px;
				text-indent: 10px;
			}
		</style>
		<script type="text/javascript">
		//添加
		function addMember(){
			return confirm("添加成功！");
		}
		
		//验证手机号
		function checkme(){
				var MA_tel=document.getElementById('MA_tel').value;
				var info1=document.getElementById("mobile");
			var mobilevalid = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/;
			if (!mobilevalid.test(MA_tel)) {
				info1.innerHTML = '*请输入正确的手机号！';
				/* $("#mobile").html("请输入正确的手机号！"); */
				return false;
			}
		}
		</script>
		<!-- 获取焦点自动清除提示信息  -->
		<script type="text/javascript">
			function clearWarning(){
				var info1=document.getElementById("mobile");
				info1.innerHTML = '';
			}
		</script>
	</head>

	<body>
		<div id="content">
			<form action="${pageContext.request.contextPath }/Manager/addManager.action" method="post" class="form-control">
				
					<span style="color: red;">*</span>学号：
					<br /><input type="text" name="MA_num" id="MA__num" class="simple-text" required placeholder="请输入"  />
					<br /><span style="color: red;">*</span>设置登录密码：
					<br /><input type="password" name="MA_pwd" id="MA__pwd" class="simple-text" required placeholder="请输入"  />
					<br /><span style="color: red;">*</span> 姓名：
					<br /><input type="text" name="MA_name" id="MA_name" class="simple-text" required placeholder="请输入"  />
					<br />性别：
					<br /> <input type="radio" class="simple-radio" name="MA_sex"  id="MA_sex" value="男"/>男 
                    &nbsp;&nbsp;&nbsp;<input type="radio" class="simple-radio" name="MA_sex" id="MA_sex" value="女"/>女  <br />
					<br /><span style="color: red;">*</span> 班级：
					<br /><input type="text" name="MA_class" id="MA_class" class="simple-text" required placeholder="请输入"  />
					<br /><span style="color: red;">*</span>选择社团：
					<br /><select id="st1" class="simple-text" name="c_id">
							<option>请选择</option>
							<c:forEach items="${communityList }" var="community" varStatus="i">
							<option value=${community.c_id} id="option" name="c_id" >${community.c_name}</option>
							</c:forEach>
						</select> <br />
					<br /><span style="color: red;">*</span>职位：
					<br /><input type="text" name="MA_position" id="MA_position" class="simple-text" required placeholder="请输入"  />
					<br /><span style="color: red;">*</span>手机号码：
					<br /><input type="tel" name="MA_tel" id="MA_tel" class="simple-text" onfocus="clearWarning()" required onblur="checkme()"  placeholder="请输入"  />
					<span id="mobile" style="color: red;" ></span>
					<br />
					
				<input type="submit" id="btn-submit" value="添加 " onclick="return addMember()" />
			</form>
			
		</div>
	</body>

</html>