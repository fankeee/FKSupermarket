<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8">
		<title>查询员工信息</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/css_for_table.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css"/>
		<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
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
			input.ipt{
				text-align:center
			}
		</style>
		<script type="text/javascript">
		
			//点击修改后从后台查询数据到弹框显示
			function findById(obj){
				//获取需要修改行的会员id
				var u_id=$(obj).attr("id");
				$.ajax({
					method:"post",
					url: "${pageContext.request.contextPath }/UserController/findUserById.action",
					data: { u_id : u_id }	
				}).done(function(msg){
					$("#u_id").val(msg.u_id);
					$("#r_id").val(msg.r_id);
					$("#u_pwd").val(msg.u_pwd);
					$("#u_name").val(msg.u_name);
					$("#u_age").val(msg.u_age);
					if(msg.u_sex == '男')
						$("[name='u_sex']:eq(0)").attr("checked",true);
					else
						$("[name='u_sex']:eq(1)").attr("checked",true);
					/* $("#u_sex").attr("checked",msg.u_sex); */
					/* if(msg.u_sex=='男')
						$("#u_sex").val(1);
					else
						$("#u_sex").val(2); */
					$("#u_tel").val(msg.u_tel);
				});
			}
		</script>
	</head>

	<body>
	<script language="javascript">
		function clickdel() {
			return confirm("确认删除吗？");
		}
	</script>	
		<div id="content" class="simple-table">
		   <form action="${pageContext.request.contextPath }/UserController/conditionalQuery.action" method="post">
			<div id="div-search">
				<input type="search" name="u_id2" id="u_id2" class="simple-text" placeholder="请输入编号查询" value="" />
				<input type="search" name="u_name2" id="u_name2" class="simple-text" placeholder="请输入姓名查询" value="" />				
				<input type="submit" name="btn-search" id="btn-search" value="查询" />
			</div>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>员工编号<br/>（系统登录名）</th>
					<th>员工类型</th>
					<th>密码</th>
					<th>姓名</th>
					<th>年龄</th>
					<th>性别</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
				
				<c:choose>
					<c:when test="${empty userList }">
						<td colspan="10"><h1>无用户</h1></td>
					</c:when>
					
					<c:otherwise>
						<c:forEach items="${userList}" var="user">
						    <tr>
								<td>${user.u_id}</td>
								<td>
									<c:if test="${user.r_id} == 1 ">管理员</c:if>
									<c:if test="${user.r_id} == 2 ">库存员</c:if>
									<c:if test="${user.r_id} == 3 ">收银员</c:if>  
								</td>
								<td>${user.u_pwd}</td>
								<td>${user.u_name}</td>
								<td>${user.u_age }</td>
								<td>${user.u_sex }</td>
								<td>${user.u_tel }</td>
								<td>
									<a href="javascript:modify()" onclick="findById(this)" id="${user.u_id }" >
										>>修改</a>
									<a href="${pageContext.request.contextPath }/UserController/deleteUserById.action?u_id=${user.u_id }" onclick='return clickdel()'>
										>>删除</a>
								</td>
						    </tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<div id="div-pages">
				页数:[${pagedResult.pageNo}/${pagedResult.pages }]
				<a href="${pageContext.request.contextPath }/UserController/findAllUser.action?pageNo=1">首页</a>
				<a href="${pageContext.request.contextPath }/UserController/findAllUser.action?pageNo=${pagedResult.pageNo-1}">上一页</a>
				<a href="${pageContext.request.contextPath }/UserController/findAllUser.action?pageNo=${pagedResult.pageNo+1}">下一页</a>
				<a href="${pageContext.request.contextPath }/UserController/findAllUser.action?pageNo=${pagedResult.pages}">末页</a> 
			</div>
			</form>
		</div>
		<!-- 修改 -->
	<div id="dialogBg"></div>
		<div id="dialog" class="animated" style="height: 460px; top:130px">
			<img class="dialogIco" width="50" height="50" src="images/ico.png" alt="" />
			<div class="dialogTop">
				<a href="javascript:;" class="claseDialogBtn">关闭</a>
			</div>
			<form action="${pageContext.request.contextPath }/UserController/updateUser.action" method="post" id="editForm">
				<ul class="editInfos">
					<li><label><font color="#ff0000">*</font>员工编号：<input type="text" id="u_id" name="u_id" readonly class="ipt" /></label></li>
					</label></li>
					<li><label><font color="#ff0000">*</font>员工密码：<input type="text" id="u_pwd" name="u_pwd" class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>员工姓名：<input type="text" id="u_name" name="u_name" class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>员工年龄：<input type="text" id="u_age" name="u_age" class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>员工电话：<input type="text" id="u_tel" name="u_tel" class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>员工类型：<!-- <input type="text" id="g_name" name="g_name" class="ipt" /> -->
																	<select name="r_id" id="r_id" class="ipt">
																		<option value ="1">收银员</option>
																		<option value ="2">库存员</option>
																		<option value ="3">管理员</option>
																	</select>
					<li><label><font color="#ff0000">*</font>员工性别：<!-- <input type="text" id="g_shelfLife" name="g_shelfLife" class="ipt" /> -->
																	<input type="radio" class="ipt" name="u_sex" id="u_sex" value="男"/>男 
	                           										<input type="radio" class="ipt" name="u_sex" id="u_sex" value="女"/>女
																	<!-- <select name=u_sex id="u_sex" class="ipt">
																		<option value ="1">男</option>
																		<option value ="2">女</option>
																	</select> -->
					</label></li>
					<li><input type="submit" value="确认提交" class="submitBtn" /></li>
				</ul>
			</form>
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
</html>