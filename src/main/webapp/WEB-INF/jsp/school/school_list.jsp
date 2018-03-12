<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../system/admin/top.jsp"%>
</head>

<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
<body>

	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<!-- 检索  -->
					<form action="school/list.do" method="post" name="schoolForm" id="schoolForm">
						<table>
							<tr>
								<td><span class="input-icon"> <input autocomplete="off" id="nav-search-input" type="text" name="KEYWORD" value="${pd.KEYWORD }" placeholder="这里输入关键词" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
							</tr>
						</table>
						<table id="table_report" class="table table-striped table-bordered table-hover">

							<thead>
								<tr>
									<th class="center"><label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></th>
									<th>序号</th>
									<th>编码</th>
									<th>学校名称</th>
									<th>省份名称</th>
									<th>地址</th>
									<th>邮箱1</th>
									<!-- <th>邮箱2</th> -->
									<th>电话1</th>
									<!-- <th>电话2</th> -->
									<th>邮编</th>
									<th>传真</th>
									<th>网址</th>
									<!-- <th>统一社会信用代码</th> -->
									<th>创办时间</th>
									<th class="center">操作</th>
								</tr>
							</thead>

							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty schoolList}">
										<c:forEach items="${schoolList}" var="school" varStatus="vs">
											<tr>
												<td class='center' style="width: 30px;"><label><input type='checkbox' name='ids' value="${school.schoolId }"/><span class="lbl"></span></label></td>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td>${school.schoolCode }</td>
												<td><a href="javascript:void(0);" onclick="viewSchool('${school.schoolId }');" title="查看">${school.schoolName }</a></td>
												<td>${school.provinceName }</td>
												<td>${school.address }</td>
												<td>${school.email1 }</td>
												<td>${school.tel1 }</td>
												<td>${school.post }</td>
												<td>${school.fax }</td>
												<td>${school.web }</td>
												<td><fmt:formatDate value="${school.createDate }" pattern="yyyy-MM-dd" /></td>
												<td style="width: 60px;">
													<div class='hidden-phone visible-desktop btn-group'>
														<a class='btn btn-mini btn-info' title="编辑" onclick="editSchool('${school.schoolId }');"><i class='icon-edit'></i></a>
														<a class='btn btn-mini btn-danger' title="删除" onclick="delSchool('${school.schoolId }','${school.schoolName }');"><i class='icon-trash'></i></a>
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

						<div class="page-header position-relative">
							<table style="width: 100%;">
								<tr>
									<td style="vertical-align: top;">
										<a class="btn btn-small btn-success" onclick="addSchool();">新增</a>
										<a title="批量删除" class="btn btn-small btn-danger" onclick="delAll('确定要删除选中的数据吗?');"><i class='icon-trash'></i></a>
									</td>
									<td style="vertical-align: top;"><div class="pagination" style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 返回顶部  -->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"><i class="icon-double-angle-up icon-only">返回顶部</i></a>

	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
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
			$("#schoolForm").submit();
		}
		
		//添加分校信息
		function addSchool(){
			<%--  top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>school/goAdd.do';
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
			 //window.location.href='<%=basePath%>school/goAdd.do';
			 $(location).attr('href', '<%=basePath%>school/goAdd.do');
			 //cqtPost('<%=basePath%>school/goAdd.do',{aa:'11',bb:'22'});
		}
		
		//查看分校信息
		function viewSchool(schoolId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>school/goView.do?schoolId='+schoolId;
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
		
		//编辑分校信息
		function editSchool(schoolId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>school/goEdit.do?schoolId='+schoolId;
			 diag.Width = 500;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('cqtwindow').style.display == 'none'){
					nextPage('${page.currentPage}');
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除分校信息
		function delSchool(schoolId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>school/delete.do?schoolId="+schoolId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage('${page.currentPage}');
					});
				}
			});
		}
		
		//批量删除选择的分校信息
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
								url: '<%=basePath%>school/deleteAll.do?tm='+new Date().getTime(),
						    	data: {schoolIds:ids},
								dataType:'json',
								cache: false,
								success: function(data){
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
			//复选框全选
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
			});
		})
		</script>

</body>
</html>

