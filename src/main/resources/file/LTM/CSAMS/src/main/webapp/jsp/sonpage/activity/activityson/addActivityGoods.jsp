<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加活动物品</title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/css/common.css"/>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/css_for_table.css" />
		<script src="${pageContext.request.contextPath }/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
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
				margin-left: 12px;
			}
			
			#div-pages {
				float: right;
				margin-top: 20px;
			}
			
			.simple-table a {
				color: #009587;
			}
			
			.item {
				width: 240px;
				height: 40px;
				margin: 50px auto;
			}
			td input{
				width: 100%;
				text-align: center;
			}
			.submitBtn{
				background-color: #000000;
				display: block;
			}
		</style>
	
		<script type="text/javascript">
			// 将该条记录删除
			function deleteRow(obj) {
				var tbody = document.getElementById('table').lastChild;
				var tr = obj.parentNode.parentNode;
				tbody.removeChild(tr);
			}
		</script>
		<script type="text/javascript">
			// 下拉框选中事件
			$(function() {
				$("#myselect").change(function(){
					// 获取物品ID
				    var g_id = $("#myselect").val();
				    $.ajax({
						method:"POST",
						url: "${pageContext.request.contextPath }/Goods/findGoodsById.action",
						data: { g_id : g_id }		    
					}).done(function( msg ) {
						if($("#"+msg.g_id).length>0){
							//alert("存在该物品，数量+1");
							$("#"+msg.g_id).val(Number.parseInt($("#"+msg.g_id).val())+1);
						}else{
							//alert("不存在该物品，添加显示");
							// 将物品显示
							var tbody = document.getElementById('table').lastChild;
							var tr = document.createElement('tr');
							// 物品编号
							var td = document.createElement("td");
							td.name = "g_id";
							td.innerHTML = msg.g_id;
							tr.appendChild(td);
							// 物品名称
							td = document.createElement("td");
							td.innerHTML = msg.g_name;
							tr.appendChild(td);
							// 物品数量
							td = document.createElement("td");
							td.innerHTML = "<input type='text' name='g_num' id='"+msg.g_id+"' value='1' />";
							tr.appendChild(td);
							// 操作
							td = document.createElement("td");
							td.innerHTML = "<a href='javascript:;' onclick='deleteRow(this)'>删除</a>";
							tr.appendChild(td);
							
							tbody.appendChild(tr);
						}
						
						
					}); 
				});
			});
		</script>
		<script type="text/javascript">
			function addGoods(){
				
				// 获取所有ID
				var g_ids = document.getElementsByName("g_id");			
				// 获取所有数量
				var g_nums = document.getElementsByName("g_num");	
				alert("原始ID："+g_ids);
				alert("原始数量："+g_nums);
				// 所有ID拼接
				var strIds = "";
				// 所有数量拼接
				var strNums = "";
				for (var i = 0; i < g_nums.length; i++) {
					strNums = strNums+g_nums[i].value+",";
					strIds = strIds+g_nums[i].id+",";
	            }
				//alert("id拼接："+strIds);
				//alert("数量拼接："+strNums);
				$.ajax({
					method:"POST",
					url: "${pageContext.request.contextPath }/Activity/addActivityGoods.action",
					data: {
						strnums : strNums,
						strids : strIds
					}		    
				}).done(function( msg ) {
					if(msg == true){
						//alert("添加成功");
						window.location.href="${pageContext.request.contextPath }/jsp/sonpage/activity/activityson/addActivity.jsp";
					}else{
						//alert("添加失败！");
						window.location.reload();
					}
				}); 
			} 
		</script>
	</head>
	<body>
		<div id="content" class="simple-table">
			<form action="" method="post" >
				<table border="0" cellspacing="0" cellpadding="0" id="table">
					<tr>
						<th>物品编号</th>
						<th>物品名称</th>
						<th>物品数量</th>
						<th>操作</th>
					</tr>
					<!-- <tr>
						<td>1001</td>
						<td>安慕希安慕希安慕希安慕希</td>
						<td><input type="text" /></td>
						<td><a href="javascript:;"  onclick="deleteRow(this)" >删除</a></td>
					</tr>
					<tr>
						<td>1002</td>
						<td>亲嘴烧</td>
						<td>2</td>
						<td><a href="javascript:;"  onclick="deleteRow(this)" >删除</a></td>
					</tr>
					<tr>
						<td>1003</td>
						<td>德芙</td>
						<td>2</td>
						<td><a href="javascript:;"  onclick="deleteRow(this)" >删除</a></td>
					</tr>
					<tr>
						<td>1004</td>
						<td>夏威夷果</td>
						<td>2</td>
						<td><a href="javascript:;"  onclick="deleteRow(this)" >删除</a></td>
					</tr>
					<tr>
						<td>1005</td>
						<td>巧乐兹</td>
						<td>2</td>
						<td><a href="javascript:;"  onclick="deleteRow(this)" >删除</a></td>
					</tr> -->
					
				</table>
				<div class="item">
					<select name="myselect" id="myselect">
						<option value="unaudited">请选择物品</option>
						<c:forEach items="${goodsList }" var="goods">
							<option value="${goods.g_id }">${goods.g_name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="item">
					<input type="button" value="确认添加" class="submitBtn" onclick="addGoods()" />
				</div>
			</form>
		</div>
		
	</body>
</html>