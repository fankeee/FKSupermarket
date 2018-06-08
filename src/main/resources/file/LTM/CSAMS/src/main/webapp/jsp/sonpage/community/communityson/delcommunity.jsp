<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>删除社团联系人</title>
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
			
			#div-pages {
				float: right;
				margin-top: 40px;
			}
			
			.simple-table a {
				color: #009587;
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
				url: "${pageContext.request.contextPath }/Community/delItem.action",
				data: { ids : ids }		    
			}).done(function( msg ) {
				var jsonObj = JSON.parse(msg);
				if(jsonObj == true){
					alert("批量删除成功！");	
					//window.location.reload();
					window.location.href = "${pageContext.request.contextPath }/Community/findAllCommunity.action?type=show1";
					//$(id).remove();
				}else{
					alert("批量删除失败！");	
				}
			});
		
	}
	
		//删除
		function delCommunity(){
			return confirm("删除成功！");
		}
	</script>

	<body>
		<div id="content" class="simple-table">
		<form action="${pageContext.request.contextPath }/Community/findLikeNameCommunity.action?type=show1" method="post" >
			<div id="div-search">
				<input type="search" name="c_name" id="c_name" class="simple-text" placeholder="请输入社团名称查询" value="" />
				<input type="search" name="c_people" id="c_people" class="simple-text" placeholder="请输入负责人姓名查询" value="" />
				<input type="submit" name="btn-search" id="btn-search" value="查询" />
			</div>
			
		
			
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th></th>
					<th>社团编号</th>
					<th>社团名称</th>
					<th>社团负责人姓名</th>
					<th>负责人学号</th>
					<th>负责人性别</th>
					<th>负责人班级</th>
					<th>负责人电话</th>
					<th>负责人qq</th>
					<th>操作</th>
				</tr>
				
			<c:choose>
			<c:when test="${empty communityList }">
				<h1 align="center">暂无社团信息</h1>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${communityList }" var="community" varStatus="i">
				
				<tr>
					<td><input type="checkbox" name="del" value="${community.c_id }" /></td>
					<td>${community.c_id }</td>
					<td>${community.c_name }</td>
					<td>${community.c_people }</td>
					<td>${community.c_num }</td>
					<td>${community.c_sex }</td>
					<td>${community.c_class }</td>
					<td>${community.c_tel }</td>
					<td>${community.c_qq }</td>
					<td><a href="${pageContext.request.contextPath }/Community/delCommunity.action?c_id=${community.c_id}" onclick="delCommunity()">删除</a></td>
				</tr>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
				
			</table>
			
			
			
			<input type="button" name="btn-delete" id="btn-delete" value="批量删除" onclick="delItem()" />
			<div id="div-pages">
				<a href="${pageContext.request.contextPath }/Community/findAllCommunity.action?type=show1&pageNo=1">首页</a>
				<a href="${pageContext.request.contextPath }/Community/findAllCommunity.action?type=show1&pageNo=${pagedResult.pageNo-1}">上一页</a>
				<a href="${pageContext.request.contextPath }/Community/findAllCommunity.action?type=show1&pageNo=${pagedResult.pageNo+1}">下一页</a>
				<a href="${pageContext.request.contextPath }/Community/findAllCommunity.action?type=show1&pageNo=${pagedResult.pages}">末页</a> 
				&nbsp;&nbsp;&nbsp;当前页码 ${pagedResult.pageNo } /总页数 ${pagedResult.pages }
			</div>
			</form>
		</div>
	</body>

</html>