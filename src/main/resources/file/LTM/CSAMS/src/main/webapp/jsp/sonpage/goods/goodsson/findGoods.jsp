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
			
		<title>查询物品信息</title>
		
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
				margin-left: 12px;
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
	
		//点击修改后从后台查询数据到弹框显示
		function findById(obj){
			//获取需要修改行的物品id
			var g_id=$(obj).attr("id");
			$.ajax({
				method:"post",
				url: "${pageContext.request.contextPath }/Goods/findGoodsById.action",
				data: { g_id : g_id }	
			}).done(function(msg){
				$("#g_id1").val(msg.g_id);
				$("#g_name1").val(msg.g_name);
				$("#g_num1").val(msg.g_num);
				
			});
		}
	
	</script>

	<body>
		<div id="content" class="simple-table">
		<form action="${pageContext.request.contextPath }/Goods/findLikeNameGoods.action?type=show2" method="post" >
			<div id="div-search">
				<input type="search" name="g_id" id="g_id" class="simple-text" placeholder="请输入编号查询" value="" />
				<input type="search" name="g_name" id="g_name" class="simple-text" placeholder="请输入名称查询" value="" />
				<input type="submit" name="btn-search" id="btn-search" value="查询" />
			</div>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>物品编号</th>
					<th>物品名称</th>
					<th>物品物品数量</th>
					<th>数据操作</th>
				</tr>
				
		<c:choose>
			<c:when test="${empty goodsList }">
				<h1 align="center">暂无物品信息</h1>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${goodsList }" var="goods" varStatus="i">
				
				
				<tr>
					<td>${goods.g_id }</td>
					<td>${goods.g_name }</td>
					<td>${goods.g_num }</td>
					<td><a href="javascript:;" class="bounceIn" onclick="findById(this)" id="${goods.g_id }">修改</a></td>
				</tr>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
			</table>
			<div id="div-pages">
				<a href="${pageContext.request.contextPath }/Goods/findAllGoods.action?type=show2&pageNo=1">首页</a>
				<a href="${pageContext.request.contextPath }/Goods/findAllGoods.action?type=show2&pageNo=${pagedResult.pageNo-1}">上一页</a>
				<a href="${pageContext.request.contextPath }/Goods/findAllGoods.action?type=show2&pageNo=${pagedResult.pageNo+1}">下一页</a>
				<a href="${pageContext.request.contextPath }/Goods/findAllGoods.action?type=show2&pageNo=${pagedResult.pages}">末页</a> 
				&nbsp;&nbsp;&nbsp;当前页码 ${pagedResult.pageNo } /总页数 ${pagedResult.pages }
			</div>
			</form>
		</div>
		

		<div id="dialogBg" ></div>
			<div id="dialog" class="animated" style="height: 300px; top:200px">
				<img class="dialogIco" width="50" height="50" src="images/ico.png" alt="" />
				<div class="dialogTop">
					<a href="javascript:;" class="claseDialogBtn">关闭</a>
				</div>
				<form action="${pageContext.request.contextPath }/Goods/updateGoods.action" method="post" id="editForm">
					<ul class="editInfos">
						<li><label><font color="#ff0000">*</font>物品编号：<input type="text" id="g_id1" name="g_id" readonly="readonly" class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>物品名称：<input type="text" id="g_name1" name="g_name" required class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>物品数量：<input type="text" id="g_num1" name="g_num" required class="ipt" /></label></li>
						<li><input type="submit" value="确认提交" class="submitBtn" /></li>
					</ul>
				</form>
			</div>
		<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"></div>

	</body>

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