<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

	<head>
		<meta charset="UTF-8">
		<title>离职管理</title>
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
   function delItem() {
	 
	 var del=document.getElementsByName("del");
	 //定义变量接收选中的值
	 var ids="";
	
	 for (var i = 0; i < del.length; i++) {
		 //判断是否选中
		 if (del[i].checked==true) {
			ids +=del[i].value+"_";
		}
	}
 
	 window.location.href = "${pageContext.request.contextPath }/user/delItem.action?ids="+ids;
}
   
   //删除
   function delUser() {
	   //获取传入的id值
	   return confirm("确认删除！");
   };
   </script>


	<body>
		<div id="content" class="simple-table">
		   	<form action="${pageContext.request.contextPath }/user/findUserByName.action?type=show1" method="post">
			<div id="div-search">
				<input type="search" name="u_id" id="u_id" class="simple-text" placeholder="请输入编号查询" value="" />
				<input type="search" name="u_name" id="u_name" class="simple-text" placeholder="请输入姓名查询" value="" />
				<input type="submit" name="btn-search" id="btn-search" value="查询" />
			</div>
		
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>选择</th>
					<th>用户编号</th>
					<th>角色编号</th>
					<th>密码</th>
					<th>姓名</th>
					<th>年龄</th>
					<th>性别</th>
					<th>电话</th>
					<th>状态</th>
					<th>邮箱</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${ulist }" var="list">
				   <tr>
				    <td><input type="checkbox" name="del" value="${list.u_id }"/> </td>
				    <td>${list.u_id}</td>
					<td>${list.r_id}</td>
					<td>${list.u_pwd}</td>
					<td>${list.u_name}</td>
					<td>${list.u_age }</td>
					<td>${list.u_sex }</td>
					<td>${list.u_tel }</td>
					<td>${list.u_taskstate }</td>
					<td>${list.u_email }</td>
				    <td><a href="${pageContext.request.contextPath }/user/deleteUser.action?id=${list.u_id}" onclick=" return delUser()">删除</a></td> 
				</tr>
				</c:forEach>
			</table>
			<input type="button" name="btn-delete" id="btn-delete" value="批量删除" onclick="return delItem()" />

			<div id="div-pages">
				<a href="${pageContext.request.contextPath }/user/findAll.action?type=getAll&pageNo=1">首页</a>
				<a href="${pageContext.request.contextPath }/user/findAll.action?type=getAll&pageNo=${pageResult.pageNo-1}">上一页</a>
				<a href="${pageContext.request.contextPath }/user/findAll.action?type=getAll&pageNo=${pageResult.pageNo+1}">下一页</a>
				<a href="${pageContext.request.contextPath }/user/findAll.action?type=getAll&pageNo=${pageResult.pages}">末页</a> 
				&nbsp;&nbsp;&nbsp;当前页码${pageResult.pageNo }/总页数${pageResult.pages }
			</div>
		  </from>
		</div>
	</body>

</html>