<%@ page language="java" contentType="text/html; charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
 	<head>
		<!-- Theme CSS -->
		<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
		</head>
<body>
	<h1>社員情報管理システム</h1>
  		<hr>
  		<p align="center" class="error" color="red">${errorMsg}</p>
		<div align="center">
			<table class="table" border="0">
				<form:form method="post" action="login">
						<tr>
							<th>
								社員番号
							</th>
						</tr>
						<tr>							
						 	<td>
                                 <form:input type="text" class="text" path="id" required="required" maxlength="10" 
                                 oninvalid="this.setCustomValidity(' ')" oninput="setCustomValidity('')" size="8" placeholder="IDを入力してください"  />
                         	</td>
 	    				</tr>
 	    				<tr>
 	    					<th>
		                         パスワード
	                     	</th>
 	    				</tr>
 	                    <tr>
	                      	<td>
		                          <form:input type="password" class="text" path="password" size="10"
		                          placeholder="Passwordを入力してください" />
	                      	</td>
                      	</tr>
	                    <tr>
	                          <td class="btn-center" colspan="2">
	                          <input type="submit" class="btn-login" value="ログイン" />
	                          </td>
	                    </tr>
	                    <tr>
	                    	<td class="center-2" colspan="2">
	                    		<a href="" >パスワードを忘れました</a>
	                    	</td>
	                    </tr>	                  
	         </form:form>
          	</table>
      	</div>
</body>
 </html>