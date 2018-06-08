<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>数据库恢复</title>
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
			
			#recover-submit {
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
		
		<script type="text/javascript">
			function ajaxExce(){
			var obj = document.getElementById("recover2");	

			    if(obj.checked){			        
			    	var objs = document.getElementById("option1");        
			    }
			    /* alert(objs.value); */
			    var deposit = objs.value;		    
			 $.ajax({
				method:"POST",
				url: "${pageContext.request.contextPath }/category/restore.action",
				data: { deposit : deposit }		    
			}).done(function( msg ) {
				var jsonObj = JSON.parse(msg);
				if(jsonObj == true){       			
				    alert("数据库还原成功");	
				}else{
					alert("出现未知错误，备份失败！");	
				}
			}); 
		}
	    </script>
		
	</head>

	<body>
		<div id="content">
			<div class="simple-table">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" id="table-title">恢复方式</td>
					</tr>
					<tr>
						<td id="table-data"><input type="radio" name="recover" id="recover1" value="1" />从服务器恢复</td>
						<td id="table-data">
							<select>
							<option>-请选择-</option></select>
						</td>
					</tr>
					<tr>
						<td id="table-data"><input type="radio" name="recover" id="recover2" value="2" />从本地文件恢复</td>
						<td id="table-data"><input type="file" name="" id="" /></td>
					</tr>
				</table>
			</div>
			<div id="div-submit">
				<input type="button" name="recover-submit" id="recover-submit" value="恢复" />
			</div>
		</div>
	</body>

</html>