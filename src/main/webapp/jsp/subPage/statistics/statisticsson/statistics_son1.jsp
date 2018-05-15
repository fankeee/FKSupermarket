<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html;  charset="UTF-8">
		<title>商品采购统计</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/js/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/css_for_table.css" />
		<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="http://www.jq22.com/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/js/jquery.date_input.pack.js"></script>
		<style type="text/css">
		*{ margin:0; padding:0;}
			body {
				font: 12px/1.5 Arial;
				color: #666;
				background: #fff;
			}
			
			ul, li {
				list-style: none;
			}
			
			img {
				border: 0 none;
			}
			
			/*---------------------------------------demo css--------------------------------------------*/
			.date_selector, .date_selector * {
				width: auto;
				height: auto;
				border: none;
				background: none;
				margin: 0;
				padding: 0;
				text-align: left;
				text-decoration: none;
			}
			
			.date_selector {
				background: #fbfbfb;
				border: 1px solid #ccc;
				padding: 10px;
				margin: 0;
				margin-top: -1px;
				position: absolute;
				z-index: 100000;
				display: none;
				border-radius: 3px;
				box-shadow: 0 0 5px #aaa;
				box-shadow: 0 2px 2px #ccc;
				width: 240px;
			}
			
			.date_selector_ieframe {
				position: absolute;
				z-index: 99999;
				display: none;
			}
			
			.date_selector .nav {
				width: 17.5em;
			}
			
			.date_selector .nav p {
				clear: none;
			}
			
			.date_selector .month_nav, .date_selector .year_nav {
				margin: 0 0 3px 0;
				padding: 0;
				display: block;
				position: relative;
				text-align: center;
			}
			
			.date_selector .month_nav {
				float: left;
				width: 55%;
			}
			
			.date_selector .year_nav {
				float: right;
				width: 42%;
				margin-right: -8px;
			}
			
			.date_selector .month_name, .date_selector .year_name {
				font-weight: bold;
				line-height: 20px;
			}
			
			.date_selector .button {
				display: block;
				position: absolute;
				top: 0;
				width: 18px;
				height: 18px;
				line-height: 16px;
				font-weight: bold;
				color: #5985c7;
				text-align: center;
				padding-top:0px;
				font-size: 12px;
				overflow: hidden;
				border: 1px solid #ccc;
				border-radius: 2px;
			}
			
			.date_selector .button:hover, .date_selector .button.hover {
				background: #5985c7;
				color: #fff;
				cursor: pointer;
				border-color: #3a930d;
			}
			
			.date_selector .prev {
				left: 0;
			}
			
			.date_selector .next {
				right: 0;
			}
			
			.date_selector table {
				border-spacing: 0;
				border-collapse: collapse;
				clear: both;
				margin: 0;
				width: 220px;
			}
			
			.date_selector th, .date_selector td {
				width: 2.5em;
				height: 2em;
				padding: 0 !important;
				text-align: center !important;
				color: #666;
				font-weight: normal;
			}
			
			.date_selector th {
				font-size: 12px;
			}
			
			.date_selector td {
				border: 1px solid #f1f1f1;
				line-height: 2em;
				text-align: center;
				white-space: nowrap;
				color: #5985c7;
				background: #fff;
			}
			
			.date_selector td.today {
				background: #eee;
			}
			
			.date_selector td.unselected_month {
				color: #ccc;
			}
			
			.date_selector td.selectable_day {
				cursor: pointer;
			}
			
			.date_selector td.selected {
				background: #2b579a;
				color: #fff;
				font-weight: bold;
			}
			
			.date_selector td.selectable_day:hover, .date_selector td.selectable_day.hover
				{
				background: #5985c7;
				color: #fff;
			}
			
			#div-search {
				width: 960px;
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
				width: 100px;
				height: 32px;
				letter-spacing: 3px;
				font-weight: bold;
				background-color: #2E363F;
				color: white;
				font-size: 15px;
				margin-bottom: 4px;
				position: relative;
				left: 20px;
			}
			
			#div-pages {
				float: right;
				margin-top: 20px;
			}
			
			.simple-table a {
				color: #009587;
			}
			
			#div-search-part2 {
				width: 740px;
				margin :0px auto;
			}
			
		
	</style>
	<script type="text/javascript">
		$(function(){
			$('.date_picker').date_input();
			})
	</script>
	</head>

	<body>
		<div id="content" class="simple-table">
			<form action="${pageContext.request.contextPath }/collect/search.action" method="post">
				<div id="div-search">
				<div id="div-search-part1">
					<input type="search" name="id" id="id" class="simple-text" placeholder="请输入采购单编号查询" />
					<input type="search" name="uid" id="uid" class="simple-text" placeholder="请输入采购人查询" />
					<input type="search" name="proid" id="proid" class="simple-text" placeholder="请输入供应商编号查询" />
				</div>
				<div id="div-search-part2">
					<input style="width:226px;background: #fefefe;border: 1px solid #bbb;font-size: 14px;color: #333;padding: 7px;border-radius: 3px;" class="date_picker" type="search" name="startdate" id="startdate" class="simple-text" placeholder="开始时间" readonly="readonly"/>
					<input style="margin-left:20px;width:226px;background: #fefefe;border: 1px solid #bbb;font-size: 14px;color: #333;padding: 7px;border-radius: 3px;" class="date_picker" type="search" name="enddate" id="enddate" class="simple-text" placeholder="结束时间" readonly="readonly"/>
					<input type="submit" name="btn-search" id="btn-search" value="查询" />
				</div>
			</div>
			</form>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>采购单编号</th>
					<th>总金额</th>
					<th>采购时间</th>
					<th>采购人编号</th>
					<th>供应商编号</th>
					<th>查看详情</th>
				</tr>
			<tr>
				<c:choose>
					<c:when test="empty poList">
						<h1>当前没有采购单信息</h1>
					</c:when>
					<c:otherwise>
						<c:forEach items="${poList }" var="purchaseOrder" varStatus="i">
							<tr>
								<td>${purchaseOrder.pur_id }</td>
								<td>${purchaseOrder.pur_totalAmount }</td>
								<td>${purchaseOrder.pur_purchaseDate }</td>
								<td>${purchaseOrder.u_id }</td>
								<td>${purchaseOrder.pro_id }</td>
								<td><a href="${pageContext.request.contextPath }/collect/findPurchaseOrderDetailById.action?pur_id=${purchaseOrder.pur_id}">详细>></a></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
			<div id="div-pages">
				<a href="${pageContext.request.contextPath }/collect/findAllPurchaseOrder.action?pageNo=1">首页</a>
				<a href="${pageContext.request.contextPath }/collect/findAllPurchaseOrder.action?pageNo=${PurchaseOrderpageResult.pageNo-1}">上一页</a>
				<a href="${pageContext.request.contextPath }/collect/findAllPurchaseOrder.action?pageNo=${PurchaseOrderpageResult.pageNo+1}">下一页</a>
				<a href="${pageContext.request.contextPath }/collect/findAllPurchaseOrder.action?pageNo=${PurchaseOrderpageResult.pages}">尾页</a>
				 &nbsp;&nbsp;&nbsp;当前页码${PurchaseOrderpageResult.pageNo}/${PurchaseOrderpageResult.pages}总页数
			</div>
		</div>
	</body>

</html>