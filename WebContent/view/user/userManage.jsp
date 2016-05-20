<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>UserManage</title>
</head>
<body>
	${sessionScope.o }
	<table border="1">
		<tr>
			<td>用户名</td>
			<td>密码</td>
		</tr>
		<c:forEach var="row" items="${requestScope.users}">
		<tr>
			<td>${row.UserName}</td>
			<td>${row.Password}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>