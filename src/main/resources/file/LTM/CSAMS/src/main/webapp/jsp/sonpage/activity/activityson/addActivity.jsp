<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<head>
		<meta charset="UTF-8">
		<title>活动申请</title>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
		<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/jcDate.css" media="all" />
		<script src="${pageContext.request.contextPath }/jsp/js/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/js/jquery.date_input.pack.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/jquery.date_input.pack.css" />
		

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
			
			#btn-submit1 {
				margin: 0px;
				padding: 0px;
				width: 120px;
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
			
			#AC_time{
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
		</style>

        
        <script type="text/javascript">
			$(function(){
				$('.simple-texts').date_input();
				})
		//验证手机号
			function checkme(){
 				var m_tel=document.getElementById('m_tel').value;
 				var info1=document.getElementById("mobile");
				var mobilevalid = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/;
				if (!mobilevalid.test(m_tel)) {
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
			<form action="${pageContext.request.contextPath }/Activity/addActivity.action" method="post">
				
					<br /><span style="color: red;">*</span>活动主题：
					<br /><input type="text" name="AC_theme" id="AC_theme" class="simple-text" required placeholder="请输入" />
					<br /><span style="color: red;">*</span>主办单位：
					<br /><input type="text" name="AC_organize" id="AC_organize" class="simple-text" required placeholder="请输入" />
					<br /><span style="color: red;">*</span>承办单位：
					<br /><input type="text" name="AC_undertaker" id="AC_undertaker" class="simple-text" required placeholder="请输入" />
					<br /><span style="color: red;">*</span>申请人：
					<br /><input type="text" name="AC_people" id="AC_people" class="simple-text" required placeholder="请输入" />
					<br /><span style="color: red;">*</span>联系方式：
					<br /><input type="text" name="AC_tel" id="AC_tel" class="simple-text" onfocus="clearWarning()" required onblur="checkme()" placeholder="请输入" />
					<br /><span style="color: red;">*</span>活动时间：
					<br /><input name="AC_time" id="AC_time" class="simple-texts" required value="" placeholder="请输入" />
					<br /><span style="color: red;">*</span>活动地点：
					<br /><input name="AC_location" id="AC_location" class="simple-text" required value="" placeholder="请输入" />
					<br /><span style="color: red;">*</span>活动经费：
					<br /><input type="number" name="AC_money" id="AC_money" class="simple-text" required placeholder="请输入" /><br />
				
			<input type="submit" id="btn-submit" value="添加" onclick="" />
			</form>
		</div>
	</body>

</html>