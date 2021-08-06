<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<html>    
<head>  
<title>ローグイン画面</title>
</head>
<body>
	<form:form method="post" action="login">
		<table>
			<tr>
				<td colspan="2">${errorMsg}</td>
			</tr>
			<tr>
				<td>ID :</td>
				<td><form:input path="id" /></td>
			</tr>
			<tr>
				<td>パスワード:</td>
				<td><form:input type="password" path="password" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="ログイン" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>