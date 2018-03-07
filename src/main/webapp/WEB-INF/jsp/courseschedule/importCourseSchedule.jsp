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
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<!-- <link rel="stylesheet" href="static/css/ace.min.css" /> -->
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<!-- ace styles(上传excel窗口样式使用) -->
		<link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
		
		<script type="text/javascript">
			
			//保存
			function save(){
				if($("#excel").val()=="" || document.getElementById("excel").files[0] =='请选择xls或xlsx格式的文件'){
					$("#excel").tips({
						side:3,
			            msg:'请选择文件',
			            bg:'#AE81FF',
			            time:3
			        });
					return false;
				}
				
				var excel = document.Form.excel.files[0];
				var fm = new FormData();
			    fm.append('excel', excel);
			    $.ajax({
			      type: "POST",
			      url: "course/importCourseSchedule.do",
			      data: fm,
			      contentType: false, //禁止设置请求类型
		          processData: false, //禁止jquery对DAta数据的处理,默认会处理
			      success: function (data) {
			        if("success"==data.msg){
						$("#cqtwindow").hide();
						$("#cqtwindow2").show();
						top.Dialog.close();
			        }else{
			        	$.each(data.errors,function (index,error){
			        		var errMsg = "<p><span>"+error+"</span></p>";
			        		$("#errors").append(errMsg);
			        	});
			        }
			      }
			    });
			}
			
			function fileType(obj){
				var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
			    if(fileType != '.xls'){
			    	$("#excel").tips({
						side:3,
			            msg:'请上传xls或xlsx格式的文件',
			            bg:'#AE81FF',
			            time:3
			        });
			    	$("#excel").val('');
			    	document.getElementById("excel").files[0] = '请选择xls或xlsx格式的文件';
			    }
			}
		</script>
	</head>
<body>
	<form action="" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<div id="cqtwindow">
		<table style="width:95%;" >
			
			<tr>
				<td style="padding-top: 20px;"><input type="file" id="excel" name="excel" style="width:50px;" onchange="fileType(this)" /></td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">导入</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					<a class="btn btn-mini btn-success" onclick="window.location.href='<%=basePath%>/user/downExcel.do'">下载模版</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="cqtwindow2" class="center" style="display:none"><br/><img src="static/images/jzx.gif" /><br/><h4 class="lighter block green"></h4></div>
		
		<div id="errors" style="text-align:center;"></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
		<script src="static/js/bootstrap.min.js"></script>
		<!-- ace scripts -->
		<script src="static/assets/js/ace/elements.fileinput.js"></script>
		<script src="static/assets/js/ace/ace.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//上传
			$('#excel').ace_file_input({
				no_file:'请选择EXCEL ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'xls|xlsx',
				blacklist:'gif|png|jpg|jpeg'
			});
			
		});
		
		</script>
	
</body>
</html>