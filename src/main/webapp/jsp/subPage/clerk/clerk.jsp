<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8">
		<title>人事管理</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/metro.min.css" />
		<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			* {
				font-family: "微软雅黑";
			}
			
			#frame-div {
				margin: 0px;
				padding: 0px;
			}
			
			#framework-son {
				width: 100%;
				height: 532px;
			}
			
			#content-navigation {
				margin-top: -3px;
				background-color: #EEEEEE;
			}
			
			#text-a {
				color: #009587;
			}
		</style>
		<%-- <script type="text/javascript">
			$(function(){
				var chosen = "<%=request.getParameter("chosen")%>";
				if (chosen == "son1") {
					$('#tabs-296400 li:eq(1) a').tab('show');
				}
			});
		</script> --%>
	</head>

	<body>
		<div id="content-navigation">
			<div class="tabbable" id="tabs-296400">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#part1" data-toggle="tab" id="text-a">添加员工</a>
					</li>
					<li>
						<a href="#part2" data-toggle="tab" id="text-a">查询员工信息</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="part1">
						<iframe src="clerkson/clerk_son1.jsp" id="framework-son" name="framework-son" frameborder="0"></iframe>
					</div>
					 <div class="tab-pane " id="part2">
						<iframe src="${pageContext.request.contextPath }/UserController/findAllUser.action" id="framework-son" name="framework-son" frameborder="0"></iframe>
					</div>  
				</div>
			</div>
	</body>

</html>