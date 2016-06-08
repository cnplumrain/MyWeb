<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet"type="text/css" href="../../css/main.css"/>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		////////////////计算年龄
		var age = <%=Calendar.getInstance().get(Calendar.YEAR)-1989%>; 
		$("#age").html(age);
	});
</script>
</head>
<body>
	<div align="center" class="font" style="font-size: 40px;">简历</div>
	<div align="center" style="font-size: 20px;">
	<table class="font" border="1">
		<tr><td>姓名</td><td>:</td><td>朱永春</td><td rowspan="4"><img alt="" src="../../img/me1.jpg" style="float: right"></td></tr>
		<tr><td>年龄</td><td>:</td><td id="age">朱永春</td></tr>
		<tr><td>Q Q</td><td>:</td><td>84143365</td></tr>
		<tr><td>简介</td><td>:</td><td width="400px">2011年毕业于重庆大学计算机科学与技术专业，一直从事计算机相关工作，精通计算机维护、网络维护、信息管理、软件开发等方面的能力；目前就职于重庆飞驶特人力资源管理有限公司，从事信息管理工作。</td></tr>
	</table>
	</div>
</body>
</html>