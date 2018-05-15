<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html;  charset="UTF-8">
		<title>营业统计</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/metro.min.css" />
		
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/Chart.js"></script>
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/Chart.bundle.js"></script>
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/chartkick.js"></script>
		
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
			
			#text-a,
			#text-b,
			#text-c {
				color: #009587;
			}
			
			#Line {
				height: 533px;
				width: 100%;
				padding-top: 40px;
			}
			
			#Line canvas {
				display: block;
				margin: 0px auto;
			}
		</style>
		
	</head>

	<body>
		<div id="content-navigation">
			<div class="tabbable" id="tabs-296400">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#part2" data-toggle="tab" id="text-b">营业统计</a>
					</li>
					<li>
						<a href="#part3" data-toggle="tab" id="text-a">销售情况查询</a>
					</li>
					<!-- <li>
						<a href="#part1" data-toggle="tab" id="text-c">商品采购统计</a>
					</li> -->
				</ul>
				<div class="tab-content">
					<div class="tab-pane " id="part3">
						<iframe src="${pageContext.request.contextPath }/SaleOrderController/getAllSaleorder.action" id="framework-son" name="framework-son" frameborder="0"></iframe>
					</div>
					<%-- <div class="tab-pane " id="part1">
						<iframe src="${pageContext.request.contextPath }/collect/findAllPurchaseOrder.action" id="framework-son" name="framework-son" frameborder="0"></iframe>
					</div> --%>
					<div class="tab-pane active" id="part2">
						<iframe src="${pageContext.request.contextPath }/SaleOrderController/monthlyStatistics.action" id="framework-son" name="framework-son" frameborder="0"></iframe>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>