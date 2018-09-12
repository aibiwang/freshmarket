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
当前的用户名：${user.userName}
<table>
<c:forEach items="${list}" var="u">
	<tr>
<<<<<<< HEAD
		<td>${u.userId}
		<td>${u.userName}
		<td>${u.userPwd}
		<td>${u.userType}
		<td>${u.userPhone}
		<td>${u.userEmail}
=======
		<td>${u.uid}
		<td>${u.uname}
		<td>${u.upass}
>>>>>>> branch 'master' of https://github.com/aibiwang/freshmarket.git
</c:forEach>

</table>
</body>
</html>
