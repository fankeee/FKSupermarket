<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8">
		<title>桂林理工大学社团管理系统</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/css/calendar.css">
		<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/calendar.js"></script>
		<style type="text/css">
			* {
				font-family: "微软雅黑";
			}
			
			#div-body {
				background-color: #EEEEEE;
			}
			
			#header {
				/*background-color: rgb(121, 154, 225);*/
				background-color: #1F262D;
				height: 98px;
			}
			
			#icon {
				width: 51px;
				height: 51px;
				margin: 15px;
				margin-top: 29px;
				float: left;
			}
			
			#header-title {
				display: block;
				height: 97px;
				line-height: 97px;
				font-size: 40px;
				color: white;
				float: left;
				letter-spacing: 8px;
			}
			
			#navigation {
				/*background-color: rgb(30, 120, 207);*/
				background-color: #2E363F;
				padding: 0px;
				height: 572px;
			}
			
			#content {
				/*border: 1px solid black;*/
				height: 573px;
				padding: 0px;
			}
			
			#navigation-btn {
				display: block;
				width: 100%;
				font-size: 15px;
				letter-spacing: 2px;
				text-align: left;
				height: 50px;
				line-height: 45px;
				border: none;
				/*border-top: 2px solid rgb(39, 133, 209);
				border-left: 1px solid rgb(30, 120, 207);
				border-bottom: 2px solid rgb(39, 133, 209);
				background-color: rgb(30, 120, 207);*/
				border-left: 2px solid #2E363F;
				border-top: 2px solid #37414B;
				background-color: #2E363F;
				margin: 0px;
				padding: 0px;
				color: #939DA8;
				width: 100%;
			}
			
			#navigation-btn:hover {
				text-decoration: none;
				color: white;
			}
			
			#list {
				margin: 0px;
				padding: 0px;
				list-style: none;
			}
			
			#list li {
				list-style: none;
			}
			
			#div-navigation-hr {
				height: 1px;
				/*background-color: rgb(19, 105, 190);*/
				background-color: #1F262D;
				margin: 0px;
				padding: 0px;
			}
			
			#frame-div {
				width: 100%;
				height: 100%;
			}
			
			#framework {
				width: 100%;
				height: 100%;
			}
			
			#img1,
			#img2,
			#img3,
			#img4,
			#img5,
			#img6 {
				width: 21px;
				height: 21px;
				margin: 14px;
				margin-left: 40px;
				display: block;
				float: left;
				clear: both;
			}
			
			#div-footer {
				width: 100%;
				height: 63px;
				float: left;
			}
			
			#div-hr {
				width: 100%;
				height: 1px;
				background-color: #92C0E0;
			}
			
			#foot-firstline {
				width: 425px;
				margin: 10px auto;
				color: #808080;
				font-size: 13px;
			}
			
			#foot-secondline {
				width: 370px;
				margin: 10px auto;
				color: #808080;
				font-size: 13px;
			}
			
			#little-title {
				color: white;
				float: right;
				position: relative;
				top: 75px;
				font-size: 13px;
			}
			
			#little-title-ul {
				list-style: none;
			}
			
			#little-title-ul li {
				float: left;
				padding: 0px 7px;
			}
			
			#little-title-ul li a {
				color: white;
			}
			
			#little-title-ul li a:hover {
				color: #939DA8;
				text-decoration: none;
			}
		</style>
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
					<img src="${pageContext.request.contextPath }/jsp/img/logo.jpg" id="icon" /><span id="header-title">桂林理工大学社团管理系统</span>
					<div id="little-title">
						<ul id="little-title-ul">
							<li>当前登陆用户：&nbsp; ${num } </li>
							<li><a href="${pageContext.request.contextPath }/Activity/show.action">首页</a></li>
							<li><a href="newpwd.jsp" target="framework">密码修改</a></li>
							<li><a href="${pageContext.request.contextPath }/Manager/logout.action">退出系统</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="col-md-2" id="navigation">
					<ul id="list">
						<li>
							<img src="${pageContext.request.contextPath }/jsp/img/6.png" id="img1" /><a href="member/member.jsp" id="navigation-btn" name="btn1" class="btn1" target="framework">会员管理</a>
						</li>
						<div id="div-navigation-hr">
						</div>
						<li>
							<img src="${pageContext.request.contextPath }/jsp/img/1.png" id="img2" /><a href="goods/goods.jsp" target="framework" name="btn2" class="btn2" id="navigation-btn">物品管理</a>
						</li>
						<div id="div-navigation-hr">
						</div>
						<li>
							<img src="${pageContext.request.contextPath }/jsp/img/3.png" id="img3" /><a href="activity/activity.jsp" target="framework" name="btn3" class="btn3" id="navigation-btn">活动管理</a>
						</li>
						<div id="div-navigation-hr">
						</div>
						<li>
							<img src="${pageContext.request.contextPath }/jsp/img/5.png" id="img4" /><a href="manager/manager.jsp" target="framework" name="btn4" class="btn4" id="navigation-btn">系统用户管理</a>
						</li>
						<div id="div-navigation-hr">
						</div>
						<li>
							<img src="${pageContext.request.contextPath }/jsp/img/2.png" id="img5" /><a href="community/community.jsp" target="framework" name="btn5" class="btn5" id="navigation-btn">社团管理</a>
						</li>
						<div id="div-navigation-hr">
						</div>
						<%-- <li>
							<img src="${pageContext.request.contextPath }/jsp/img/6.png" id="img6" /><a href="maintenance/maintenance.jsp" target="framework" name="btn6" class="btn6" id="navigation-btn">系统维护</a>
						</li>
						<div id="div-navigation-hr">
						</div> --%>
					</ul>
					<div id="calendar" class="calendar"></div>
				</div>
				<div class="col-md-10" id="content">
					<div id="frame-div">
						<iframe id="framework" name="framework" frameborder="0" src="table-picture.jsp"></iframe>
					</div>
				</div>
			</div>
			<div class="row-fluid" id="div-footer">
				<div id="div-hr">
				</div>
				<div id="foot-firstline" align="center">
					版权所有：桂林理工大学
				</div>
				<div id="foot-secondline">
					桂ICP备05001198号 前置审核编号：桂JS20111-001
				</div>
			</div>
		</div>
	</body>

</html>