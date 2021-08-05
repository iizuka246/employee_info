<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

		<h1>Edit Employee</h1>
       <form:form method="POST" action="/EmployeeInfo/editsave">
      	<table >  
      	<tr>  
          <td>社員番号 : </td> 
          <td><form:input path="id" readOnly="true"/></td>
         </tr> 
         <tr>  
          <td>名前 : </td> 
          <td><form:input path="name"　/></td>
         </tr>  
         <tr>  
          <td>性別 :</td>  
          <td><form:input path="gender"/></td>
         </tr> 
         <tr>  
          <td>年齢 :</td>  
          <td><form:input path="age" /></td>
         </tr> 
         <tr>  
          <td>生年月日 :</td>  
          <td>
          <form:input　path="birthday"　id="datepicker1"/>
          </td>
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
          <td><form:input path="joined_day" id="datepicker2"/>
			</td>
         </tr> 
         <tr>  
          <td>管理者情報 :</td>  
          <td><form:input path="admin_auth" /></td>
         </tr> 
         <tr>  
          <td>パスワード :</td>  
          <td><form:input path="password" /></td>
         </tr> 
         <tr>  
          <td> </td>  
          <td><input type="submit" value="Save" /></td>  
         </tr>  
        </table>  
       </form:form>  
