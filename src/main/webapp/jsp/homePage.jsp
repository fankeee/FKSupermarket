<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;  charset="UTF-8">
		<title>超市收银系统首页</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/calendar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/homePage.css">
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/calendar.js"></script>
		
		<script type="text/javascript">
			$(function() {
				$("a[name='btn1'],a[name='btn2'],a[name='btn3'],a[name='btn4'],a[name='btn5'],a[name='btn6']").mouseover(function() {
					/*$(this).css("background-color", "rgb(48, 155, 236)");*/
					$(this).css("background-image", "url(../img/blue.png)");
				});
				$("a[name='btn1'],a[name='btn2'],a[name='btn3'],a[name='btn4'],a[name='btn5'],a[name='btn6']").mouseout(function() {
					/*$(this).css("background-color", "rgb(30, 120, 207)");*/
					$(this).css("background-image", "");
					$(this).css("text-decoration", "none");
				});
				$("a[name='btn1']").click(function() {
					$(this).css("background-color", "#EEEEEE");
					$("a[name='btn2'],a[name='btn3'],a[name='btn4'],a[name='btn5'],a[name='btn6']").css("background-color", "#2E363F");
					$("a[name='btn2'],a[name='btn3'],a[name='btn4'],a[name='btn5'],a[name='btn6']").css("border-top", "2px solid #37414B");
				});
				$("a[name='btn2']").click(function() {
					$(this).css("background-color", "#EEEEEE");
					$("a[name='btn1'],a[name='btn3'],a[name='btn4'],a[name='btn5'],a[name='btn6']").css("background-color", "#2E363F");
					$("a[name='btn1'],a[name='btn3'],a[name='btn4'],a[name='btn5'],a[name='btn6']").css("border-top", "2px solid #37414B");
				});
				$("a[name='btn3']").click(function() {
					$(this).css("background-color", "#EEEEEE");
					$("a[name='btn2'],a[name='btn1'],a[name='btn4'],a[name='btn5'],a[name='btn6']").css("background-color", "#2E363F");
					$("a[name='btn2'],a[name='btn1'],a[name='btn4'],a[name='btn5'],a[name='btn6']").css("border-top", "2px solid #37414B");
				});
				$("a[name='btn4']").click(function() {
					$(this).css("background-color", "#EEEEEE");
					$("a[name='btn2'],a[name='btn3'],a[name='btn1'],a[name='btn5'],a[name='btn6']").css("background-color", "#2E363F");
					$("a[name='btn2'],a[name='btn3'],a[name='btn1'],a[name='btn5'],a[name='btn6']").css("border-top", "2px solid #37414B");
				});
				$("a[name='btn5']").click(function() {
					$(this).css("background-color", "#EEEEEE");
					$("a[name='btn2'],a[name='btn3'],a[name='btn4'],a[name='btn1'],a[name='btn6']").css("background-color", "#2E363F");
					$("a[name='btn2'],a[name='btn3'],a[name='btn4'],a[name='btn1'],a[name='btn6']").css("border-top", "2px solid #37414B");
				});
				$("a[name='btn6']").click(function() {
					$(this).css("background-color", "#EEEEEE");
					$("a[name='btn2'],a[name='btn3'],a[name='btn4'],a[name='btn5'],a[name='btn1']").css("background-color", "#2E363F");
					$("a[name='btn2'],a[name='btn3'],a[name='btn4'],a[name='btn5'],a[name='btn1']").css("border-top", "2px solid #37414B");
				});
			});
		</script>
	</head>

	<body>
		<div class="container-fluid" id="div-body">
			<div class="row-fluid">
				<div class="span12" id="header">
					<%-- <img src="${pageContext.request.contextPath }/jsp/img/lanqiao.png" id="icon" /> --%>
					<span id="header-title">超市后台管理系统</span>
					<div id="little-title">
						<ul id="little-title-ul">
							<li>当前登录用户：&nbsp;${user.u_name }&nbsp;</li>
							<li><a href="${pageContext.request.contextPath }/jsp/homePage.jsp">首页</a></li>
							<li><a href="${pageContext.request.contextPath }/jsp/cashier.jsp" >POS前台销售</a></li>
							<%-- <li><a href="${pageContext.request.contextPath }/jsp/clerk_settings.jsp" target="framework">密码修改</a></li> --%>
							<li><a href="${pageContext.request.contextPath }/UserController/logout.action">退出系统</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="col-md-2" id="navigation">
					<ul id="list">
						<%-- <li>
							<img src="${pageContext.request.contextPath }/img/1.png" id="img1" /><a href="${pageContext.request.contextPath }/jsp/sonpage/purchase/purchase.jsp" id="navigation-btn" name="btn1" class="btn1" target="framework">商品采购</a>
						</li>
						<div id="div-navigation-hr">
						</div> --%>
						<li>
							<img src="${pageContext.request.contextPath }/img/1.png" id="img2" />
							<a href="${pageContext.request.contextPath }/jsp/subPage/sale/sale.jsp" 
								target="framework" name="btn2" class="btn2" id="navigation-btn">商品销售</a>
						</li>
						<div id="div-navigation-hr">
						</div>
						<li>
							<img src="${pageContext.request.contextPath }/img/3.png" id="img3" />
							<a href="${pageContext.request.contextPath }/jsp/subPage/store/store.jsp" 
								target="framework" name="btn3" class="btn3" id="navigation-btn">商品库存</a>
						</li>
						<div id="div-navigation-hr">
						</div>
						<li>
							<img src="${pageContext.request.contextPath }/img/4.png" id="img4" />
							<a href="${pageContext.request.contextPath }/jsp/subPage/statistics/statistics.jsp" 
								target="framework" name="btn4" class="btn4" id="navigation-btn">营业统计</a>
						</li>
						<div id="div-navigation-hr">
						</div>
						<li>
							<img src="${pageContext.request.contextPath }/img/5.png" id="img5" />
							<a href="${pageContext.request.contextPath }/jsp/subPage/clerk/clerk.jsp" 
								target="framework" name="btn5" class="btn5" id="navigation-btn">人事管理</a>
						</li>
						<div id="div-navigation-hr">
						</div>
						<li>
							<img src="${pageContext.request.contextPath }/img/6.png" id="img6" />
							<a href="${pageContext.request.contextPath }/jsp/sonpage/maintenance/maintenance.jsp" 
								target="framework" name="btn6" class="btn6" id="navigation-btn">系统维护</a>
						</li>
						<div id="div-navigation-hr">
						</div>
					</ul>
					<div id="calendar" class="calendar"></div>
				</div>
				<div class="col-md-10" id="content">
					<div id="frame-div">
						<iframe id="framework" name="framework" frameborder="0" src="${pageContext.request.contextPath }/jsp/picture.jsp"></iframe>
					</div>
				</div>
			</div>
			<!-- <div class="row-fluid" id="div-footer">
				<div id="div-hr">
				</div>
				<div id="foot-firstline">
					京公网安备 11010802020352号 © Copyright 2016. 蓝桥网版权所有
				</div>
				<div id="foot-secondline">
					京ICP备11024192号 国信蓝桥教育科技（北京）股份有限公司
				</div>
			</div> -->
		</div>
	</body>

</html>