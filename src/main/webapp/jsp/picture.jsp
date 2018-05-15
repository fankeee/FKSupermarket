<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;  charset="UTF-8">
		<title>营业统计</title>
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/Chart.js"></script>
		<style type="text/css">
			* {
				font-family: "微软雅黑";
				letter-spacing: 2px;
			}
			#bigtitle {
				letter-spacing: 10px;
				display: block;
				margin: 0px auto;
				text-align: center;
				font-size: 30px;
				margin-top: 30px;
				font-weight: bold;
				color: #2E363F;
			}
			#Line {
				float: left;
				width: 100%;
			}
			#Line canvas{
				display: block;
				margin: 0px auto;
				margin-top: 70px;
			}
		</style>
	</head>

	<body>
		<div id="Line">
			<div class="span12" id="header">
				<span id="bigtitle">采购额</span>
			</div>
			<canvas id="canvas" height="400" width="1000"></canvas>
		</div>
	</body>
	<script type="text/javascript">
		$(function() {
			var barChartData = {
				labels: ["1",
					"2",
					"3",
					"4",
					"5",
					"6",
					"7",
					"8",
					"9",
					"10",
					"11",
					"12"
				],
				datasets: [{
					fillColor: "rgba(153,178,229)",
					strokeColor: "rgba(51,102,204)",
					data: [5000, 4500, 4500, 5000, 4500, 5000, 7000, 8000,6000,4600,5200,4900]
				}]
			}
			var myLine = new Chart(document.getElementById("canvas").getContext("2d")).Bar(barChartData);
		});
	</script>
</html>