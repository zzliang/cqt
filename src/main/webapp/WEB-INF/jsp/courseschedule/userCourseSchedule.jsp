<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title>课程表信息</title>
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
<style type="text/css">
	.divmsg{color: #0000FF;background: #FFFF00}
</style>
</head>
<body>
	<div>
		<div style="text-align: center">
			<select id="courseListNameSelect" onchange="findCourseSchedule()" style="width:300px;">
				<c:forEach var="cs" items="${listCourseSchedule }">
					<c:choose>
						<c:when test="${cs.courseScheduleId == courseScheduleId}">
							<option id="${cs.courseScheduleId }" value="${cs.courseDate }" selected>${cs.className }</option>
						</c:when>
						<c:otherwise>
							<option id="${cs.courseScheduleId }" value="${cs.courseDate }">${cs.className }</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</div>
		<div style="text-align: center">
			<p><span id="csTitle"></span></p>
			<p><span id="cseTitle"></span></p>
			<p>
				<span id="csClassNameLable"></span><span id="csClassName"></span><span width="300px"></span>
				<span id="csCourseDateLable"></span><span id="csCourseDate"></span>
			</p>
			<p><span id="csCoursePlanLable"></span></p>
			<p>本月第<span id="month_week_No"></span>周&nbsp;&nbsp;
				<input id="prev" type="button" value="上周" onclick="handlerAction('prev');" />
				<input id="today" type="button" value="本周" onclick="handlerAction('today');" />
				<input id="next" type="button" value="下周" onclick="handlerAction('next');" />
			</p>
		</div>
		
		<div id="courseSchduleDiv" style="text-align: center">
			<div class="divmsg"><p><span id="msgSpanId"></span></p></div>
	        <table id="courseSchduleTable" border="1" style="margin:auto">
	        	<thead></thead>
	            <tbody></tbody>
	        </table>
		</div>
    </div>  
    
    <script type="text/javascript">
    $(document).ready(function(){
    	loadCourseSchedule();
    });
    
    function loadCourseSchedule(){
    	var courseScheduleId = "${courseScheduleId}";
    	var courseDate = "${courseDate}";
    	ajaxUserCourseSchedule(courseScheduleId,courseDate,'today','0');
    }
    
    function findCourseSchedule(){
    	var courseScheduleId = $("#courseListNameSelect").find("option:selected").attr("id");
    	var courseDate = $("#courseListNameSelect").val();
    	ajaxUserCourseSchedule(courseScheduleId,courseDate,'today','0');
    }
    //处理上周，本周，下周
    function handlerAction(action){
    	var courseScheduleId = $("#courseListNameSelect").find("option:selected").attr("id");
    	var courseDate = $("#csCourseDate").text();
    	var weekNum = $("#month_week_No").text();
    	var type = action;
    	//alert("action:"+action+" weekNum:"+weekNum+" courseScheduleId:"+courseScheduleId+" courseDate:"+courseDate);
    	ajaxUserCourseSchedule(courseScheduleId,courseDate,type,weekNum);
    }
    
    function ajaxUserCourseSchedule(courseScheduleId,courseDate,type,weekNum){
    	$.ajax({ 
    		url: "course/ajaxUserCourseSchedule.do", 
    		context: document.body, 
    		dataType:"json",
    		data:{"courseScheduleId":courseScheduleId,"courseDate":courseDate,"type":type,"weekNum":weekNum},
    		success: function(data){
    			//alert(data.type);
    			if(null!=data && data.isExisData==true){
    				$(".divmsg").css("display", "none");	/*提示课程表上周或下周没有课程表数据*/
    				$('#prev').removeAttr("disabled"); 		/* 移除disabled属性 */
    				$('#next').removeAttr("disabled");
    				//更新周次
	    			$("#month_week_No").html(data.weekNum);
	    			//课程表头部
	    			$('table thead').empty();
	    			var heads = "<tr><th align='center'><p><span>时间</span></p><p><span>Time</span></p></th>";
	    			$.each(data.lstWeekInfo,function (hindex,head){
	    				if(hindex<5){
		    				heads+="<th align='center'><p><span>"+head.weekDesc+"</span></p><p><span>"+head.weekDate+"</span></p></th>";
	    				}else{
	    					return false;
	    				}
	    			});
	    			heads += "</tr>";
	    			$('table thead').append(heads);
	    			
    				//设置课程表头部基本信息
	    			curScId = data.courseSchedule.courseScheduleId;
	    			$("#csTitle").html(data.courseSchedule.title);
	    			$("#cseTitle").html(data.courseSchedule.eTitle);
	    			$("#csClassName").html(data.courseSchedule.className);
	    			$("#csCourseDate").html(data.courseSchedule.courseDate);
	    			$("#courseListNameSelect").find("option[id = '"+curScId+"']").attr("selected","selected");
	    			
	    			//设置课程表课程信息
	    			$('table tbody').empty();
	            	var trs = "";
	            	$.each(data.courseSchedule.courseRowsAndCols,function (rindex,row){
	            		trs+="<tr class='tr1'>";
	            		var _status=0;
	            		$.each(row,function (cindex,col){
	            			if(_status==0){
	            				trs+="<td align='center' width='200px'><span>"+col.startTime+"-"+col.endTime+"</span></td>";
	            				 _status=1;
	            			}
	            			
	           				if(col.zIndex==0){
	           					trs+="<td align='center' colspan='5'><span>"+col.courseName+"</span></td>";
	           				}else{
	            				if(null!=col.courseName && ""!=col.courseName){
	            					trs+="<td align='center' width='200px'><p><span>"+col.courseName+"</span></p><p><span>("+col.courseEname+")</span></p><p><span>"+col.teacherName+"</span></p></td>";
	           					}else{
	           						trs+="<td align='center' width='200px'></td>";
	           					}
	           				}
	            		});
	            		trs+="</tr>";
	            	});
	            	$('table tbody').append(trs);
    			}else{
    				$("#msgSpanId").html(data.msg);
    				$(".divmsg").css("display", "block");
    				$('#'+data.type).attr('disabled',"true");/* 添加disabled属性 */
    				return;
    			}
    		},
    		error: function(){
    			alert("error");
          }});
    }
    </script>  

</body>
</html>