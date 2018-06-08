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
		<meta name="apple-mobile-web-app-status -bar-style" content="black">  
		<meta content="telephone=no" name="format-detection">
			
		<title>查询已审批活动信息</title>
		
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
		</style>
	</head>
	
	<script type="text/javascript">
	
		//点击修改后从后台查询数据到弹框显示
		function findById(obj){
			//获取需要修改行的会员id
			var AC_id=$(obj).attr("id");
			$.ajax({
				method:"post",
				url: "${pageContext.request.contextPath }/Activity/findActivityById.action",
				data: { AC_id : AC_id }	
			}).done(function(msg){
				$("#AC_id1").val(msg.ac_id);
				$("#AC_theme1").val(msg.ac_theme);
				$("#AC_organize1").val(msg.ac_organize);
				$("#AC_undertaker1").val(msg.ac_undertaker);
				$("#AC_people1").val(msg.ac_people);
				$("#AC_tel1").val(msg.ac_tel);
				$("#AC_time1").val(msg.ac_time);
				$("#AC_location1").val(msg.ac_location);
				$("#AC_money1").val(msg.ac_money);
				
			});
		}
		
		//点击不通过
		function remark(obj){
			//获取审批意见
			var AC_remark=$(obj).attr("id");
			$("#reId").text(AC_remark);
		}
		
		
	</script>

	<body>
		<div id="content" class="simple-table">
		<form action="${pageContext.request.contextPath }/Activity/findLikeNameCActivity.action?type=show" method="post" >
			<div id="div-search">
				<input type="search" name="AC_id" id="AC_id" class="simple-text" placeholder="请输入编号查询" value="" />
				<input type="search" name="AC_theme" id="AC_theme" class="simple-text" placeholder="请输入名称查询" value="" />
				<input type="submit" name="btn-search" id="btn-search" value="查询" />
			</div>
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
					<th>审批意见</th>
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
					<td><a href="${pageContext.request.contextPath }/Goods/findDetailGoods.action?type=show1&AC_id=${activity.AC_id }">详细>></a></td>
					<td>${activity.AC_money }</td>
					
					<c:if test="${empty activity.AC_remark }">
					<td>通过</td>
					</c:if>
					
					<c:if test="${not empty activity.AC_remark }">
					<td><a href="javascript:fun();" class="modify" onclick="remark(this)"  id="${activity.AC_remark }">不通过>></a></td>
					</c:if>
					
					<td><a href="javascript:modify();" class="bounceIn" onclick="findById(this)" id="${activity.AC_id }">修改</a></td>
				</tr>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
				
				
			</table>
			<div id="div-pages">
				<a href="${pageContext.request.contextPath }/Activity/findAllCActivity.action?type=show&pageNo=1">首页</a>
				<a href="${pageContext.request.contextPath }/Activity/findAllCActivity.action?type=show&pageNo=${pagedResult.pageNo-1}">上一页</a>
				<a href="${pageContext.request.contextPath }/Activity/findAllCActivity.action?type=show&pageNo=${pagedResult.pageNo+1}">下一页</a>
				<a href="${pageContext.request.contextPath }/Activity/findAllCActivity.action?type=show&pageNo=${pagedResult.pages}">末页</a> 
				&nbsp;&nbsp;&nbsp;当前页码  ${pagedResult.pageNo } /总页数 ${pagedResult.pages }
			</div>
			</form>
		</div>
		
		<!-- 修改 -->
		<div id="dialogBg"></div>
			<div id="dialog" class="animated" style="height: 450px; width: 400px; top:180px">
				<img class="dialogIco" width="100px" height="50px" src="images/ico.png" alt="" />
				<div class="dialogTop">
					<a href="javascript:;" class="claseDialogBtn">关闭</a>
				</div>
				<form action="${pageContext.request.contextPath }/Activity/updateActivity.action" method="post" id="editForm">
					<ul class="editInfos">
						<li><label><font color="#ff0000">*</font>活动编号：<input type="text" id="AC_id1" name="AC_id" readonly="readonly" class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>活动主题：<input type="text" id="AC_theme1" name="AC_theme" required class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>主办单位：<input type="text" id="AC_organize1" name="AC_organize" readonly="readonly" class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>承办单位：<input type="text" id="AC_undertaker1" name="AC_undertaker" required class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>&nbsp;&nbsp;&nbsp;申请人：<input type="text" id="AC_people1" name="AC_people" required class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>联系方式：<input type="text" id="AC_tel1" name="AC_tel" pattern="^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$"  required class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>活动时间：<input type="text" id="AC_time1" name="AC_time" required class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>活动地点：<input type="text" id="AC_location1" name="AC_location" required class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>活动经费：<input type="number" style="width:194px;" min="0" id="AC_money1" name="AC_money" required class="ipt" /></label></li>
						<li><input type="submit" value="确认提交" class="submitBtn" /></li>
					</ul>
				</form>
			</div>
		<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"></div>


		<!-- 不通过 -->
		<div id="dialogBg" class="dialogBg2" ></div>
			<div id="dialog" class="animated dialog2" style="height: 250px; top:250px">
				<img class="dialogIco" width="50" height="50" src="images/ico.png" alt="" />
				<div class="dialogTop">
					<a href="javascript:;" class="claseDialogBtn2">关闭</a>
				</div>
				<h4 align="center" style="color: black;">审批意见</h4>
				<p id="reId" align="center" style="margin-top: 30px;"></p>
			</div>
		<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"></div>

	</body>
	
<!-- 修改 -->
<script type="text/javascript">
	function modify(){
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
<!-- 不通过 -->
<script type="text/javascript">
	function fun(){

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