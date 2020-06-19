<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  <!-- JSTL -->
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>home</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>

<body>
	<form action="${pageContext.request.contextPath}/security/join" method="post">
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="text" name="username" />
		<input type="password" name="password" />
		<select name="role">
			<option value="USER">회원</option>
			<option value="ADMIN">매니저</option>
			<option value="ADMIN">관리자</option>
		</select>
		<input type="submit" value="회원가입"/>
	</form>
</body>
</html>		