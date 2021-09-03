<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>社員一覧画面</h1>
<!-- Theme CSS -->
			<link href="<c:url value="/resources/css/base.css" />" rel="stylesheet">
			<link href="<c:url value="/resources/css/employee_show.css" />" rel="stylesheet">
		
       <link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet">

       <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>       
    //サイドバー表示・非表示処理
$(function(){
  $('#up').click(function(){
    $('.show').hide(100, function() {
 
 $('.sidebar').show(500);
});
  });
  $('#close').click(function(){
    $('.sidebar').hide(500, function() {
        $('.show').show(100);
    });
  });
});
</script>
</head>
<body>
<!-- ヘッダー-->
<header class="header">
    <p id="login_name" class="name"><c:out value="${sessionScope.userInfo.name}"/>様</p></p>
</header>
<article>
    <button id="up" class="show"><i style="font-size:30px; color:blue" class="far fa-arrow-alt-circle-right"></i></button>
    <div id="sidebar" class="sidebar item">

        <nav class="nav">
        <ul>
          <li class="nav-item"><i style = "font-size:25px;" class="fas fa-user-alt"></i><a id="user_info" href="/EmployeeInfo/user_info">ユーザ情報へ　</a></li>
          <c:if test="${sessionScope.userInfo.admin_auth == 1}">
          <li class="nav-item"><i style = "font-size:25px;" class="fas fa-crown"></i><a id="employee_show" href="/EmployeeInfo/empshowform">管理者ページへ</a></li>
          </c:if>
          <li class="nav-item"><i style = "font-size:25px;" class="fas fa-door-open"></i><a id="logout" href="/EmployeeInfo/logout">ログアウト　　</a></li>
        </ul>
        </ul>
        </nav>
        <p class="loginInfo">管理者権限でログインしています。</p>
        <a href="#" id="close" class="backButton"><i style = "font-size:35px; color:#2C3539;" class="far fa-arrow-alt-circle-left"></i></a>
    </div>
         <a href="empaddform"><input type="submit" value="追加" id="button1"></a>
	<table  class="content-table" border="2">
	<thead>
	<tr>
		<th>社員番号 </th>
		<th>職業</th>
		<th>名前</th>
		<th>性別</th>
		<th>生年月日</th>
		<th>TEL</th>
		<th>メール</th>
		<th>年齢</th>
		<th>入社日 </th>
		<th>管理者情報</th>
		<th></th>
		<th></th>
	</tr>
	</thead>
	<tbody>
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
			<td><c:if test="${emp.admin_auth == 1}">〇</c:if>
			</td>
			  <td><a href="editemp/${emp.id}"><input type="submit" value="編集" id="button2"></a></td>
          <td><a href="deleteemp/${emp.id}" onclick="if(!(confirm('削除してもよろしですか?')))return false"><input type="submit" value="削除" id="button3"></a></td>
		</tr>
		</tbody>
	</c:forEach>
    </table>
    
    </article>
    </body>
    

 