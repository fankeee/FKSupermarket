<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>数据库备份</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/ss/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/css_for_table.css" />
		<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.simple-table td {
				text-align: left;
				text-indent: 15px;
			}
			
			#table-title {
				background-color: #ABABAB;
				font-weight: bold;
				color: black;
				font-size: 15px;
			}
			
			#table-data {
				background-color: #DDDDDD;
			}
			
			#content {
				margin: 0px 10px;
				padding-top: 20px;
			}
			
			#backpack-submit {
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
				margin-top: 20px;
			}
		</style>
	</head>

	<script type="text/javascript">
			function reloadPage(){
				/* parent.location.reload(); */
				parent.document.location.href='${pageContext.request.contextPath }/jsp/sonpage/maintenance/maintenance.jsp?chosen=son3';
			}
		</script>
		<script type="text/javascript">
			function ajaxExce(){
			var obj = document.getElementById("backpack2");	
			    var objs = "";
			    if(obj.checked){			        
			        objs = document.getElementById("option1");        
			    }
			    var database = objs.value;
			    var objj = document.getElementById("back-place-text");
			    var objr = document.getElementById("backpack-name");
			    var deposit = objj.value+"\\"+objr.value;
			    /* alert(deposit); */
			 $.ajax({
				method:"POST",
				url: "${pageContext.request.contextPath }/category/backup.action",
				data: { database : database , deposit : deposit }		    
			}).done(function( msg ) {
				var jsonObj = JSON.parse(msg);
				if(jsonObj == true){       			
				    alert("数据库备份完毕");	
				}else{
					alert("出现未知错误，备份失败！");	
				}
			}); 
		}
	    </script>
	
	<body>
		<div id="content">
			<div class="simple-table">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" id="table-title">数据备份</td>
					</tr>
					<tr>
						<td id="table-data"><input type="radio" name="backpack" id="backpack1" value="1" />备份全部数据</td>
						<td id="table-data"><input type="radio" name="backpack" id="backpack2" value="2" />备份单张数据表&nbsp;&nbsp;&nbsp;<select>
							<option>-请选择-</option>
								<c:forEach items="${tableList }" var="topic" varStatus="i">
					    		<li><span > 
					        		 <option value=${topic} >${topic} </option>                                          
					            </span></li>		
					          </c:forEach>
						</select></td>
					</tr>
					<tr>
						<td colspan="2" id="table-title">选择位置</td>
					</tr>
					<tr>
						<td id="table-data"><input type="radio" name="back-place" id="back-place1" value="1" />备份到服务器</td>
						<td id="table-data"><input type="radio" name="back-place" id="back-place2" value="2" />备份到本地&nbsp;&nbsp;&nbsp;<input type="text" name="back-place-text" id="back-place-text" /></td>
					</tr>
					<tr>
						<td colspan="2" id="table-title">备份名称</td>
					</tr>
					<tr>
						<td id="table-data">填写备份文件名称</td>
						<td id="table-data"><input type="text" name="backpack-name" id="backpack-name" /></td>
					</tr>
				</table>
			</div>
			<div id="div-submit">
				<input type="button" name="backpack-submit" id="backpack-submit" value="提交" onclick="ajaxExce()" />
			</div>
		</div>
	</body>

</html>