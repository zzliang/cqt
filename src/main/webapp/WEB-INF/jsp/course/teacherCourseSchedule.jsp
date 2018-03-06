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
			<p><span>【课表安排】</span></p>
			<p><span>【时间】</span><span id="csCourseDate"></span></p>
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
    	var courseDate = "${courseDate}";
    	var weekNum = "${week}";
    	ajaxTeacherCourseSchedule(courseDate,weekNum,'today');
    }

    //处理上周，本周，下周
    function handlerAction(action){
    	var courseDate = $("#csCourseDate").text();
    	var weekNum = $("#month_week_No").text();
    	var type = action;
    	//alert("action:"+action+" weekNum:"+weekNum +" courseDate:"+courseDate);
    	ajaxTeacherCourseSchedule(courseDate,weekNum,type);
    }
    
    function ajaxTeacherCourseSchedule(courseDate,weekNum,type){
    	$.ajax({ 
    		url: "course/ajaxTeacherCourseSchedule.do", 
    		context: document.body, 
    		dataType:"json",
    		data:{"courseDate":courseDate,"type":type,"weekNum":weekNum},
    		success: function(data){
    			if(null!=data && data.isExisData==true){
    				$(".divmsg").css("display", "none");	/*提示课程表上周或下周没有课程表数据*/
    				$('#prev').removeAttr("disabled"); 		/* 移除disabled属性 */
    				$('#next').removeAttr("disabled");
    				
    				//设置课程表头部基本信息
	    			$("#csCourseDate").html(data.courseDate); 	//更新月份
	    			$("#month_week_No").html(data.weekNum);		//更新周次
    				
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
	    			
	    			//设置课程表课程信息
	    			$('table tbody').empty();
	            	var trs = "";
	            	$.each(data.courseRowsAndCols,function (rindex,row){
	            		trs+="<tr class='tr1'>";
	            		var _status=0;
	            		$.each(row,function (cindex,col){
	            			//第一列的时间段
            				if(_status==0){
	            				trs+="<td align='center' width='200px'><span>"+col.startTime+"-"+col.endTime+"</span></td>";
	            				 _status=1;
	            			}
	           				
           					if(null!=col.courseName && ""!=col.courseName){
            					trs+="<td align='center' width='200px'><p><span>"+col.className+"</span></p><p><span>"+col.courseName+"</span></p><p><span>("+col.courseEname+")</span></p><p><span>"+col.teacherName+"</span></p></td>";
           					}else{
           						trs+="<td align='center' width='200px'></td>";
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