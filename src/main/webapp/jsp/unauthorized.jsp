<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>权限认证失败</title>
<style type="text/css">
* {
	font-family: "微软雅黑";
}

#img1 {
	width:290px;
	margin-top: 165px;
	margin-left: 330px;
	float: left;
	
}
#img2{
	width: 300px;
	height：auto;
	margin-top: 285px;
	margin-left: 10px;
	float: left;
	
}

#zt{
	width: 290px;
	margin-left: 10px;
	
}
</style>
</head>

<body bgcolor="white">
	<div id="img1">
		<img src="${pageContext.request.contextPath }/img/sorry.png"
			id="sorry" />
	</div>
	<div id="img2">
		<img src="${pageContext.request.contextPath }/img/zt.png" id="zt" />
	</div>

</body>

</html>