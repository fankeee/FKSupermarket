<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html;  charset="UTF-8">
		<title>销售明细</title>
		<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" /> --%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/css_for_table.css" />
		<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			#div-search {
				width: 1057px;
				margin: 10px auto;
			}
			
			#content {
				margin: 0px 10px;
				padding-top: 18px;
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
			
			#btn-back {
				margin: 0px;
				padding: 0px;
				margin-top: 10px;
				width: 100px;
				height: 32px;
				letter-spacing: 3px;
				font-weight: bold;
				background-color: #2E363F;
				color: white;
				float: right;
				clear: both;
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

	<body>
		<div id="content" class="simple-table">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>销售单明细编号</th>
					<th>商品编号</th>
					<th>销售数量 </th>
					<th>销售单编号</th>
				</tr>
				<tr>
					<c:choose>
						<c:when test="empty sodList">
							<h1>当前没有此销售单详细信息</h1>
						</c:when>
						
						<c:otherwise>
							<c:forEach items="${sodList }" var="sod" varStatus="i">
								<tr>
									<td>${sod.sod_id}</td>
									<td>${sod.g_id}</td>
									<td>${sod.sod_number}</td>
									<td>${sod.s_id}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
			<a href="#" onClick="javascript :history.back(-1);">
			<input type="submit" id="btn-back" value="返回" /></a>
		</div>
	</body>

</html>