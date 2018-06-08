<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>缺货信息</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/css_for_table.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css"/>
		<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			* {
				font-family: "微软雅黑";
			}
			
			#div-search {
				width: 420px;
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
	</head>

<body>
	<div id="content" class="simple-table">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>商品编号</th>
				<th>名称</th>
				<th>单位</th>
				<th>生产日期</th>
				<th>有效期</th>
				<th>库存量</th>
				<th>供应商编号</th>
				<th>生产地址</th>
			</tr>
			<c:choose>
				<c:when test="${empty outOfStockGoodsList }">
					<td colspan="8"><h1>暂无商品条目</h1></td>
				</c:when>


				<c:otherwise>
					<c:forEach items="${outOfStockGoodsList }" var="goods" varStatus="i">
						<tr>
							<td>${goods.g_id }</td>
							<td>${goods.g_name }</td>
							<td>${goods.g_unit }</td>
							<td><fmt:formatDate value="${goods.g_productionDate }" pattern="yyyy-MM-dd"/></td>
							<td>${goods.g_shelfLife }</td>
							<td>${goods.g_inventory }</td>
							<td>${goods.pro_id }</td>
							<td>${goods.g_productionAddress }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>