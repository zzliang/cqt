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
		<link rel="stylesheet" href="static/css/style.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		

	</head>
	<script>
		$(top.hangge());
	</script>
<body>
	<div id="cqtwindow" style="align-text:center;">
		<table>
			<tr>
				<td><span>员工工号：</span></td>
				<td><span>${employee.empNumber }</span></td>
			</tr>
			<tr>
				<td><span>员工姓名：</span></td>
				<td><span>${employee.relName }</span></td>
			</tr>
			<tr>
				<td><span>身份证号：</span></td>
				<td><span>${employee.idNumber }</span></td>
			</tr>
			<tr>
				<td><span>考勤卡号：</span></td>
				<td><span>${employee.timeCard }</span></td>
			</tr>
			<tr>
				<td><span>性别：</span></td>
				<td><span>
					<c:choose>
						<c:when test="${employee.sex==false}">女</c:when>
						<c:otherwise>男</c:otherwise>
					</c:choose>
				</span></td>
			</tr>
			<tr>
				<td><span>出生日期：</span></td>
				<td><span><fmt:formatDate value='${employee.birth}' type='date' pattern='yyyy-MM-dd'/></span></td>
			</tr>
			<tr>
				<td><span>民族：</span></td>
				<td><span>${employee.nation }</span></td>
			</tr>
			<tr>
				<td><span>政治面貌：</span></td>
				<td><span>${employee.political }</span></td>
			</tr>
			<tr>
				<td><span>婚姻状况：</span></td>
				<td><span>
					<c:choose>
						<c:when test="${employee.marriage==false}">否</c:when>
						<c:otherwise>是</c:otherwise>
					</c:choose>
				</span></td>
			</tr>
			<tr>
				<td><span>籍贯：</span></td>
				<td><span>${employee.nativePlace}</span></td>
			</tr>
			<tr>
				<td><span>家庭住址：</span></td>
				<td><span>${employee.homeAddress}</span></td>
			</tr>
			<tr>
				<td><span>联系人：</span></td>
				<td><span>${employee.contacts}</span></td>
			</tr>
			<tr>
				<td><span>联系人电话：</span></td>
				<td><span>${employee.contactsPhone}</span></td>
			</tr>
			<tr>
				<td><span>个人爱好：</span></td>
				<td><span>${employee.personalHobby}</span></td>
			</tr>
			<tr>
				<td><span>手机号：</span></td>
				<td><span>${employee.phone}</span></td>
			</tr>
			<tr>
				<td><span>邮箱：</span></td>
				<td><span>${employee.email}</span></td>
			</tr>
			<tr>
				<td><span>职员类别：</span></td>
				<td><span>${employee.workerType}</span></td>
			</tr>
			<tr>
				<td><span>工作岗位：</span></td>
				<td><span>${employee.post}</span></td>
			</tr>
			<tr>
				<td><span>员工状态：</span></td>
				<td><span>
					<c:choose>
						<c:when test="${employee.status==false}">未启用</c:when>
						<c:otherwise>启用</c:otherwise>
					</c:choose>
				</span></td>
			</tr>
			
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
		</table>
	</div>
		
		<div id="cqtwindow2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	
</body>
</html>