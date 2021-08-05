<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
.errormsg {
	color: red;
}
</style>
<script>
	$(function() {
		$("#datepicker1").datepicker({
			showOtherMonths : true,
			selectOtherMonths : true,
			dateFormat : 'yy/mm/dd'
		});
		$("#datepicker2").datepicker({
			showOtherMonths : true,
			selectOtherMonths : true,
			dateFormat : 'yy/mm/dd',
			yearRange : '0001:2021'
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h1>Add New Employee</h1>

		<form:form method="post" action="save" modelAttribute="empform">
			<table>
				<tr>
				<div class="form-group">
				<label>${duplicateKey}</label>
					<td>社員番号 :</td>
					<td><form:input path="id" /></td>
					 <form:errors path="id"
							cssClass="errormsg" />
							</div>
				</tr>
				<tr>
					<div class="form-group">
					<td>名前 :</td>
					<td><form:input path="name" /></td>
					<form:errors path="name" cssClass="errormsg" />
					</div>
				</tr>

				<tr>
					<div class="form-group">
					<td>性別 :</td>
					<td><form:input path="gender" /></td>
					<form:errors path="gender" cssClass="errormsg" />
					</div>
				</tr>
				<tr>
					<td>年齢 :</td>
					<td><form:input path="age" /> <form:errors path="age"
							cssClass="errormsg" /></td>
				</tr>
				<tr>
					<td>生年月日 :</td>
					<td><form:input path="birthday" id="datepicker1" /></td>
				</tr>
				<tr>
					<td>連絡先 :</td>
					<td><form:input path="tel" /></td>
				</tr>
				<tr>
					<td>メールアドレス :</td>
					<td><form:input path="address" /></td>
				</tr>
				<tr>
					<td>職業 :</td>
					<td><form:input path="category" /></td>
				</tr>
				<tr>
					<td>入社日 :</td>
					<td><form:input path="joined_day" id="datepicker2" /></td>
				</tr>
				<tr>
					<td>パスワード :</td>
					<td><form:input path="password" /></td>
				</tr>
				<tr>
					<td>管理者情報 :</td>
					<td><form:input path="admin_auth" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Save" /></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>