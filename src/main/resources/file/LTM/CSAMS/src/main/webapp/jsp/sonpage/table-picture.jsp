<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>近期活动</title>
		<!-- <script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/Chart.js" type="text/javascript" charset="utf-8"></script> -->
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
			#div-part {
				width: 900px;
				margin-left: 0px;
			}
			
			#div-part1,
			#div-part2 {
				width: 400px;
				float: left;
			}
			
			#div-part2{
				margin-left: 80px;
			}
			
			ul li {
				margin: 0px;
				padding: 0px;
				width: 380px;
				height: 31px;
				margin-top: 30px;
				margin-bottom: 20px;
				font-size: 13px;
				letter-spacing: 3px;
				text-indent: 10px;
				margin-left: 120px;
			}
		</style>
	</head>

	<body>
			
		<div id="Line">
			<div class="span12" id="header">
					<span id="bigtitle">
						近期活动
					</span>
			</div>
			<div id="div-part">
			<c:choose>
				<c:when test="${empty activityList }">
					<h1 align="center">近期暂无活动</h1>
				</c:when>
				<c:otherwise>
					<c:forEach items="${activityList }" var="activity" varStatus="i">
						<c:choose>
							<c:when test="${i.index%2==0 }">
								<div id="div-part1">
									<ul class="editInfos">
										<li>${i.index+1}、${activity.AC_theme }&nbsp;&nbsp;&nbsp;${activity.AC_time }&nbsp;&nbsp;&nbsp;${activity.AC_location }</li>
									</ul>
								</div>
							</c:when>
							<c:otherwise>
								<div id="div-part2">
									<ul class="editInfos">
										<li>${i.index+1}、${activity.AC_theme }&nbsp;&nbsp;&nbsp;${activity.AC_time }&nbsp;&nbsp;&nbsp;${activity.AC_location }</li>
									</ul>	
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		
	</script>

</html>