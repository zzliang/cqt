<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
					<form action="courseGroup/list.do" name="courseGroupForm" id="courseGroupForm" method="post">
						<!-- 检索  -->
						<table class="comTable">
							<tr>
								<td><span class="input-icon"> <input autocomplete="off" id="nav-search-input" type="text" name="KEYWORD" value="${pd.KEYWORD }" placeholder="这里输入关键词" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
							</tr>
						</table>
						<table id="table_report" class="comTable">
							<thead>
								<tr>
									<th width="50"></th>
									<th width="80">
										<div class="checkbox-holder">
											<p class="radiobox">
												<input type="checkbox" id="selAll" name="selAll" onclick="CheckedAll()"  class="regular-radio">
												<label for="selAll">
													<span class="radio-word">全选</span>
												</label>
											</p>
										</div>
									</th>
									<th width="80">序号</th>
									<th width="500">课程组</th>
									<th class="center">操作</th>
									<th width="50"></th>
								</tr>
							</thead>

							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty courseGroupList}">
										<c:forEach items="${courseGroupList}" var="courseGroup" varStatus="vs">
											<tr>
												<td></td>
												<td class='center' style="width: 30px;">
												<div class="checkbox-holder">
													<p class="radiobox">
														<input type="checkbox" id="radio-2-a" name="radio-1-set" onclick="setSelectAll();" class="regular-radio">
														<label for="radio-2-a">
														</label>
													</p>
												</div>
												</td>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<%-- <td><a href="javascript:void(0);" onclick="editCourseGroup('${courseGroup.courseGroupId}');" title="编辑">${course.courseGroup.courseGroupName }</a></td> --%>
												<%-- <td><a href="javascript:void(0);" onclick="viewCourse('${course.courseId }');" title="查看">${course.courseName }</a></td> --%>
												<td>${courseGroup.courseGroupName }</td>
												<td style="width: 60px;">
													<div class='hidden-phone visible-desktop btn-group'>
														<a class='chaTbtn' title="修改" onclick="editCourseGroup('${courseGroup.courseGroupId }');">修改</a> 
														<a class='deTbtn' title="删除" onclick="delCourseGroup('${courseGroup.courseGroupId }','${courseGroup.courseGroupName }');">删除</a>
													</div>
												</td>
												<td></td>
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

						<div class="page-header position-relative">
							<div class="z btnBox">
								<a href="#" class="comBtn" onclick="addCourseGroup();">新增课程组</a>
								<a href="#" class="comBtn" onclick="delAll('确定要删除选中的数据吗?');">批量删除</a>
							</div>
							<div class="y pagination" style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div>
								
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 返回顶部  -->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"><i class="icon-double-angle-up icon-only">返回顶部</i></a>

	<!-- 引入 -->
	<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
	<!-- 引入 -->


	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#courseGroupForm").submit();
		}
		
		//添加课程组信息
		function addCourseGroup(){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="添加课程组";
			diag.URL = '<%=basePath%>courseGroup/goAdd.do';
			diag.Width = 400;
			diag.Height = 300;
			diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('cqtwindow').style.display == 'none'){
					nextPage('${page.currentPage}');
				}
				diag.close();
			};
			diag.show();
		}
		
		//修改课程组信息
		function editCourseGroup(courseGroupId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>courseGroup/goEdit.do?courseGroupId='+courseGroupId;
			 diag.Width = 400;
			 diag.Height = 300;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('cqtwindow').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage('${page.currentPage}');
					 }
				}
				diag.close();
			 }; 
			 diag.show();		 
		}
		
		
		//删除
		function delCourseGroup(courseGroupId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>courseGroup/delete.do?courseGroupId="+courseGroupId+"&tm="+new Date().getTime();
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
					for(var i=0;i < document.getElementsByName('ids').length;i++){
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
								url: '<%=basePath%>courseGroup/deleteAll.do?tm='+ new Date().getTime(),
								data : {courseGroupIds : ids},
								dataType : 'json',
								cache : false,
								success : function(data) {
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
	
	</script>
	
	<script type="text/javascript">
			function CheckedAll(){
				var obj=document.getElementsByName("radio-1-set"); 
				if(document.getElementById("selAll").checked == false){
					for(var i = 0; i<obj.length;i++){
						obj[i].checked=false; 

					}
				}
				else{
					for(var i=0; i<obj.length; i++) 
					{	  
						obj[i].checked=true; 
					}	
				}
			}
			//当选中所有的时候，全选按钮会勾上 
			function setSelectAll() 
			{ 
				var obj=document.getElementsByName("radio-1-set"); 
				var count = obj.length; 
				var selectCount = 0; 

				for(var i = 0; i < count; i++) 
				{ 
					if(obj[i].checked == true) 
					{ 
						selectCount++;	
					} 
				} 
				if(count == selectCount) 
				{	
					document.all.selAll.checked = true; 
				} 
				else 
				{ 
					document.all.selAll.checked = false; 
				} 
			}
		</script>
	
	
</body>
</html>

