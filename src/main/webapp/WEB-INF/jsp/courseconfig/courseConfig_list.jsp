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
	<%@ include file="../system/admin/top.jsp"%> 
	</head> 
<body>
		
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
			<!-- 检索  -->
			<form action="course/listCourseConfig.do" name="courseConfigForm" id="courseConfigForm" method="post" >
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="KEYWORD" value="${pd.KEYWORD }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
				</tr>
			</table>
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th></th>
						<th>序号</th>
						<th>年月份</th>
						<th>开始日期</th>
						<th>结束日期</th>
						<th>周数</th>
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty courseConfigList}">
						<c:forEach items="${courseConfigList}" var="courseConfig" varStatus="vs">
							<tr>
								<td class='center' style="width: 30px;">
									<label><input type='checkbox' name='ids' value="${courseConfig.courseConfigId }"/><span class="lbl"></span></label>
								</td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td>${courseConfig.courseDate}</td>
								<td><fmt:formatDate value="${courseConfig.startDate }" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${courseConfig.endDate }" pattern="yyyy-MM-dd"/></td>
								<td>${courseConfig.weeks}</td>
								<td style="width: 60px;">
									<div class='hidden-phone visible-desktop btn-group'>
										<c:if test="${courseConfig.isEdit }"></c:if>
										<a class='btn btn-mini btn-info' title="编辑" onclick="editCourseConfig('${courseConfig.courseConfigId  }');"><i class='icon-edit'></i></a>
										<a class='btn btn-mini btn-danger' title="删除" onclick="delCourseConfig('${courseConfig.courseConfigId  }','${courseConfig.courseDate }');"><i class='icon-trash'></i></a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="10" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			
		<%-- <div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;">
					<a class="btn btn-small btn-success" onclick="addCourse();">新增</a>
					<a class="btn btn-small btn-success" onclick="addCourseGroup();">新增课程组</a>
					<a title="批量删除" class="btn btn-small btn-danger" onclick="delAll('确定要删除选中的数据吗?');" ><i class='icon-trash'></i></a>
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div> --%>
		</form>
	</div>
  </div>
</div>
</div>
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		
		
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#courseForm").submit();
		}
		
		//新增
		function addCourse(){
			 $(location).attr('href', '<%=basePath%>course/goAddCourseConfig.do');
		}
		
		
		//查看详情
		function viewCourseConfig(courseConfigId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>course/goViewCourseConfig.do?courseConfigId='+courseConfigId;
			 diag.Width = 225;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('cqtwindow').style.display == 'none'){
					//nextPage('${page.currentPage}');
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function editCourse(courseConfigId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>course/goEditCourseConfig.do?courseConfigId='+courseConfigId;
			 diag.Width = 225;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('cqtwindow').style.display == 'none'){
					nextPage('${page.currentPage}');
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delCourse(courseConfigId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>course/deleteCourseConfig.do?courseConfigId="+courseConfigId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage('${page.currentPage}');
					});
				}
			});
		}
		
		//批量操作
		function delAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var ids = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(ids=='') ids += document.getElementsByName('ids')[i].value;
						  	else ids += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(ids==''){
						bootbox.dialog("您没有选择任何内容!", 
							[{
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {}
								}]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>course/deleteAllCourseConfig.do?tm='+new Date().getTime(),
						    	data: {courseConfigIds:ids},
								dataType:'json',
								cache: false,
								success: function(data){
									//alert(JSON.stringify(data));
									nextPage('${page.currentPage}');
								}
							});
						}
					}
				}
			});
		}
		</script>
		
		<script type="text/javascript">
		$(function() {
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
			});
		});
		</script>
		
	</body>
</html>

