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
		<style>
			.edit_style {
				position:absolute;
				border: 1px solid #99bce8;
				font-size: 12px;
				line-height: 18px;
				color: #333;
				text-align: left;
				padding:2px;
			}
		</style>
		<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		
		<!-- <script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.min.js"> </script>
		<script type="text/javascript" charset="utf-8" src="plugins/ueditor/lang/zh-cn/zh-cn.js"></script> -->
		
		<script type="text/javascript">
			 $(top.hangge()); 
			
			//保存
			function save(){
				var pName = $("#sfdmId option:selected").text()
				$("#provinceName").val(pName);
				$("#schoolForm").submit();
				/* $("#cqtwindow").hide();
				$("#cqtwindow2").show(); */
			}
		</script>
	</head>
<body>
	<form action="school/${msg}.do" name="schoolForm" id="schoolForm" method="post">
		<input type="hidden" name="schoolId" id="schoolId" value="${school.schoolId }"/>
		<input type="hidden" name="provinceName" id="provinceName" value=""/>
		
		<div id="cqtwindow">
		<table style="margin:10px auto;">
			<tr>
				<td><span>学校名称：</span></td>
				<td><input type="text" name="schoolName" id="schoolName" value="${school.schoolName }" placeholder="请输入学校名称"/></td>
			</tr>
			<tr>
				<td><span>省份名称：</span></td>
				<td>
					<select id="sfdmId" name="provinceCode">
						<option value="0">请选择省份</option>
						<c:if test="${not empty sfdmList }">
							<c:forEach items="${sfdmList }" var="map" varStatus="st">
								<c:choose>
									<c:when test="${school.provinceCode==map.bianma }">
										<option value="${map.bianma }" selected="selected">${map.zdName }</option>
									</c:when>
									<c:otherwise>
										<option value="${map.bianma }">${map.zdName }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</select>
				</td>
			</tr>
			<tr>
				<td><span>学校地址：</span></td>
				<td><input type="text" name="address" id="address" value="${school.address }"  placeholder="请输入址址"/></td>
			</tr>
			<tr>
				<td><span>邮箱地址1：</span></td>
				<td><input type="email" name="email1" id="email1"  value="${school.email1 }" datatype="e" placeholder="请输入邮箱地址1"/></td>
			</tr>
			<tr>
				<td><span>邮箱地址2：</span></td>
				<td><input type="email" name="email2" id="email2"  value="${school.email2 }"  datatype="e" placeholder="请输入邮箱地址2"/></td>
			</tr>
			<tr>
				<td><span>联系电话1：</span></td>
				<td><input type="text" name="tel1" id="tel1"  value="${school.tel1 }" placeholder="请输入联系电话1"/></td>
			</tr>
			<tr>
				<td><span>联系电话2：</span></td>
				<td><input type="text" name="tel2" id="tel2" value="${school.tel2 }"  placeholder="请输入联系电话2"/></td>
			</tr>
			<tr>
				<td><span>传真：</span></td>
				<td><input type="text" name="fax" id="fax"  value="${school.fax }" placeholder="请输入传真"/></td>
			</tr>
			<tr>
				<td><span>邮编：</span></td>
				<td><input type="text" name="post" id="post"  value="${school.post }" placeholder="请输入邮编"/></td>
			</tr>
			<tr>
				<td><span>学校网址：</span></td>
				<td><input type="text" name="web" id="web"  value="${school.web }" placeholder="请输入网址"/></td>
			</tr>
			<tr>
				<td><span>信用代码：</span></td>
				<td><input type="text" name="businessLicense" id="businessLicense" value="${school.businessLicense}"  placeholder="请输入统一社会信用代码"/></td>
			</tr>
			<tr>
				<td><span>创办日期：</span></td>
				<td><input type="date" name="createDate" id="createDate"  value="<fmt:formatDate value='${school.createDate}' type='date' pattern='yyyy-MM-dd'/>" placeholder="请输入日期"/></td>
			</tr>
			
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="window.history.back()">取消</a>
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
		<!-- <script src="plugins/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="plugins/jquery-validation/dist/localization/messages_zh.js"></script> -->
		
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		
		<script type="text/javascript">
			//$("#schoolForm").Validform();
			
			//UE.getEditor('editor',{toolbars:[['undo','forecolor','backcolor','date','time','bold','italic','underline','fontborder','strikethrough']]});
		</script>
	
</body>
</html>