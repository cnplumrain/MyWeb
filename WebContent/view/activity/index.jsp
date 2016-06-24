<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet"type="text/css" href="css/main.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#getDetail").mouseover(function(){
		var id=$(this).data('data');
		$.ajax({
	           type: "POST",
	           url: "activity",
	           //contentType:"application/json",
	           data:{actId:id},  //参数列表
	           //dataType:"json",		//加了json则返回数据必须为json格式
	           success: function(result){
	              //请求正确之后的操作
	              $("#detail").html(result);
	              var p= $("#getDetail").offset();
	              $("#detail").offset({top:p.top+$("#getDetail").height()+5,left:0});
	             
	           },
	           error: function(result){
	              //请求失败之后的操作
	        	   $("#detail").html(result);
	           }
	    });	
	});
	$("#getDetail").mouseout(function(){
		 $("#detail").html("");
	});
	
});
</script>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	
	<table border="1">
		<tr>
			<td>活动名称</td>
			<td>地点</td>
			<td>时间</td>
			<td></td>
		</tr>
		<c:forEach var="row" items="${requestScope.activities}">
		<tr>
			<td><a href="javascript:void(0)" style="display: block" id="getDetail" data-data="${row.Id}">${row.Name}</a></td>
			<td>${row.Place}</td>
			<td>${row.Time}</td>
			<td><a href="activityJoin?activityId=${row.Id}">我要参加</a></td>
			<td><a href="activityPerson?activityId=${row.Id}">参加人员</a></td>
		</tr>
		</c:forEach>
	</table>
	<div id="detail" style="background:black;border-radius:5px;opacity:0.8;"></div>
	</div>
</body>
</html>