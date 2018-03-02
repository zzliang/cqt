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
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</head>

<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		if($("#zdName").val()==""){
			
			$("#zdName").tips({
				side:3,
	            msg:'请输入名称',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#zdName").focus();
			return false;
		}
		
		if($("#bianma").val()=="" || $("#bianma").val()=="此编码已存在!"){
			
			$("#bianma").tips({
				side:3,
	            msg:'请输入编码',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#bianma").focus();
			$("#bianma").val('');
			$("#bianma").css("background-color","white");
			return false;
		}
		
		if($("#orderBy").val()==""){
			
			$("#orderBy").tips({
				side:1,
	            msg:'请输入序号',
	            bg:'#AE81FF',
	            time:2
	        });
			
			
			$("#orderBy").focus();
			return false;
		}
		
		if(isNaN(Number($("#orderBy").val()))){
			
			$("#orderBy").tips({
				side:1,
	            msg:'请输入数字',
	            bg:'#AE81FF',
	            time:2
	        });
			
			
			$("#orderBy").focus();
			$("#orderBy").val(1);
			return false;
		}
		
		has();
		
	}
	
	//判断编码是否存在
	function has(){
		var zdId = $("#zdId").val();
		var bianma = $("#bianma").val();
		var url = "dictionaries/has.do?bianma="+bianma+"&zdId="+zdId+"&tm="+new Date().getTime();
		$.get(url,function(data){
			if(data=="error"){
				$("#bianma").css("background-color","#D16E6C");
				
				setTimeout("$('#bianma').val('此编码已存在!')",500);
				
			}else{
				$("#Form").submit();
				$("#cqtwindow").hide();
				$("#cqtwindow2").show();
			}
		});
	}
	
</script>


<body>
	<form  action="dictionaries/save.do" name="Form" id="Form" method="post" >
		<input type="hidden" name="zdId" id="zdId" value="${pd.zdId }"/>
		<input type="hidden" name="parentId" id="parentId" value="${pd.parentId }"/>
		<div id="cqtwindow">
		<table>
			<tr class="info">
				<td><input type="text" name="zdName" id="zdName" placeholder="这里输入名称" value="${pd.zdName }" title="名称"/></td>
			</tr>
			<tr class="info">
				<td><input type="text" name="bianma" id="bianma" placeholder="这里输入编码" value="${pd.bianma }" title="编码"/></td>
			</tr>
			<tr class="info">
				<td><input type="number" name="orderBy" id="orderBy" placeholder="这里输入序号" value="${pd.orderBy}" title="序号"/></td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="cqtwindow2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
	</form>
</body>
<script type="text/javascript">
	var msg = '${msg}';
	if(msg == 'no'){
		$("#bianma").attr("readonly",true);
	}

</script>
</html>