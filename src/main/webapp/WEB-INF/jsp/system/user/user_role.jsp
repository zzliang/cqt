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
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>

		
		<style type="text/css">
			footer{height:50px;position:fixed;bottom:0px;left:0px;width:100%;text-align: center;}
			.btn2{width:50px; height:30px; margin-top:10px; cursor:pointer;}
		</style>
		
		<script type="text/javascript">
			$(top.hangge());
			$(document).ready(function(){
				//移到右边
			    $('#add').click(function() {
			    //获取选中的选项，删除并追加给对方
			        $('#select1 option:selected').appendTo('#select2');
			    });
			    //移到左边
			    $('#remove').click(function() {
			        $('#select2 option:selected').appendTo('#select1');
			    });
			    //全部移到右边
			    $('#add_all').click(function() {
			        //获取全部的选项,删除并追加给对方
			        $('#select1 option').appendTo('#select2');
			    });
			    //全部移到左边
			    $('#remove_all').click(function() {
			        $('#select2 option').appendTo('#select1');
			    });
			    //双击选项
			    $('#select1').dblclick(function(){ //绑定双击事件
			        //获取全部的选项,删除并追加给对方
			        $("option:selected",this).appendTo('#select2'); //追加给对方
			    });
			    //双击选项
			    $('#select2').dblclick(function(){
			       $("option:selected",this).appendTo('#select1');
			    });
			});
		</script>
	</head>
<body>
	<div id="cqtwindow">
		<div>
			<form>
				<div style="width:120px;height:200px;float:left;">&nbsp;</div>
		        <div>
		          <select multiple="multiple" id="select1" style="width:150px;height:300px;float:left;padding:4px; ">
		          	<c:forEach items="${roleList}" var="role">
		          		<c:set var="stau" value="false" />
		          		<c:forEach items="${selectRoleList}" var="selectRole">
		          			<c:if test="${role.roleId==selectRole.roleId }">
		          				<c:set var="stau" value="true" />
		          			</c:if>
		          		</c:forEach>
		          		<c:if test="${stau=='false'}" >
							<option value="${role.roleId }" >${role.roleName }</option>
						</c:if>
					</c:forEach>
		          </select>
		        </div>
		        
		        <div style="margin-top:70px;text-align: center;float:left;padding-left:10px;padding-right:10px;"> 
		        	<span id="add"><input type="button" style="width:50px; height:30px; margin-top:10px; cursor:pointer;" value=">"/></span><br />
		            <span id="add_all"><input type="button" style="width:50px; height:30px; margin-top:10px; cursor:pointer;" value=">>"/></span> <br />
		            <span id="remove"><input type="button" style="width:50px; height:30px; margin-top:10px; cursor:pointer;" value="<"/></span><br />
		            <span id="remove_all"><input type="button" style="width:50px; height:30px; margin-top:10px; cursor:pointer;" value="<<"/></span> 
		        </div>
		        
		        <div>
		          <select multiple="multiple" id="select2" style="width: 150px;height:300px; float:left;padding:4px;">
			          <c:forEach items="${selectRoleList }" var="selectRole">
			          	<option value="${selectRole.roleId }" >${selectRole.roleName }</option>
			          </c:forEach>
		          </select>
		        </div>
			</form>
		</div>
	</div>
	<div id="cqtwindow2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	<div style="margin-top:10px;clear:both">
		<div style="text-align:center;color:red;"><span id="system_tip_id"></span></div>
	</div>
	<footer>
		<div style="width: 100%;" class="center">
			<a class="btn btn-primary" onclick="save();">保存</a>
			<a class="btn btn-danger" onclick="top.Dialog.close();">取消</a>
		</div>
	</footer>	
	
	
	<script type="text/javascript">
	
	function save(){
		var userId = "${pd.userId}";
		var userType = "${pd.userType}";
		var selOptionNum = 0;
		var roleIds = $("#select2 option").map(function(index){
			selOptionNum = index;
		     return $(this).val();
		 }).get().join(",")
		 
		 /* if(userType=='system' && selOptionNum>0){
			 $("#system_tip_id").text("system类型用户只能分配一个角色！");
			 return false;
		 } */
		 
		var url = "<%=basePath%>user/saveUserRole.do";
		var postData;
		
		postData = {"userId":userId,"roleIds":roleIds};
		
		$("#cqtwindow").hide();
		$("#cqtwindow2").show();
		$.post(url,postData,function(data){
			//if(data && data=="success"){
				top.Dialog.close();
			//}
		});
	}
		
	</script>
</body>

</html>