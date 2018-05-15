<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
		<title>查询会员信息</title>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/metro.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/css_for_table.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css"/>
		<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		
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
			
			input.ipt{
				text-align:center
			}
		</style>
	
		<script type="text/javascript">
			//查询会员
			function conditionalQuery(){
				var m_phone = "";
				var m_name = "";
				m_phone =document.getElementById("search1").value;
				 m_name  =document.getElementById("search2").value;
				$.ajax({
					method:"POST",
					url: "${pageContext.request.contextPath }/MemberCotroller/conditionalQuery.action",
					data: { m_phone : m_phone , m_name : m_name }		    
				}).done(function( msg ) {
					window.location.href="${pageContext.request.contextPath }/jsp/subPage/sale/saleson/sale_son2.jsp";
				});
				
			} 
			
		</script>	
		<script type="text/javascript">
			//删除会员
			function delmember(){
				return confirm('你确定要删除该会员吗？')
			}
		</script>
		<script type="text/javascript">
		
			//点击修改后从后台查询数据到弹框显示
			function findById(obj){
				//获取需要修改行的会员id
				var m_id=$(obj).attr("id");
				$.ajax({
					method:"post",
					url: "${pageContext.request.contextPath }/MemberCotroller/findMemberById.action",
					data: { m_id : m_id }	
				}).done(function(msg){
					$("#m_id2").val(msg.m_id);
					$("#m_name").val(msg.m_name);
					$("#m_integral").val(msg.m_integral);
					var date = new Date(msg.m_date);
					var result = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();//+' '+date.getHours()+':'+date.getMinutes()+':'+date.getSeconds()
					$("#m_date").val(result);
					$("#m_phone").val(msg.m_phone);
				});
			}
		</script>
	</head>

	<body>
		<div id="content" class="simple-table">
			<div id="div-search">
				<input type="search" name="search1" id="search1" class="simple-text" placeholder="请输入手机号查询" value="" />
				<input type="search" name="search2" id="search2" class="simple-text" placeholder="请输入名称查询" value="" />
				<input type="button" name="btn-search" id="btn-search" value="查询" onclick="conditionalQuery()"/>
			</div>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>会员编号</th>
					<th>会员姓名</th>
					<th>会员积分</th>
					<th>开户时间</th>
					<th>电话号码</th>
					<th>数据操作</th>
				</tr>
				<c:choose>
					<c:when test="${empty memberList }">
							<td colspan="6"><h1>暂无会员名单</h1></td>
					</c:when>
					
					<c:otherwise>
						<c:forEach items="${memberList }" var="member" varStatus="i">
							<tr>
								<td id="m_id">${member.m_id}</td>
								<td>${member.m_name}</td>
								<td>${member.m_integral}</td>
								<td><fmt:formatDate value="${member.m_date}" type="both" pattern="yyyy-MM-dd"/></td>
								<td>${member.m_phone}</td>
								<td><a href="javascript:modify();" class="modify" onclick="findById(this)"  id="${member.m_id}">修改</a>/
								<a href="${pageContext.request.contextPath }/MemberCotroller/delMemberById.action?m_id=${member.m_id}" onclick="return delmember()" >删除</a></td>
							</tr>
						</c:forEach>
						
					</c:otherwise>
				</c:choose>		
			</table>
			<div id="div-pages">
				页数:[${pagedResult.pageNo}/${pagedResult.pages }]
				<a href="${pageContext.request.contextPath }/MemberCotroller/findAllMember.action?pageNo=1">首页</a>
				<a href="${pageContext.request.contextPath }/MemberCotroller/findAllMember.action?pageNo=${pagedResult.pageNo-1}">上一页</a>
				<a href="${pageContext.request.contextPath }/MemberCotroller/findAllMember.action?pageNo=${pagedResult.pageNo+1}">下一页</a>
				<a href="${pageContext.request.contextPath }/MemberCotroller/findAllMember.action?pageNo=${pagedResult.pages}">尾页</a>
			</div>
		</div>

		<!-- 修改 -->
		<div id="dialogBg"></div>
			<div id="dialog" class="animated" style="height: 420px; top:130px">
				<img class="dialogIco" width="50" height="50" src="images/ico.png" alt="" />
				<div class="dialogTop">
					<a href="javascript:;" class="claseDialogBtn">关闭</a>
				</div>
				<form action="${pageContext.request.contextPath }/MemberCotroller/updateMember.action" method="post" id="editForm">
					<ul class="editInfos">
						<li><label><font color="#ff0000">*</font>会员编号：<input type="text" id="m_id2" name="m_id2" readonly class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>会员姓名：<input type="text" id="m_name" name="m_name" class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>会员积分：<input type="text" id="m_integral" name="m_integral" readonly class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>开户时间：<input type="text" id="m_date" name="m_date" readonly class="ipt" /></label></li>
						<li><label><font color="#ff0000">*</font>电话号码：<input type="text" id="m_phone" name="m_phone" class="ipt" /></label></li>
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