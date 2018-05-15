<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
		<title>添加会员</title>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jquery.date_input.pack.css" />
		
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/js/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.date_input.pack.js"></script>
		
		<style type="text/css">
			* {
				font-family: "微软雅黑";
			}
			
			#content {
				width: 301px;
				margin: 0px auto;
				border: 1px solid #EEEEEE;
			}
			
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
			}
			
			.simple-text {
				margin: 0px;
				padding: 0px;
				width: 300px;
				height: 32px;
				margin-top: 7px;
				margin-bottom: 20px;
				font-size: 14px;
				letter-spacing: 1px;
				text-indent: 10px;
			}
			
			form {
				color: #009587;
				font-size: 16px;
				margin-top: 30px;
			}
		</style>
		<script type="text/javascript">
		$(function() {
			//ajax请求
			$("#btn-submit").click(function(){
				var m_name=$("#m_name").val();
				var m_integral=$("#m_integral").val();
				var m_date=$("#m_date").val();
				var m_phone=$("#m_phone").val();
				$.ajax({
					method:"post",
					url:"${pageContext.request.contextPath }/MemberCotroller/addMember.action",
					data:{
						m_name : m_name,
						m_integral : m_integral,
						m_date : m_date,
						m_phone : m_phone
					}
				}).done(function(msg){
					$("#m_name").val("");
					$("#m_integral").val("");
					$("#m_date").val("");
					$("#m_phone").val("");
					window.location.href = 
						"${pageContext.request.contextPath }/MemberCotroller/findAllMember.action";
				});
			});
		});
		</script>
        <script type="text/javascript">
			$(function(){
				$('.simple-texts').date_input();
				})
		</script>
	</head>

	<body>
		<div id="content">
			<form action="" method="get" class="form-control">
				<table border="0" cellspacing="0" cellpadding="0">
					会员姓名：<br />
						<input type="text" name="m_name" id="m_name"  class="simple-text" placeholder="请输入" /><br /> 
					会员积分：<br />
						<input type="text" name="m_integral" id="m_integral"  class="simple-text" placeholder="请输入" /><br />
					开户时间：<br />
						<input type="text" name="m_date" id="m_date"  class="simple-texts" placeholder="请输入" readonly /><br />
					联系方式：<br />
						<input type="text" name="m_phone" id="m_phone"  class="simple-text" placeholder="请输入" /><br />
				</table>
			</form>
			<input type="submit" id="btn-submit" value="添加" onclick="addMember()"/>
		</div>
	</body>

</html>