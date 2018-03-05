<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#user_name").attr("readonly","readonly");
			$("#user_name").css("color","gray");
		}
	});
	
	//保存
	function save(){
		if($("#user_name").val()=="" || $("#user_name").val()=="此用户名已存在!"){
			$("#user_name").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#user_name").focus();
			$("#user_name").val('');
			$("#user_name").css("background-color","white");
			return false;
		}else{
			$("#user_name").val(jQuery.trim($('#user_name').val()));
		}
		
		if($("#user_id").val()=="" && $("#password").val()==""){
			$("#password").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#password").focus();
			return false;
		}
		
		if($("#password").val()!=$("#chkpwd").val()){
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			
			$("#chkpwd").focus();
			return false;
		}

		if($("#rel_name").val()==""){
			$("#rel_name").tips({
				side:3,
	            msg:'输入姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#rel_name").focus();
			return false;
		}
		
		if($("#id_number").val()==""){
			$("#id_number").tips({
				side:3,
	            msg:'输入身份证号',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#id_number").focus();
			return false;
		}
		
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#phone").val()==""){
			
			$("#phone").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#phone").focus();
			return false;
		}else if($("#phone").val().length != 11 && !myreg.test($("#phone").val())){
			$("#phone").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#phone").focus();
			return false;
		}
		
		if($("#email").val()==""){
			$("#email").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#email").focus();
			return false;
		}else if(!ismail($("#email").val())){
			$("#email").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#email").focus();
			return false;
		}
		
		if($("#user_id").val()==""){
			hasU();
		}else{
			$("#userForm").submit();
			$("#cqtwindow").hide();
			$("#cqtwindow2").show();
		}
	}
	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
	}
	
	//判断用户名是否存在
	function hasU(){
		var userName = $.trim($("#user_name").val());
		var idNumber = $.trim($("#id_number").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasU.do',
	    	data: {idNumber:idNumber,userName:userName,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#userForm").submit();
					$("#cqtwindow").hide();
					$("#cqtwindow2").show();
				 }else{
					$("#user_name").css("background-color","#D16E6C");
					setTimeout("$('#user_name').val('此用户名已存在!')",500);
				 }
			}
		});
	}
	
	//判断邮箱是否存在
	function hasE(){
		var email = $.trim($("#email").val());
		var idNumber = $.trim($("#id_number").val());
		if(idNumber==""){return false;}
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasE.do',
	    	data: {idNumber:idNumber,email:email,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#email").tips({
							side:3,
				            msg:'邮箱已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					setTimeout("$('#email').val('')",2000);
				 }
			}
		});
	}
	
</script>
	</head>
<body>
	<form action="user/${msg }.do" name="userForm" id="userForm" method="post">
		<input type="hidden" name="userId" id="user_id" value="${user.userId }"/>
		<div id="cqtwindow" style="margin:10px">
		<table>
			<tr>
				<td><input type="text" name="userName" id="user_name" value="${user.userName }" maxlength="32" placeholder="这里输入用户名" title="用户名"/></td>
			</tr>
			<tr>
				<td><input type="password" name="password" id="password"  maxlength="32" placeholder="输入密码" title="密码"/></td>
			</tr>
			<tr>
				<td><input type="password" name="chkpwd" id="chkpwd"  maxlength="32" placeholder="确认密码" title="确认密码" /></td>
			</tr>
			<tr>
				<td><input type="text" name="relName" id="rel_name"  value="${user.relName }"  maxlength="32" placeholder="这里输入姓名" title="姓名"/></td>
			</tr>
			<tr>
				<td><input type="text" name="idNumber" id="id_number"  value="${user.idNumber }"  maxlength="20" placeholder="这里输入身份证号" title="身份证号"/></td>
			</tr>
			<tr>
				<td><input type="number" name="phone" id="phone"  value="${user.phone }"  maxlength="20" placeholder="这里输入手机号" title="手机号"/></td>
			</tr>
			<tr>
				<td><input type="email" name="email" id="email"  value="${user.email }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" onblur="hasE()"/></td>
			</tr>
			<%-- <tr>
				<td>
					<select id="schoolOrg" name="orgId">
						<option value="0">请选择机构</option>
						<c:if test="${not empty schoolOrgList }">
							<c:forEach items="${schoolOrgList }" var="map" varStatus="st">
								<c:choose>
									<c:when test="${user.orgId==map.zdId }">
										<option value="${map.zdId }" selected="selected">${map.zdName }</option>
									</c:when>
									<c:otherwise>
										<option value="${map.zdId }">${map.zdName }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</select>
				</td>
			</tr> --%>
			<tr>
				<td>
					<select id="schoolOrg" name="orgId">
						<option value="0">请选择所属学校</option>
						<c:if test="${not empty listSchool }">
							<c:forEach items="${listSchool }" var="school" varStatus="st">
								<c:choose>
									<c:when test="${school.schoolId==schoolId }">
										<option value="${school.schoolCode }" selected="selected">${school.schoolName }</option>
									</c:when>
									<c:otherwise>
										<option value="${school.schoolCode }">${school.schoolName }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="bz" id="bz"value="${user.bz }" placeholder="这里输入备注" maxlength="64" title="备注"/></td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="cqtwindow2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	</form>
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
</body>
</html>