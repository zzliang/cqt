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
			<form action="employee/listEmployee.do" method="post" name="employeeForm" id="employeeForm">
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
						<th>职员工号</th>
						<th>真实姓名</th>
						<th>身份证号</th>
						<th>考勤卡号</th>
						<th>性别</th>
						<th>出生日期</th>
						<th>民族</th>
						<th>婚姻状况</th>
						<th>籍贯</th>
						<th>家庭住址</th>
						<th>联系人</th>
						<th>手机号</th>
						<th>邮箱</th>
						<th>员工类别</th>
						<th>工作岗位</th>
						<th>员工状态</th>
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty employeeList}">
						<c:forEach items="${employeeList}" var="employee" varStatus="vs">
							<tr>
								<td class='center' style="width: 30px;">
									<label><input type='checkbox' name='ids' id="ids" value="${employee.employeeId }"/><span class="lbl"></span></label>
								</td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td>${employee.empNumber }</td>
								<td><a href="javascript:void(0);" onclick="viewEmployee('${employee.employeeId }');" title="查看">${employee.relName }</a></td>
								<td>${employee.idNumber }</td>
								<td>${employee.timeCard }</td>
								<td><c:choose><c:when test="${employee.sex==false }">女</c:when><c:otherwise>男</c:otherwise></c:choose></td>
								<td><fmt:formatDate value="${employee.birth }" type="date" pattern="yyyy-MM-dd"/></td>
								<td>${employee.nation }</td>
								<td><c:choose><c:when test="${employee.marriage==false }">否</c:when><c:otherwise>是</c:otherwise></c:choose></td>
								<td>${employee.nativePlace }</td>
								<td>${employee.homeAddress }</td>
								<td>${employee.contacts }</td>
								<td>${employee.phone }</td>
								<td>${employee.email }</td>
								<td>${employee.workerType }</td>
								<td>${employee.post }</td>
								<td><c:choose><c:when test="${employee.status==false }">未启用</c:when><c:otherwise>启用</c:otherwise></c:choose></td>
								<td style="width: 60px;">
									<div class='hidden-phone visible-desktop btn-group'>
										<a class='btn btn-mini btn-info' title="编辑" onclick="editEmployee('${employee.employeeId }');"><i class='icon-edit'></i></a>
										<a class='btn btn-mini btn-danger' title="删除" onclick="delEmployee('${employee.employeeId }','${employee.relName }');"><i class='icon-trash'></i></a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="19" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;">
					<a class="btn btn-small btn-success" onclick="addEmployee();">新增</a>
					<a title="批量删除" class="btn btn-small btn-danger" onclick="delAll('确定要删除选中的数据吗?');" ><i class='icon-trash'></i></a>
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
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
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
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
			$("#employeeForm").submit();
		}
		
		//新增
		function addEmployee(){
			 <%-- top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>employee/goAddEmployee.do';
			 diag.Width = 500;
			 diag.Height = 600;
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
			 diag.show(); --%>
			 $(location).attr('href', '<%=basePath%>employee/goAddEmployee.do');
		}
		
		//查看详情
		function viewEmployee(employeeId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>employee/goViewEmployee.do?employeeId='+employeeId;
			 diag.Width = 500;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('cqtwindow').style.display == 'none'){
					//nextPage('${page.currentPage}');
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function editEmployee(employeeId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>employee/goEditEmployee.do?employeeId='+employeeId;
			 diag.Width = 500;
			 diag.Height = 700;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('cqtwindow').style.display == 'none'){
					nextPage('${page.currentPage}');
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delEmployee(employeeId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>employee/deleteEmployee.do?employeeId="+employeeId+"&tm="+new Date().getTime();
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
								url: '<%=basePath%>employee/deleteAllEmployee.do?tm='+new Date().getTime(),
						    	data: {employeeIds:ids},
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

