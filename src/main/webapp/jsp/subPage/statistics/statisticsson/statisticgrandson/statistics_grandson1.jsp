<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html;  charset="UTF-8">
		<title>销售明细查询</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/js/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/css_for_table.css" />
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
					<th>采购单编号</th>
					<th>采购人姓名</th>
					<th>采购人电话</th>
					<th>商品名</th>
					<th>进价</th>
					<th>采购数量</th>
				</tr>
				<tr>
					<c:choose>
						<c:when test="empty podList">
							<h1>当前没有此采购单详细信息</h1>
						</c:when>
						<c:otherwise>
							<c:forEach items="${podList }" var="pod" varStatus="i">
								<tr>
									<td>${pod.pur_id}</td>
									<td>${pod.user.u_name}</td>
									<td>${pod.user.u_tel}</td>
									<td>${pod.goods.g_name}</td>
									<td>${pod.goods.g_purchasePrice}</td>
									<td>${pod.goods.g_inventory}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
			<a href="${pageContext.request.contextPath }/collect/findAllPurchaseOrder.action"><input type="submit" id="btn-back" value="返回" /></a>
		</div>
	</body>

</html>