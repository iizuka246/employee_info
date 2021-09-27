<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>ユーザ情報画面</title>
  <link href="<c:url value="/resources/css/base.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/css/user_info.css" />" rel="stylesheet">
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
    <p id="login_name" class="name">
    <c:out value="${sessionScope.userInfo.name}"/>様</p>
    <c:if test="${sessionScope.userInfo.admin_auth == 1}">
    <button id="admin_button" class="adminButton" onclick="location.href='empshowform'">管理者ページへ</button>
    </c:if>
</header>
<article>
    <button id="up" class="show"><i style="font-size:35px; color:blue" class="far fa-arrow-alt-circle-right"></i></button>
    <div id="sidebar" class="sidebar item">

        <nav class="nav">
        <ul>
          <li class="nav-item"><i style = "font-size:25px;" class="fas fa-user-alt"></i><a id="user_info" href="/EmployeeInfo/user_info">ユーザ情報へ　</a></li>
		  <c:if test="${sessionScope.userInfo.admin_auth == 1}">
		  <li class="nav-item"><i style = "font-size:25px;" class="fas fa-crown"></i><a id="admin_page" href="/EmployeeInfo/empshowform">管理者ページへ</a></li>
          </c:if>
          <li class="nav-item"><i style = "font-size:25px;" class="fas fa-door-open"></i><a id="logout" href="/EmployeeInfo/logout">ログアウト　　</a></li>
        </ul>
        </nav>
        <p class="loginInfo">管理者権限でログインしています。</p>
        <a href="#" id="close" class="backButton"><i style = "font-size:35px; color:#2C3539;" class="far fa-arrow-alt-circle-left"></i></a>
    
    </div>
    <div class="content">
      <!-- ここに各々のコンテンツを差し込む　----------------------------------------------------------------------->
       <form:form method="post" action="userInfoEdit">
       <p id="error">${errorMsg}</p>
         <table id="main">
            <tr>
              <th>社員番号</th>
      
              <td class="cp_iptxt">
              <form:input type="text" path="id" readOnly="true" size="16" maxlength='8'/>
              </td>
            </tr>
      
            <tr>
              <th>職種</th>
              <td class="cp_iptxt">
              <form:input type="text" size="16" maxlength='8' path="category" />
              </td>
            </tr>
            <tr>
              <th>性別</th>
              <td >
              <form:radiobutton path="gender" value="0" checked="${emp.gender == '0' ? 'checked' : '' }" disabled="true" />男
              <form:radiobutton path="gender" value="1" checked="${emp.gender == '1' ? 'checked' : '' }" disabled="true" />女
              </td>
            </tr>
            <tr>
              <th>名前</th>
              <td class="cp_iptxt">
              <form:input type="text" size="16" path="name" />
              </td>
            </tr>
            <tr>
              <th>生年月日</th>
              <td>
              <form:select path="birthday_year" id="birthday_year" ></form:select>年
               <form:select path="birthday_month" id="birthday_month" ></form:select>月
               <form:select path="birthday_date" id="birthday_date" ></form:select>日
              </td>
            </tr>
            <tr>
              <th>TEL</th>
              <td class="cp_iptxt">
              <form:input type="tel" size="16" maxlength='12' path="tel" placeholder="電話番号入力(数値のみ)" pattern="[\d]*" />
              </td>
            </tr>
            <tr>
              <th>E-Mail</th>
              <td class="cp_iptxt">
              <form:input type="email" size="16" maxlength='25' path="address" readOnly="true" />
              </td>
            </tr>
            <tr>
              <th>年齢  </th>
              <td>
               <form:select path="age" id="age">
               </form:select>歳
              </td>
            </tr>
            <tr>
              <th>入社日</th>
              <td>
              <form:select path="joined_day_year" id="joined_day_year" ></form:select>年
               <form:select path="joined_day_month" id="joined_day_month" ></form:select>月
               <form:select path="joined_day_date" id="joined_day_date" ></form:select>日
              </td>
            </tr>
            <tr>
              <th>管理者権限</th>
              <td>
              <form:radiobutton path="admin_auth" value="0" checked="${emp.admin_auth == '0' ? 'checked' : '' }" disabled="true"/>無
              <form:radiobutton path="admin_auth" value="1" checked="${emp.admin_auth == '1' ? 'checked' : '' }" disabled="true" />有
              </td>
            </tr>
            <tr>
              <th>パスワード</th>
              <td class="cp_iptxt">
              <form:input path="password" size="16" maxlength="12" placeholder="パスワード入力" />
              </td>
            </tr>
      
        </table>
          <input type="submit" class="btn-square-so-pop" value="パスワード変更">
      
        </form:form>
        <!-- コンテンツ終了 ------------------------------------------------------------------------------------------>
    </div>
</article>

  </body>
</html>


