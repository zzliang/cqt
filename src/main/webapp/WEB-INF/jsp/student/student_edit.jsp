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
	//$("#tabs").tabs();
	
	//保存
	function save(){
		$("#studentForm").submit();
		$("#cqtwindow").hide();
		$("#cqtwindow2").show();
	}
</script>
	</head>
<body>
	<form action="student/${msg }.do" name="studentForm" id="studentForm" method="post">
		<div id="cqtwindow">
			<div class="span6">
				<div class="widget-box transparent">
					<div class="widget-header">
						<h4 class="lighter">Tabs With Scroll</h4>
						<div class="widget-toolbar no-border">
							<ul class="nav nav-tabs" id="myTab2">
								<li class="active"><a data-toggle="tab" href="#home2">Home</a></li>
								<li><a data-toggle="tab" href="#profile2">Profile</a></li>
								<li><a data-toggle="tab" href="#info2">Info</a></li>
							</ul>
						</div>
					</div>
					<div class="widget-body">
					 <div class="widget-main">
						<div class="tab-content padding-4">
						  <div id="home2" class="tab-pane in active">
							<div class="slim-scroll" data-height="100">
								<b>TAB # 1</b>
								<p><span style="background-color: red">Tab1:</span><span><input type="text" id="tab1" name="tab1" value="" /></span></p>
							</div>
						  </div>
						  
						  <div id="profile2" class="tab-pane">
							<div class="slim-scroll" data-height="100">
								<b>TAB # 2</b>
								<p><span style="background-color: black">Tab2:</span><span><input type="text" id="tab1" name="tab1" value="" /></span></p>
							</div>
						  </div>
						  
						  <div id="info2" class="tab-pane">
							<div class="slim-scroll" data-height="100">
								<b>TAB # 3</b>
								<p><span style="background-color: yellow">Tab3:</span><span><input type="text" id="tab1" name="tab1" value="" /></span></p>
							</div>
						  </div>
					   </div>
					 </div>
					</div>
				</div>
			</div>
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