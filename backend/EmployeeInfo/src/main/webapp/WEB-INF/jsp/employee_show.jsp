<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>社員一覧画面</h1>
 
   <a href="empaddform">追加</a>
    <br/>
	<table border="2" width="70%" cellpadding="2">
	<tr>
		<th>社員番号 :</th>
		<th>職業</th>
		<th>名前</th>
		<th>性別</th>
		<th>生年月日</th>
		<th>TEL</th>
		<th>メール</th>
		<th>年齢</th>
		<th>入社日 :</th>
		<th>管理者情報</th>
		<th></th>
		<th></th>
		
	</tr>
	<c:forEach var="emp" items="${list}">
		<tr>
			<td>${emp.id}</td>
			<td>${emp.category}</td>
			<td>${emp.name}</td>
			<td>${emp.gender}</td>
			<td>${emp.birthday}</td>
			<td>${emp.tel}</td>
			<td>${emp.address}</td>
			<td>${emp.age}</td>
			<td>${emp.joined_day}</td>
			<td>${emp.admin_auth}</td>
			<td><a href="editemp/${emp.id}">編集</a></td>
			<td><a href="deleteemp/${emp.id}">削除</a></td>
		</tr>
	</c:forEach>
    </table>
 