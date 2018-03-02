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
				<td><span>学校名称：</span></td>
				<td>${student.studentName }</td>
			</tr>
			<tr>
				<td><span>省份名称：</span></td>
				<td>${student.provinceName }</td>
			</tr>
			<tr>
				<td><span>学校地址：</span></td>
				<td>${student.address }</td>
			</tr>
			<tr>
				<td><span>邮箱地址1：</span></td>
				<td>${student.email1 }</td>
			</tr>
			<tr>
				<td><span>邮箱地址2：</span></td>
				<td>${student.email2 }</td>
			</tr>
			<tr>
				<td><span>联系电话1：</span></td>
				<td>${student.tel1 }</td>
			</tr>
			<tr>
				<td><span>联系电话2：</span></td>
				<td>${student.tel2 }</td>
			</tr>
			<tr>
				<td><span>传真：</span></td>
				<td>${student.fax }</td>
			</tr>
			<tr>
				<td><span>邮编：</span></td>
				<td>${student.post }</td>
			</tr>
			<tr>
				<td><span>学校网址：</span></td>
				<td>${student.web }</td>
			</tr>
			<tr>
				<td><span>信用代码：</span></td>
				<td>${student.businessLicense}</td>
			</tr>
			<tr>
				<td><span>创办日期：</span></td>
				<td><fmt:formatDate value='${student.createDate}' type='date' pattern='yyyy-MM-dd'/></td>
			</tr>
			
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
		</table>
	</div>
		
	<div id="cqtwindow2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	
</body>
</html>