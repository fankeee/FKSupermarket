<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/css/common.css"/>
		
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">  
		<meta name="apple-mobile-web-app-status-bar-style" content="black">  
		<meta content="telephone=no" name="format-detection">

		<title>申请入社</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/ss/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/css_for_table.css" />
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/css/common.css"/>

		<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			#div-search {
				width: 740px;
				margin: 10px auto;
			}
			
			#content {
				margin: 0px 10px;
				border: 1px solid #EEEEEE;
			}
			
			.simple-text {
				margin: 0px;
				padding: 0px;
				width: 300px;
				height: 31px;
				margin-top: 7px;
				margin-bottom: 20px;
				font-size: 13px;
				letter-spacing: 1px;
				text-indent: 10px;
				margin-right: 12px;
			}
			
			#btn-search {
				margin: 0px;
				padding: 0px;
				width: 100px;
				height: 32px;
				letter-spacing: 3px;
				font-weight: bold;
				background-color: #2E363F;
				color: white;
				font-size: 15px;
				margin-bottom: 14px;
			}
			
			#div-pages {
				float: right;
				margin-top: 20px;
			}
			
			.simple-table a {
				color: #009587;
			}
		</style>
	</head>

	<script type="text/javascript">
	
		//点击社团简介后从后台查询数据到弹框显示
		function check(obj){
			//获取需要修改行的会员id
			var introduce=$(obj).attr("id");
			$("#introduce").text(introduce);
		}
		
		
		//点击申请入社后从后台查询数据到弹框显示
		function findById(obj){
			//获取需要修改行的会员id
			var s=$(obj).attr("id");
			var c=s.split("_");
			$("#c_id1").val(c[0]);
			$("#c_name1").val(c[1]);
		}
	
		
		function addMember1(){
			return confirm("申请成功！");
		}
	</script>


	<body>

		<div id="content" class="simple-table">
		<form action="${pageContext.request.contextPath }/Community/findLikeNameCommunity.action?type=show1" method="post" >
			<div id="div-search">
				<input type="search" name="c_id" id="c_id" value="" class="simple-text" placeholder="请输入社团编号" />
				<input type="search" name="c_name" id="c_name" value="" class="simple-text" placeholder="请输入社团名称" />
				<input type="submit" name="btn-search" id="btn-search" value="查询" />
			</div>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>社团编号</th>
					<th>社团名称</th>
					<th>社团负责人</th>
					<th>社团简介</th>
					<th>申请入社</th>

				</tr>
		<c:choose>
			<c:when test="${empty communityList }">
				<h1 align="center">暂无社团信息</h1>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${communityList }" var="community" varStatus="i">
				
				
				<tr>
					<td >${community.c_id }</td>
					<td>${community.c_name }</td>
					<td>${community.c_people }</td>
					<td ><a href="javascript:checkIntroduce();" class="inCom" onclick="check(this)" id="${community.c_introduce }" >社团简介</a></td>
					<td ><a href="javascript:inCom();" class="bounceIn" onclick="findById(this)" id="${community.c_id }_${community.c_name }" >申请入社</a></td>
				</tr>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
			</table>
			
			<div id="div-pages">
				<a href="${pageContext.request.contextPath }/Community/findCommunity.action?pageNo=1">首页</a>
				<a href="${pageContext.request.contextPath }/Community/findCommunity.action?pageNo=${pagedResult.pageNo-1}">上一页</a>
				<a href="${pageContext.request.contextPath }/Community/findCommunity.action?pageNo=${pagedResult.pageNo+1}">下一页</a>
				<a href="${pageContext.request.contextPath }/Community/findCommunity.action?pageNo=${pagedResult.pages}">末页</a> 
				&nbsp;&nbsp;&nbsp;当前页码 ${pagedResult.pageNo } /总页数 ${pagedResult.pages }
			</div>
			</form>
		</div>
		
		<!-- 申请入社 -->
		<div id="dialogBg"></div>
			<div id="dialog" class="animated" style="height: 250px;width:340px; top:180px">
				<img class="dialogIco" width="50" height="50" src="images/ico.png" alt="" />
				<div class="dialogTop">
					<a href="javascript:;" class="claseDialogBtn">关闭</a>
				</div>
				<form action="${pageContext.request.contextPath }/Member/addMember.action?type=show3" method="post" id="editForm">
					<ul class="editInfos">
						<li><label><font color="#ff0000">*</font>社团编号：<input type="text" id="c_id1" name="c_id" readonly="readonly" class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>社团名称：<input type="text" id="c_name1" name="c_name" readonly="readonly" class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>会员号码：<input type="tel" id="m_tel1" name="m_tel" maxlength="11" required class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>&nbsp;&nbsp;会员qq：<input type="text" id="m_qq1" name="m_qq" required class="ipt" /></label></li>
						<li><input type="submit" value="确认提交" class="submitBtn" onclick="return addMember1()" /></li>
					</ul>
				</form>
			</div>
			
		<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"></div>
		
		
		
		<!-- 社团信息简介 -->
		<div id="dialogBg" class="dialogBg2" ></div>
			<div id="dialog" class="animated dialog2" style="height: 250px; top:250px">
				<img class="dialogIco" width="50" height="50" src="images/ico.png" alt="" />
				<div class="dialogTop">
					<a href="javascript:;" class="claseDialogBtn2">关闭</a>
				</div>
				<h4 align="center" style="color: black;">社团信息简介</h4>
				<p id="introduce" align="center" style="margin-top: 30px;"></p>
			</div>
		
	</body>

<!-- 申请入社 -->
<script type="text/javascript">
	function inCom(){
		var w,h,className;
		function getSrceenWH(){
			w = $(window).width();
			h = $(window).height();
			$('#dialogBg').width(w).height(h);
		}

		window.onresize = function(){  
			getSrceenWH();
		}  
		$(window).resize();  

		$(function(){
			getSrceenWH();
	
			//显示弹框
		//$('.simple-table .bounceIn').click(function(){
			className = $(this).attr('class');
			$('#dialogBg').fadeIn(300);
			$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
		//});
	
		//关闭弹窗
		$('.claseDialogBtn').click(function(){
			$('#dialogBg').fadeOut(300,function(){
				$('#dialog').addClass('bounceOutUp').fadeOut();
			});
		});
	});
	}
</script>


<!-- 查看社团简介 -->
<script type="text/javascript">
	function checkIntroduce(){

		var w,h,className;
		function getSrceenWH(){
			w = $(window).width();
			h = $(window).height();
			$('.dialogBg2').width(w).height(h);
		}

		window.onresize = function(){  
			getSrceenWH();
		}  
		$(window).resize();  

		$(function(){
			getSrceenWH();
	
			//显示弹框
		//$('.simple-table .modify').click(function(){
			className = $(this).attr('class');
			$('.dialogBg2').fadeIn(300);
			$('.dialog2').removeAttr('class').addClass('animated dialog2 '+className+'').fadeIn();
		//});
	
		//关闭弹窗
		$('.claseDialogBtn2').click(function(){
			className2 = $(this).attr('class');
			$('.dialogBg2').fadeOut(300,function(){
				$('.dialog2').removeAttr('class').addClass('bounceOutUp dialog2 '+className2+'').fadeOut();
			});
		});
	});
	}
</script>


</html>