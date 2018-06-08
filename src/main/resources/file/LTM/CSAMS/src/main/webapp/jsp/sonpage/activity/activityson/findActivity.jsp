<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">  
		<meta name="apple-mobile-web-app-status-bar-style" content="black">  
		<meta content="telephone=no" name="format-detection">
			
		<title>查询未审核活动信息</title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/css/common.css"/>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/ss/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/css_for_table.css" />
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
			
			.check1{
				margin: 0px;
				padding: 0px;
				width: 200px;
				height: 120px;
				margin-top: 7px;
				margin-bottom: 20px;
			}
		</style>
	</head>

	<body>
		<div id="content" class="simple-table">
		<form action="${pageContext.request.contextPath }/Activity/findLikeNameActivity.action?type=show" method="post" >
			<div id="div-search">
				<input type="search" name="AC_id" id="AC_id" class="simple-text" placeholder="请输入编号查询" value="" />
				<input type="search" name="AC_theme" id="AC_theme" class="simple-text" placeholder="请输入活动主题查询" value="" />
				<input type="submit" name="btn-search" id="btn-search" value="查询" />
			</div>
		</form>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>编号</th>
					<th>活动主题</th>
					<th>主办单位</th>
					<th>承办单位</th>
					<th>申请人</th>
					<th>联系方式</th>
					<th>时间</th>
					<th>地点</th>
					<th>物品</th>
					<th>经费</th>
					<th>操作</th>
				</tr>
				
		<c:choose>
			<c:when test="${empty activityList }">
				<h1 align="center">暂无活动信息</h1>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${activityList }" var="activity" varStatus="i">
		
				<tr>
					<td>${activity.AC_id }</td>
					<td>${activity.AC_theme }</td>
					<td>${activity.AC_organize }</td>
					<td>${activity.AC_undertaker }</td>
					<td>${activity.AC_people }</td>
					<td>${activity.AC_tel }</td>
					<td>${activity.AC_time }</td>
					<td>${activity.AC_location }</td>
					<td><a href="${pageContext.request.contextPath }/Goods/findDetailGoods.action?type=show2&AC_id=${activity.AC_id }">详细>></a></td>
					<td>${activity.AC_money }</td>
					<td><a href="javascript:;" class="bounceIn" onclick="check(this)" id="${activity.AC_id }">审核</a></td>
				</tr>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
			</table>
			<div id="div-pages">
				<a href="${pageContext.request.contextPath }/Activity/findAllActivity.action?type=show&pageNo=1">首页</a>
				<a href="${pageContext.request.contextPath }/Activity/findAllActivity.action?type=show&pageNo=${pagedResult.pageNo-1}">上一页</a>
				<a href="${pageContext.request.contextPath }/Activity/findAllActivity.action?type=show&pageNo=${pagedResult.pageNo+1}">下一页</a>
				<a href="${pageContext.request.contextPath }/Activity/findAllActivity.action?type=show&pageNo=${pagedResult.pages}">末页</a> 
				&nbsp;&nbsp;&nbsp;当前页码  ${pagedResult.pageNo } /总页数 ${pagedResult.pages } 
			</div>
		</div>
		
		
		<div id="dialogBg"></div>
			<div id="dialog" class="animated" style="height: 350px; top:180px;">
				<img class="dialogIco" width="50" height="50" src="images/ico.png" alt="" />
				<div class="dialogTop">
					<a href="javascript:;" class="claseDialogBtn">关闭</a>
				</div>
				<form action="" method="post" id="editForm">
					<ul class="editInfos">
						<li><input type="text" id="AC_id1" style="display: none" /></li>
						<li><input type="button" value="通过" onclick="y()" class="submitBtn" /></li>
						<li><input type="button" value="不通过" onclick="no()" class="submitBtn" /></li>
						<li><textarea  id="AC_remark" name="AC_remark" class="check1" placeholder="请输入不通过原因......"></textarea></li>
					</ul>
				</form>
			</div>
		<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"></div>


	</body>
	
	<script type="text/javascript">
		function check(obj){
			var id1=$(obj).attr("id");
			$("#AC_id1").val(id1);
		}
		//同意
		function y(){
			alert("同意");
			var id=$("#AC_id1").val();
			$.ajax({
				method:"post",
				url:"${pageContext.request.contextPath }/Activity/updateActivityById.action",
				data:{ id:id }
			}).done(function(msg){
				var jsonObj = JSON.parse(msg);
				if(jsonObj){
					alert("审批成功！");
					window.location.href = "${pageContext.request.contextPath }/Activity/findAllActivity.action?type=show";
				}else{
					alert("审批失败！");
				}
			})
		}
		//不同意
		function no(){
			
			var id=$("#AC_id1").val();
			var AC_remark=$("#AC_remark").val();
			var textA=document.getElementById("AC_remark");
			if(AC_remark == null || AC_remark == ''){
				textA.focus();
			}else{
				$.ajax({
					method:"post",
					url:"${pageContext.request.contextPath }/Activity/updateActivityNById.action",
					data:{ id:id, AC_remark:AC_remark }
				}).done(function(msg){
					var jsonObj = JSON.parse(msg);
					if(jsonObj){
						alert("审批成功！");
						window.location.href = "${pageContext.request.contextPath }/Activity/findAllActivity.action?type=show";
					}else{
						alert("审批失败！");
					}
				})
			}
		}
	</script>
	
	<script type="text/javascript">
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
			$('.simple-table a').click(function(){
				className = $(this).attr('class');
				$('#dialogBg').fadeIn(300);
				$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
			});
	
		//关闭弹窗
		$('.claseDialogBtn').click(function(){
			$('#dialogBg').fadeOut(300,function(){
				$('#dialog').addClass('bounceOutUp').fadeOut();
			});
		});
	});
	</script>
</html>