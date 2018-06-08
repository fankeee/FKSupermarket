<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
		<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
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
	</head>

	<body>
		<div id="content-navigation">
			<div class="tabbable" id="tabs-296400">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#part1" data-toggle="tab" id="text-a">添加物品</a>
					</li>
					<li>
						<a href="#part2" data-toggle="tab" id="text-a">查询物品信息</a>
					</li>
					<li>
						<a href="#part3" data-toggle="tab" id="text-a">删除物品</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="part1">
						<iframe src="goodsson/addGoods.jsp" id="framework-son" name="framework-son" frameborder="0"></iframe>
					</div>
					<div class="tab-pane " id="part2">
						<iframe src="${pageContext.request.contextPath }/Goods/findAllGoods.action?type=show2" id="framework-son" name="framework-son" frameborder="0"></iframe>
					</div>
					<div class="tab-pane " id="part3">
						<iframe src="${pageContext.request.contextPath }/Goods/findAllGoods.action?type=show3" id="framework-son" name="framework-son" frameborder="0"></iframe>
					</div>
				</div>
			</div>
		</div>

	</body>

</html>