<!-- 生年月日 -->
  <script>
  (function() {
      // ライブラリ
      const isLeapYear = year => (year % 4 === 0) && (year % 100 !== 0) || (year % 400 === 0);
  
      const countDatesOfFeb = year => isLeapYear(year) ? 29 : 28;
  
      const createOption = (id, startNum, endNum, current) => {
        const selectDom = document.getElementById(id);
        let optionDom = '';
        for (let i = startNum-1; i <= endNum; i++) {
          if(i === startNum-1){
        	  if(id === 'birthday_year'){
        		  option = '<option value="' + ${userInfo.birthday_year} + '"hidden selected>' + ${userInfo.birthday_year} + '</option>';
        		  }else if(id === 'birthday_month'){
        			  option = '<option value="' + ${userInfo.birthday_month} + '"hidden selected>' + ${userInfo.birthday_month} + '</option>';
        		  }else if(id === 'birthday_date'){
        			  option = '<option value="' + ${userInfo.birthday_date} + '"hidden selected>' + ${userInfo.birthday_date} + '</option>';
        		  }else{
        			  option = '<option value="' + '' + '"hidden selected>' + '--' + '</option>';
        		  }
          }else if (i === current) {
            option = '<option disabled value="' + i + '" >' + i + '</option>';
          } else {
            option = '<option disabled value="' + i + '">' + i + '</option>';
          }
          optionDom += option;
        }
        selectDom.insertAdjacentHTML('beforeend', optionDom);
      }
  
      // DOM
      const yearBox = document.getElementById('birthday_year');
      const monthBox = document.getElementById('birthday_month');
      const dateBox = document.getElementById('birthday_date');
  
      // 日付データ
      const today = new Date();
      const thisYear = today.getFullYear();
      const thisMonth = today.getMonth() + 1;
      const thisDate = today.getDate();
  
      let datesOfYear= [31, countDatesOfFeb(thisYear), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  
      // イベント
      monthBox.addEventListener('change', (e) => {
        dateBox.innerHTML = '';
        const selectedMonth = e.target.value;
        createOption('birthday_date', 1, datesOfYear[selectedMonth - 1], 1);
      });
  
      yearBox.addEventListener('change', e => {
        monthBox.innerHTML = '';
        dateBox.innerHTML = '';
        const updatedYear = e.target.value;
        datesOfYear = [31, countDatesOfFeb(updatedYear), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  
        createOption('birthday_month', 1, 12, 1);
        createOption('birthday_date', 1, datesOfYear[0], 1);
      });
  
      // ロード時
      createOption('birthday_year', 1950, thisYear, thisYear);
      createOption('birthday_month', 1, 12, thisMonth);
      createOption('birthday_date', 1, datesOfYear[thisMonth - 1], thisDate);
    })();
  </script>
  
  <!-- 入社日 -->
  <script>
  (function() {
      // ライブラリ
      const isLeapYear = year => (year % 4 === 0) && (year % 100 !== 0) || (year % 400 === 0);
  
      const countDatesOfFeb = year => isLeapYear(year) ? 29 : 28;
  
      const createOption = (id, startNum, endNum, current) => {
        const selectDom = document.getElementById(id);
        let optionDom = '';
        for (let i = startNum-1; i <= endNum; i++) {
  
          if(i === startNum-1){
        	  if(id === 'joined_day_year'){
        		  option = '<option value="' + ${userInfo.joined_day_year} + '"hidden selected>' + ${userInfo.joined_day_year} + '</option>';
        		  }else if(id === 'joined_day_month'){
        			  option = '<option value="' + ${userInfo.birthday_month} + '"hidden selected>' + ${userInfo.joined_day_month} + '</option>';
        		  }else if(id === 'joined_day_date'){
        			  option = '<option value="' + ${userInfo.birthday_date} + '"hidden selected>' + ${userInfo.joined_day_date} + '</option>';
        		  }else{
        			  option = '<option value="' + '' + '"hidden selected>' + '--' + '</option>';
        		  }
          }else if (i === current) {
            option = '<option disabled value="' + i + '" >' + i + '</option>';
          } else {
            option = '<option disabled value="' + i + '">' + i + '</option>';
          }
          optionDom += option;
        }
        selectDom.insertAdjacentHTML('beforeend', optionDom);
      }
  
      // DOM
      const yearBox = document.getElementById('joined_day_year');
      const monthBox = document.getElementById('joined_day_month');
      const dateBox = document.getElementById('joined_day_date');
  
      // 日付データ
      const today = new Date();
      const thisYear = today.getFullYear();
      const thisMonth = today.getMonth() + 1;
      const thisDate = today.getDate();
  
      let datesOfYear= [31, countDatesOfFeb(thisYear), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  
      // イベント
      monthBox.addEventListener('change', (e) => {
        dateBox.innerHTML = '';
        const selectedMonth = e.target.value;
        createOption('joined_day_date', 1, datesOfYear[selectedMonth - 1], 1);
      });
  
      yearBox.addEventListener('change', e => {
        monthBox.innerHTML = '';
        dateBox.innerHTML = '';
        const updatedYear = e.target.value;
        datesOfYear = [31, countDatesOfFeb(updatedYear), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  
        createOption('joined_day_month', 1, 12, 1);
        createOption('joined_day_date', 1, datesOfYear[0], 1);
      });
  
      // ロード時
      createOption('joined_day_year', 1950, thisYear, thisYear);
      createOption('joined_day_month', 1, 12, thisMonth);
      createOption('joined_day_date', 1, datesOfYear[thisMonth - 1], thisDate);
    })();
  </script>
  
  <!-- 年齢 -->
  <script>
  (function() {
      var selectBox = document.getElementById('age');
      for (var i = 17; i <= 70; i++) {
        var option;
        if(i == 17){
  
          option = '<option value="' + ${userInfo.age} + '"hidden selected>' + ${userInfo.age} + '</option>';
        }else{
        option = '<option disabled value="' + i + '">' + i + '</option>';
        }
        selectBox.insertAdjacentHTML('beforeend', option);
      }
  
    })();
  </script>
  