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
		<title>添加学生</title>
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/js/jquery-ui-1.10.2.custom.min.js"></script>
		
		<script type="text/javascript">
			$(top.hangge());
			//保存
			function save(){
				var groupName = $("#courseGroupSelect option:selected").text()
				$("#courseGroupName").val(groupName);
				$("#courseForm").submit();
				$("#cqtwindow").hide();
				$("#cqtwindow2").show();
			}
		</script>
	</head>
<body>
	<form action="${action }.do" id="courseForm" name="courseForm" method="post">
		<input type="hidden" id="courseGroupName" name="courseGroupName" value=""/>
		<input type="hidden" id="courseId" name="courseId" value="${course.courseId }"/>
		<div id="cqtwindow" style="margin:10px">
		<table>
			<tr>
				<td><label>课程组选择：</label></td>
				<td>
					<select id="courseGroupSelect" name="courseGroupId">
						<option value="">请选择课程组</option>
						<c:forEach items="${courseGroupList }" var="item" varStatus="st">
							<c:choose>
								<c:when test="${item.courseGroupId==course.courseGroup.courseGroupId }">
									<option value="${item.courseGroupId }" selected="selected">${item.courseGroupName }</option>
								</c:when>
								<c:otherwise>
									<option value="${item.courseGroupId }">${item.courseGroupName }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td><label>课程名称：</label></td>
				<td><input type="text" id="courseName" name="courseName" value="${course.courseName }"/></td>
			</tr>
			
			
			<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="cqtwindow2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	
	<!-- 引入 -->
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
</body>
</html>