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
<title>无标题文档</title>
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
	<style type="text/css">
		 
	</style>

</head>
<body>
	<div style="margin-left:300;">
		<div>
			<p><span>${courseSchedule.title }</span></p>
			<p><span>${courseSchedule.eTitle }</span></p>
			<p>
				<span></span><span>${courseSchedule.className }</span><span width="300px"></span>
				<span></span><span>${courseSchedule.courseDate }</span>
			</p>
			<p><span></span></p>
		</div>
		<div>
	        <table border="1" style="align:'center';vertical-align:'right';">
	            <tr>
	                <th align="center"><span>时间</span></th>
	                <th align="center"><span>星期一</span></th>
	                <th align="center"><span>星期二</span></th>
	                <th align="center"><span>星期三</span></th>
	                <th align="center"><span>星期四</span></th>
	                <th align="center"><span>星期五</span></th>
	            </tr>
	            
	            <c:forEach var="row" items="${courseSchedule.courseRowsAndCols}">
	            	<tr class="tr1">
	            	<c:set var="_status" value="0"/>
	            	<c:forEach var="course" items="${row}">
	            		<c:if test="${_status==0 }">
           					<td align="center" width="200px"><span>${course.startTime}-${course.endTime}</span></td>
           					<c:set var="_status" value="1"/>
           				</c:if>
	            		<c:choose>
	            			<c:when test="${course.zIndex==0 }">
		            			<td align="center" colspan="5"><span>${course.courseName}</span></td>
	            			</c:when>
	            			<c:otherwise>
				                <td align="center" width="200px"><p><span>${course.courseName}</span></p><p><span>(${course.courseEname})</span></p><p><span>${course.teacherName}</span></p></td>
	            			</c:otherwise>
	            		</c:choose>
	            	</c:forEach>
		            </tr>
	            </c:forEach>
	        </table>
		</div>
    </div>    

</body>
</html>