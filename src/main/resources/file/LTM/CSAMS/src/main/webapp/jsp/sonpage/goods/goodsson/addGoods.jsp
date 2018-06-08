<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8">
		<title>添加物品</title>
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
			
			form {
				color: #009587;
				font-size: 16px;
				margin-top: 30px;
			}
		</style>
		<script type="text/javascript">
		</script>
	</head>

	<body>
		<div id="content">
			<form action="${pageContext.request.contextPath }/Goods/addGoods.action" method="post" class="form-control">
				<table border="0" cellspacing="0" cellpadding="0">		
					<span style="color: red;">*</span>物品名称：<br /><input type="text" name="g_name" id="g_name" required class="simple-text" placeholder="请输入" /><br /> 
					<span style="color: red;">*</span>物品数量：<br /><input type="text" name="g_num" id="g_num" required class="simple-text" placeholder="请输入" /><br />
				</table>
				<input type="submit" id="btn-submit" value="添加" />
			</form>
			
		</div>
	</body>

</html>