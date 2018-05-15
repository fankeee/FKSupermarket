<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>数据统计图形化</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/metro.min.css" />

<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/Chart.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/chartkick.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/Chart.bundle.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
	var arr = new Array();
	<c:forEach items="${mlist}" var="monthly">
	arr.push([ '${monthly.month}', '${monthly.total}' ]);
	</c:forEach>
</script>
<style type="text/css">
#btn-submit {
	margin: 0px;
	padding: 0px;
	width: 100px;
	height: 32px;
	letter-spacing: 3px;
	font-weight: bold;
	background-color: #2E363F;
	color: white;
	font-size: 15px;
	float: right;
	margin-bottom:5px;
}
#column1,#line1,#pie1{
	margin: 0px;
	padding: 0px;
	width: 100px;
	height: 32px;
	letter-spacing: 3px;
	font-weight: bold;
	background-color: #2E363F;
	color: white;
	font-size: 15px;
	float: right;
}
#kinds {
	width: 100%;
	height: 32px;
	margin: 0px auto;	
	
}
#kinds p{
	width: 100px;
	height: 32px;
	align:right;
	float: right;
	margin-top:7px;
	letter-spacing: 2px;
	font-size: 15px;
	 font-weight:blod;
}
#c_title{
    width: 80px;
    margin: 0px auto;
	margin-bottom:20px;
	text-align:center;

}
</style>
<script type="text/javascript">
	$(function() {
		$("#line1").click(function() {
			$("#chart_title").html("折线图");
			new Chartkick.LineChart("chart", arr, {
				download : true
			});
		});
		$("#column1").click(function() {
			$("#chart_title").html("柱状图");
			new Chartkick.ColumnChart("chart", arr, {
				download : true
			});
		});
		$("#pie1").click(function() {
			$("#chart_title").html("饼状图");
			new Chartkick.PieChart("chart", arr, {
				download : true
			});
		});
	});
</script>
</head>
<body>
	<div>
		<%-- <a id="purtotal" href="${pageContext.request.contextPath }/collect/findPurchaseTotal.action">
			<input type="submit" id="btn-submit" value="采购额 " /></a>  --%>
		<a id="saletotal" href="${pageContext.request.contextPath }/SaleOrderController/monthlyStatistics.action">
			<input type="submit" id="btn-submit" value="销售额 " /></a> 
		<%-- <a id="profit" href="${pageContext.request.contextPath }/collect/findProfit.action">
			<input type="submit" id="btn-submit" value="利润 " /></a> --%>
	</div>
	<%-- <div id="kinds"><p id="kind">${kind }</p></div> --%>
	<div id="c_title"><h3 id="chart_title" >柱状图</h3></div>
	<div id="chart" style="height: 300px;"></div>
	</br>
	</br>
	<script type="text/javascript">
		new Chartkick.ColumnChart("chart",arr,{download:true});
	</script>

	<div
		style="width:60%; height: 105px; margin: auto; text-align: center;">
		<button id="column1">柱状图</button>
		<button id="line1" >折线图</button>
		<button id="pie1">饼状图</button>
	</div>

</body>
</html>