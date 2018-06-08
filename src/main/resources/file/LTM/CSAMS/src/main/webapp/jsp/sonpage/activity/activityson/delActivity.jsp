<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>删除活动清单</title>
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
			#btn-delete {
				margin: 0px;
				padding: 0px;
				margin-top: 5px;
				width: 100px;
				height: 32px;
				letter-spacing: 3px;
				font-weight: bold;
				background-color: #2E363F;
				color: white;
				font-size: 15px;
				margin-bottom: 14px;
			}
		</style>
	</head>
	
	<script type="text/javascript">
	//批量删除
	function delItem(){
		var del=document.getElementsByName("del");
		//定义变量接收选中的值
		var ids="";
		for(var i=0; i < del.length; i++){
			//判断是否选中
			 if (del[i].checked==true) {
				ids +=del[i].value+"_";
			}
			
		}
		
		//window.location.href = "${pageContext.request.contextPath }/Member/delItem.action?ids="+ids;
		//alert("批量删除成功！");
		
		 $.ajax({
				method:"POST",
				url: "${pageContext.request.contextPath }/Activity/delItem.action",
				data: { ids : ids }		    
			}).done(function( msg ) {
				var jsonObj = JSON.parse(msg);
				if(jsonObj == true){
					alert("批量删除成功！");	
					//window.location.reload();
					window.location.href = "${pageContext.request.contextPath }/Activity/findAllCActivity.action?type=show1";
					//$(id).remove();
				}else{
					alert("批量删除失败！");	
				}
			});
		
	}
		
		//删除
		function delActivity(){
			//获取传入的id值
			return confirm("删除成功！");
		}
		
	</script>

	<body>

		<div id="content" class="simple-table">
		<form action="${pageContext.request.contextPath }/Activity/findLikeNameCActivity.action?type=show1" method="post" >
			<div id="div-search">
				<input type="search" name="AC_id" id="AC_id" value="" class="simple-text" placeholder="请输入物品编号查询" />
				<input type="search" name="AC_theme" id="AC_theme" value="" class="simple-text" placeholder="请输入物品名称查询" />
				<input type="submit" name="btn-search" id="btn-search" value="查询" />
			</div>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th></th>
					<th>活动编号</th>
					<th>活动主题</th>
					<th>主办单位</th>
					<th>承办单位</th>
					<th>负责人</th>
					<th>活动时间</th>
					<th>活动用品</th>
					<th>活动经费</th>
					<th>活动状态</th>
					<th>操作</th>
				</tr>
				
		<c:choose>
			<c:when test="${empty activityList }">
				<h1 align="center">暂无活动信息</h1>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${activityList }" var="activity" varStatus="i">
				
				<tr> 
					<td><input type="checkbox" name="del" value="${activity.AC_id }" /></td>
					<td>${activity.AC_id }</td>
					<td>${activity.AC_theme }</td>
					<td>${activity.AC_organize }</td>
					<td>${activity.AC_undertaker }</td>
					<td>${activity.AC_people }</td>
					<td>${activity.AC_time }</td>
					<td><a href="${pageContext.request.contextPath }/Goods/findDetailGoods.action?type=show3&AC_id=${activity.AC_id }">详细>></a></td>
					<td>${activity.AC_money }</td>
					<td>已审批</td>
					<td><a href="${pageContext.request.contextPath }/Activity/delActivity.action?AC_id=${activity.AC_id }" onclick=" return delActivity()">删除</a></td>
				</tr>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
				
				
			</table>
			<input type="button" name="btn-delete" id="btn-delete" value="批量删除" onclick="delItem()" />
			
			<div id="div-pages">
				<a href="${pageContext.request.contextPath }/Activity/findAllCActivity.action?type=show1&pageNo=1">首页</a>
				<a href="${pageContext.request.contextPath }/Activity/findAllCActivity.action?type=show1&pageNo=${pagedResult.pageNo-1}">上一页</a>
				<a href="${pageContext.request.contextPath }/Activity/findAllCActivity.action?type=show1&pageNo=${pagedResult.pageNo+1}">下一页</a>
				<a href="${pageContext.request.contextPath }/Activity/findAllCActivity.action?type=show1&pageNo=${pagedResult.pages}">末页</a> 
				&nbsp;&nbsp;&nbsp;当前页码 ${pagedResult.pageNo } /总页数 ${pagedResult.pages }
			</div>
		</div>
		</form>
	</body>

</html>