<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"type="text/css" href="css/main.css"/>
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<table border="1">
		<tr>
			<td>姓名</td>
			<td>电话</td>
		</tr>
		<c:forEach var="row" items="${requestScope.users}">
		<tr>
			<td>${row.RealName}</td>
			<td>${row.Telephone}</td>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>