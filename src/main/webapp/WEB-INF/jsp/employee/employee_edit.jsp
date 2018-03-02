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
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	$(top.hangge());
	
	//保存
	function save(){
		$("#employeeForm").submit();
		/* $("#cqtwindow").hide();
		$("#cqtwindow2").show(); */
	}
</script>
	</head>
<body>
	<form action="employee/${msg }.do" name="employeeForm" id="employeeForm" method="post">
		<input type="hidden" name="employeeId" id="employeeId" value="${employee.employeeId }"/>
		<div id="cqtwindow">
		<table>
			<tr>
				<td><span>职员工号：</span></td>
				<td><input type="text" name="empNumber" id="empNumber" value="${employee.empNumber }" /></td>
			</tr>
			<tr>
				<td><span>真实姓名：</span></td>
				<td><input type="text" name="relName" id="relName" value="${employee.relName }" /></td>
			</tr>
			<tr>
				<td><span>身份证号：</span></td>
				<td><input type="text" name="idNumber" id="idNumber" value="${employee.idNumber }" /></td>
			</tr>
			<tr>
				<td><span>考勤卡号：</span></td>
				<td><input type="text" name="timeCard" id="timeCard" value="${employee.timeCard }"  /></td>
			</tr>
			<tr>
				<td><span>性别：</span></td>
				<td>
					<select id="sexId" name="sex" >
						<option value="-1">请选择性别</option>
						<c:choose>
						<c:when test="${not empty employee.sex}">
							<c:choose>
								<c:when test="${employee.sex==false }">
									<option value="0" selected="selected">女</option>
									<option value="1">男</option>
								</c:when>
								<c:otherwise>
									<option value="1" selected="selected">男</option>
									<option value="0">女</option>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<option value="1">男</option>
							<option value="0">女</option>
						</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<td><span>出生日期：</span></td>
				<td><input type="date" name="birth" id="birth"  value="<fmt:formatDate value='${employee.birth}' type='date' pattern='yyyy-MM-dd'/>" /></td>
			</tr>
			<tr>
				<td><span>民族：</span></td>
				<td><input type="text" name="nation" id="nation"  value="${employee.nation }" /></td>
			</tr>
			<tr>
				<td><span>政治面貌：</span></td>
				<td><input type="text" name="political" id="political"  value="${employee.political }" /></td>
			</tr>
			<tr>
				<td><span>婚姻状况：</span></td>
				<td>
					<select id="marriageId" name="marriage">
						<option value="-1">婚姻是否</option>
						<c:choose>
						<c:when test="${not empty employee.marriage }">
							<c:choose>
								<c:when test="${employee.marriage==false }">
									<option value="0" selected="selected">否</option>
									<option value="1">是</option>
								</c:when>
								<c:otherwise>
									<option value="1" selected="selected">是</option>
									<option value="0">否</option>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<option value="1">是</option>
							<option value="0">否</option>
						</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<td><span>籍贯：</span></td>
				<td><input type="text" name="nativePlace" id="nativePlace"  value="${employee.nativePlace }" /></td>
			</tr>
			<tr>
				<td><span>家庭住址：</span></td>
				<td><input type="text" name="homeAddress" id="homeAddress"  value="${employee.homeAddress }" /></td>
			</tr>
			<tr>
				<td><span>联系人：</span></td>
				<td><input type="text" name="contacts" id="contacts"  value="${employee.contacts }" /></td>
			</tr>
			<tr>
				<td><span>联系人电话：</span></td>
				<td><input type="text" name="contactsPhone" id="contactsPhone" value="${employee.contactsPhone }"/></td>
			</tr>
			<tr>
				<td><span>个人爱好：</span></td>
				<td><input type="text" name="personalHobby" id="personalHobby" value="${employee.personalHobby }"/></td>
			</tr>
			<tr>
				<td><span>手机号：</span></td>
				<td><input type="text" name="phone" id="phone" value="${employee.phone }"/></td>
			</tr>
			<tr>
				<td><span>邮箱：</span></td>
				<td><input type="text" name="email" id="email" value="${employee.email }"/></td>
			</tr>
			<tr>
				<td><span>职员类别：</span></td>
				<td><input type="text" name="workerType" id="workerType" value="${employee.workerType }"/></td>
			</tr>
			<tr>
				<td><span>工作岗位：</span></td>
				<td><input type="text" name="post" id="post" value="${employee.post }"/></td>
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
		<script src="static/js/Validform/Validform_v5.3.2_min.js"></script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		
		<script type="text/javascript">
		</script>
	
</body>
</html>