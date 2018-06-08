<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>查询商品信息</title>
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
		<script type="text/javascript">
		
			//点击修改后从后台查询数据到弹框显示
			function findById(obj){
				//获取需要修改行的会员id
				var g_id=$(obj).attr("id");
				$.ajax({
					method:"post",
					url: "${pageContext.request.contextPath }/GoodsController/findGoodsById.action",
					data: { g_id : g_id }	
				}).done(function(msg){
					$("#g_id").val(msg.g_id);
					$("#g_name").val(msg.g_name);
					$("#g_sellingPrice").val(msg.g_sellingPrice);
					$("#g_unit").val(msg.g_unit);
					var date = new Date(msg.g_productionDate);
					var result = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();//+' '+date.getHours()+':'+date.getMinutes()+':'+date.getSeconds()
					$("#g_productionDate").val(result);
					$("#g_shelfLife").val(msg.g_shelfLife);
					$("#g_inventory").val(msg.g_inventory);
					$("#pro_id").val(msg.pro_id);
					$("#g_productionAddress").val(msg.g_productionAddress);
					$("#c_id").val(msg.c_id);
					$("#g_purchasePrice").val(msg.g_purchasePrice);
				});
			}
		</script>
</head>

<body>
	<script language="javascript">
		function clickdel() {
			return confirm("确认删除吗？");
		}
	</script>
	<div id="content" class="simple-table">
		<div id="div-search">
			<form
				action="${pageContext.request.contextPath }/GoodsController/conditionalQuery.action"
				method="post">
					<input type="search" name="g_name2" id="g_name2" class="simple-text" placeholder="请输入名称查询" value="" /> 
					<input type="search" name="c_name" id="c_name" class="simple-text" placeholder="请输入商品类别查询" value="" />
					<input type="submit" name="btn-search" id="btn-search" value="查询" />
			</form>
		</div>
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>商品编号</th>
				<th>名称</th>
				<th>售价</th>
				<th>单位</th>
				<th>生产日期</th>
				<th>有效期</th>
				<th>库存量</th>
				<th>供应商编号</th>
				<th>生产地址</th>
				<th>数据操作</th>
			</tr>
			<c:choose>
				<c:when test="${empty goodsList }">
					<td colspan="10"><h1>暂无商品条目</h1></td>
				</c:when>


				<c:otherwise>
					<c:forEach items="${goodsList }" var="goods" varStatus="i">
						<tr>
							<td>${goods.g_id }</td>
							<td>${goods.g_name }</td>
							<td>${goods.g_sellingPrice }</td>
							<td>${goods.g_unit }</td>
							<td><fmt:formatDate value="${goods.g_productionDate }" pattern="yyyy-MM-dd"/></td>
							<td>${goods.g_shelfLife }</td>
							<td>${goods.g_inventory }</td>
							<td>${goods.pro_id }</td>
							<td>${goods.g_productionAddress }</td>
							<td>
								<a href="javascript:modify()" onclick="findById(this)" id="${goods.g_id }" >
									>>修改</a>
								<a href="${pageContext.request.contextPath }/GoodsController/deleteGoodsById.action?g_id=${goods.g_id }" onclick='return clickdel()'>
									>>删除</a>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</table>
		<div id="div-pages">
			<p>
				页数:[${pagedResult.pageNo}/${pagedResult.pages }]
				<a
					href="${pageContext.request.contextPath }/GoodsController/findAllGoods.action?pageNo=1">首页</a>
				<a
					href="${pageContext.request.contextPath }/GoodsController/findAllGoods.action?pageNo=${pagedResult.pageNo-1}">上一页</a>
				<a
					href="${pageContext.request.contextPath }/GoodsController/findAllGoods.action?pageNo=${pagedResult.pageNo+1}">下一页</a>
				<a
					href="${pageContext.request.contextPath }/GoodsController/findAllGoods.action?pageNo=${pagedResult.pages}">尾页</a>
			</p>
		</div>
	</div>
	<!-- 修改 -->
	<div id="dialogBg"></div>
		<div id="dialog" class="animated" style="height: 460px; top:130px">
			<img class="dialogIco" width="50" height="50" src="images/ico.png" alt="" />
			<div class="dialogTop">
				<a href="javascript:;" class="claseDialogBtn">关闭</a>
			</div>
			<form action="${pageContext.request.contextPath }/GoodsController/updateGoods.action" method="post" id="editForm">
				<ul class="editInfos">
					<li><label><font color="#ff0000">*</font>商品编号：<input type="text" id="g_id" name="g_id" readonly class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>商品名称：<input type="text" id="g_name" name="g_name" class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>商品售价：<input type="text" id="g_sellingPrice" name="g_sellingPrice" readonly class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>商品单位：<input type="text" id="g_unit" name="g_unit" readonly class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>生产日期：<input type="text" id="g_productionDate" name="g_productionDate" class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>有效期：&nbsp;&nbsp;&nbsp;<input type="text" id="g_shelfLife" name="g_shelfLife" class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>库存量：&nbsp;&nbsp;&nbsp;<input type="text" id="g_inventory" name="g_inventory" class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>供应商编号：<input type="text" id="pro_id" name="pro_id" class="ipt" /></label></li>
					<li><label><font color="#ff0000">*</font>生产地址：<input type="text" id="g_productionAddress" name="g_productionAddress" class="ipt" /></label></li>
					<li><input type="hidden" id="c_id" name=c_id /></li>
					<li><input type="hidden" id="g_purchasePrice" name=g_purchasePrice /></li>
					<li><input type="submit" value="确认提交" class="submitBtn" /></li>
				</ul>
			</form>
		</div>
	<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"></div>
		
</body>
<!-- 修改 -->
<script type="text/javascript">
	function modify(){
		var w,h,className;
		function getSrceenWH(){
			w = $(window).width();
			h = $(window).height();
			$('#dialogBg').width(w).height(h);
		}

		window.onresize = function(){  
			getSrceenWH();
		}  
		$(window).resize();  

		$(function(){
			getSrceenWH();
	
			//显示弹框
		//$('.simple-table .bounceIn').click(function(){
			className = $(this).attr('class');
			$('#dialogBg').fadeIn(300);
			$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
		//});
	
		//关闭弹窗
		$('.claseDialogBtn').click(function(){
			$('#dialogBg').fadeOut(300,function(){
				$('#dialog').addClass('bounceOutUp').fadeOut();
			});
		});
	});
	}
</script>
</html>