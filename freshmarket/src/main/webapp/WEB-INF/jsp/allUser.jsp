<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>all user</h1>
当前的用户名：${user.uname}
<table>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.uid}
		<td>${u.uname}
		<td>${u.upass}
</c:forEach>

</table>
</body>
</html>