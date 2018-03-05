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
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%>   
	</head>
<body>
		
<div class="container-fluid" id="main-container">

		
<div id="page-content">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center">序号</th>
			<th>角色</th>
			<!-- <th class="center" bgcolor="#FFBF00">父角色</th>
			<th class="center" bgcolor="#EFFFBF">级别</th> -->
			<!-- <th class="center" bgcolor="#BFEFFF">邮件</th>
			<th class="center" bgcolor="#EFBFFF">短信</th>
			<th class="center" bgcolor="#BFEFFF" title="每天可发条数">站内信</th>
			<th class="center">增</th>
			<th class="center">删</th>
			<th class="center">改</th>
			<th class="center">查</th> -->
			<th style="width:255px;"  class="center">操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty roleList}">
				<c:forEach items="${roleList}" var="var" varStatus="vs">
				<tr>
				<td class='center' style="width:30px;">${vs.index+1}</td>
				<td>${var.roleName }</td>
				<%-- <td style="width:60px;" class="center"><label>${var.parentName }</label></td>
				<td style="width:60px;" class="center"><label>${var.level }</label></td> --%>
				
				<td style="width:155px;">
					<a class="btn btn-mini btn-purple" onclick="editRights('${var.roleId }');"><i class="icon-pencil"></i>菜单权限</a>
					<a class="btn btn-mini btn-purple" onclick="editIdentityRights('${var.roleId }');"><i class="icon-pencil"></i>身份权限</a>
					<a class='btn btn-mini btn-info' title="编辑" onclick="editRole('${var.roleId }');"><i class='icon-edit'></i></a>
					<a class='btn btn-mini btn-danger' title="删除" onclick="delRole('${var.roleId }','c','${var.roleName }');"><i class='icon-trash'></i></a>
				</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="100" class="center" >没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
			
		<div class="page-header position-relative">
		<c:if test="${pd.userType == 'super' }">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;"><a class="btn btn-small btn-success" onclick="addRole('${pd.roleId }');">新增</a></td>
			</tr>
		</table>
		</c:if>
		</div>
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script src="static/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		
		<script type="text/javascript">
		
		top.hangge();

		
		//新增角色
		function addRole(parentId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增角色";
			 diag.URL = '<%=basePath%>role/toAdd.do?parentId='+parentId;
			 diag.Width = 222;
			 diag.Height = 90;
			 diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('cqtwindow').style.display == 'none'){
					top.jzts();
					setTimeout("self.location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function editRole(roleId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>role/toEdit.do?roleId='+roleId;
			 diag.Width = 222;
			 diag.Height = 90;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('cqtwindow').style.display == 'none'){
					top.jzts();
					setTimeout("self.location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delRole(roleId,msg,roleName){
			bootbox.confirm("确定要删除["+roleName+"]吗?", function(result) {
				if(result) {
					var url = "<%=basePath%>role/delete.do?roleId="+roleId+"&dt="+new Date().getTime();
					top.jzts();
					$.get(url,function(data){
						if("success" == data.result){
							if(msg == 'c'){
								top.jzts();
								document.location.reload();
							}else{
								top.jzts();
								window.location.href="role.do";
							}
							
						}else if("false1" == data.result){
							top.hangge();
							bootbox.dialog("删除失败，请先删除此角色下的子角色!", 
									[
									  {
										"label" : "关闭",
										"class" : "btn-small btn-success",
										"callback": function() {
											//Example.show("great success");
											}
										}]
								);
						}else if("false2" == data.result){
							top.hangge();
							bootbox.dialog("删除失败，请先删除此角色下的用户!", 
									[
									  {
										"label" : "关闭",
										"class" : "btn-small btn-success",
										"callback": function() {
											//Example.show("great success");
											}
										}]
								);
						}
					});
				}
			});
		}
		
		//菜单权限
		function editRights(roleId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = "菜单权限";
			 diag.URL = '<%=basePath%>role/auth.do?roleId='+roleId;
			 diag.Width = 280;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//身份权限
		function editIdentityRights(roleId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = "身份权限";
			 diag.URL = '<%=basePath%>role/identity.do?roleId='+roleId;
			 diag.Width = 280;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		</script>
	</body>
</html>

