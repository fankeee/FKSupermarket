<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>添加社团</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/jsp/ss/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/jsp/css/metro.min.css" />
		<script src="${pageContext.request.contextPath }/jsp/jsp/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/jsp/jsp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			* {
				font-family: "微软雅黑";
			}
			
			#content {
				width: 480px;
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
				/* float: right; */
				margin-left: 200px;
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
			
			#mobile{
				width: 180px;
				text-indent: 10px;
			}
		</style>
		<script type="text/javascript">
			/* $(function(){
				$("#st1").change(function(){
					var cid=$("#st1").val();
					document.getgetElementById("c_id").value=cid;
					alert(document.getElementById("c_id").value);
				})
			}) */
			//添加
			function addMember(){
				return confirm("添加成功！");
			}
			
			//验证手机号
			function checkme(){
 				var m_tel=document.getElementById('m_tel').value;
 				var info1=document.getElementById("mobile");
				var mobilevalid = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/;
				if (!mobilevalid.test(m_tel)) {
					info1.innerHTML = '*请输入正确的手机号！';
					/* $("#mobile").html("请输入正确的手机号！"); */
 					return false;
				}
			}
		</script>
		<!-- 获取焦点自动清除提示信息  -->
		<script type="text/javascript">
			function clearWarning(){
				var info1=document.getElementById("mobile");
				info1.innerHTML = '';
		}
		</script>
		
	</head>

	<body>
		<div id="content">
			<form action="${pageContext.request.contextPath }/Member/addMember.action?type=show" method="post" class="form-control">
				
					<span style="color: red;">*</span>会员学号
					<br /><input type="text" name="m_num" id="m_num" class="simple-text" required  placeholder="请输入" />
					<br /><span style="color: red;">*</span>会员姓名
					<br /><input type="text" name="m_name" id="m_name" class="simple-text" required  placeholder="请输入" />
					<br /> 性别：
					<br /> <input type="radio" class="simple-radio" name="m_sex"  id="m_sex" value="男"/>男 
                    &nbsp;&nbsp;&nbsp;<input type="radio" class="simple-radio" name="m_sex" value="女"/>女  <br />
                    <br /><span style="color: red;">*</span>选择社团：
					<br /><select id="st1" class="simple-text" name="c_id">
							<option>请选择</option>
							<c:forEach items="${communityList }" var="community" varStatus="i">
							<option value=${community.c_id} id="option" name="c_id" >${community.c_name}</option>
							</c:forEach>
						</select> <br />
					<!-- <input type="hidden" name="c_id" id="c_id" class="simple-text" placeholder="请输入" />  -->
					<br /><span style="color: red;">*</span> 会员班级：
					<br /><input type="text" name="m_class" id="m_class" class="simple-text" required  placeholder="请输入" />
					<br /><span style="color: red;">*</span>会员电话：
					<br /><input type="tel" name="m_tel" id="m_tel" class="simple-text" onfocus="clearWarning()" required onblur="checkme()"  placeholder="请输入" />
					<span id="mobile" style="color: red;" ></span>
					<br /><span style="color: red;">*</span>会员QQ：
					<br /><input type="text" name="m_qq" id="m_qq" class="simple-text" required  placeholder="请输入" /><br />
				
				<input type="submit" id="btn-submit" value="添加" onclick="return addMember()" />
			</form>
			
		</div>
	</body>

</html>