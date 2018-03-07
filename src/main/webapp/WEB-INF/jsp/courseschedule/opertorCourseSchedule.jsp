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
<title>课程表信息</title>
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
</head>
<body>
	<div>
		<div style="text-align: center">
			<select id="courseListNameSelect" onchange="findCourseSchedule()" style="width:300px;">
				<c:forEach var="cs" items="${listCourseSchedule }" varStatus="stu">
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
				<span>【班级】</span><span id="csClassName"></span><span width="300px"></span>
				<span>【时间】</span><span id="csCourseDate"></span>
			</p>
			<p><span>【课表安排】</span></p>
		</div>
		<div id="courseSchduleDiv" style="text-align: center">
	        <table id="courseSchduleTable" border="1" style="margin:auto">
	        	<thead></thead>
	            <tbody></tbody>
	        </table>
		</div>
		
		<div style="text-align: center">
			<p>
				<span>开始日期：</span><span><input type="date" name="startDate" id="startDate" /></span>
				<span>周次：</span><span><input type="text" name="weeks" id="weeks" /></span>
				<span><input type="button" name="courseSetting" id="courseSetting" onclick="javascript:courseSetting('${courseConfig.courseConfigId}');" value="设置" /></span>
			</p>
		</div>
    </div>  
    
    <script type="text/javascript">
    $(document).ready(function(){
    	loadCourseSchedule();
    });
    
    function loadCourseSchedule(){
    	var courseScheduleId = "${courseScheduleId}";
    	var courseDate="${courseDate}";
    	ajaxViewCourseSchedule(courseScheduleId,courseDate);
    }
    
    function findCourseSchedule(){
    	var courseScheduleId = $("#courseListNameSelect").find("option:selected").attr("id");
    	var courseDate = $("#courseListNameSelect").val();
    	ajaxViewCourseSchedule(courseScheduleId,courseDate);
    }
    
    function ajaxViewCourseSchedule(courseScheduleId,courseDate){
    	$.ajax({ 
    		url: "course/ajaxViewCourseSchedule.do", 
    		context: document.body, 
    		dataType:"json",
    		data:{"courseScheduleId":courseScheduleId,"courseDate":courseDate},
    		success: function(data){
    			if(null!=data){
    				//设置课程表头部基本信息
	    			curScId = data.courseSchedule.courseScheduleId;
	    			$("#csTitle").html(data.courseSchedule.title);
	    			$("#cseTitle").html(data.courseSchedule.eTitle);
	    			$("#csClassName").html(data.courseSchedule.className);
	    			$("#csCourseDate").html(data.courseSchedule.courseDate);
	    			$("#courseListNameSelect").find("option[id = '"+curScId+"']").attr("selected","selected");
	    			
	    			//查询月周
	    			$("#month_week_No").html(data.weekNum);
	    			$('table thead').empty();
	    			var heads = "<tr><th align='center'><p><span>时间</span></p></th>";
	    			$.each(data.lstWeekInfo,function (hindex,head){
	    				if(hindex<5){
		    				heads+="<th align='center'><p><span>"+head.weekDesc+"</span></p></th>";
	    				}else{
	    					return false;
	    				}
	    			});
	    			heads += "</tr>";
	    			$('table thead').append(heads);
	    			
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
	            				trs+="<td align='center' width='200px'><p><span>"+col.courseName+"</span></p><p><span>("+col.courseEname+")</span></p><p><span>"+col.teacherName+"</span></p></td>";
	           				}
	            		});
	            		trs+="</tr>";
	            	});
	            	$('table tbody').append(trs);
    			}
    		},
    		error: function(){
    			alert("error");
          }});
    }
    
    function courseSetting(ccid){
    	var courseConfigId = ccid;
    	var courseDate = $("#courseListNameSelect").val();
    	var startDate = $("#startDate").val();
    	var weeks = $("#weeks").val();
    	//alert(ccid+"-"+courseDate+"-"+startDate+"-"+weeks);
    	$.ajax({ 
    		url: "course/courseConfig.do", 
    		context: document.body, 
    		dataType:"json",
    		data:{"courseDate":courseDate,"courseConfigId":courseConfigId,"startDate":startDate,"weeks":weeks},
    		success: function(data){
    			if(data.msg=="success"){
    				alert("设置成功");
    			}
    		},
    		error:function(){
    			alert("error");
    		}
    	});
    }
    </script>  
</body>
</html>