<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>社員情報</title>
  <link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

  <!-- Bootstrap CSS -->
	<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../script/base.css">
  
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
    <p id="login_name" class="name">山田太郎 様</p>


</header>
<article>
    <button id="up" class="show"><i style="font-size:35px; color:blue" class="far fa-arrow-alt-circle-right"></i></button>
    <div id="sidebar" class="sidebar item">

        <nav class="nav">
        <ul>
          <li class="nav-item"><i style = "font-size:25px;" class="fas fa-user-alt"></i><a id="user_info" href="./user_info.html">ユーザ情報へ　</a></li>
          <li class="nav-item"><i style = "font-size:25px;" class="fas fa-crown"></i><a id="admin_page" href="./showemp.html">管理者ページへ</a></li>
          <li class="nav-item"><i style = "font-size:25px;" class="fas fa-door-open"></i><a id="logout" href="./login.html">ログアウト　　</a></li>
        </ul>
        </nav>
        <p class="loginInfo">管理者権限でログインしています。</p>
        <a href="#" id="close" class="backButton"><i style = "font-size:35px; color:#2C3539;" class="far fa-arrow-alt-circle-left"></i></a>
    
    </div>
    <div class="content">
      <!-- ここに各々のコンテンツを差し込む-->
        <div class="container">
    
            <div class="card text-white bg-light">
              <div class="card-body">
    
    
                  <div class="container text-left">
                    <a href="empform" class=" btn btn-outline-warning btn-md">追加</a>
                  </div>
                  <br />
                  <table class="table table-bordered  table-striped table-grey">
                    <thead class="bg-success text-center text-white">
                      <tr>
                        <th scope="col">社員番号</th>
                        <th scope="col">名前</th>
                        <th scope="col">年齢</th>
                        <th scope="col">性別</th>
                        <th scope="col">生年月日</th>
                        <th scope="col">TEL</th>
                        <th scope="col">メール</th>
                        <th scope="col">職種</th>
                        <th scope="col">入社</th>
                        <th scope="col">管理者権限</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                      </tr>
                    </thead>
      <!-- <c:forEach var="emp" items="${list}">
        <tr>
          <td>${emp.id}</td>
          <td>${emp.name}</td>
          <td>${emp.age}</td>
          <td>${emp.gender}</td>
          <td>${emp.dob}</td>
          <td>${emp.tel}</td>
          <td>${emp.address}</td>
          <td>${emp.category}</td>
          <td>${emp.joined_day}</td>
          <td>${emp.admin_auth}</td>
          <td><a href="editemp/${emp.id}" class="btn btn-outline-primary">編集</a></td>
          <td><a href="deleteemp/${emp.id}" onclick="if(!(confirm('削除してもよろしですか?')))return false" class="btn btn-outline-danger">削除</a></td>
        </tr>
      </c:forEach> -->
      <tr>
           <td>12223</td>
         <td>aaaa</td>
         <td>22</td>
         <td>男</td>
         <td>2020-02-02</td>
         <td>0909</td>
         <td>aaaa＠yahoo</td>
         <td>aa</td>
         <td>2020/01/01</td>
         <td>1</td>
         <td><a href="" class="btn btn-outline-primary">編集</a></td>
        <td><a href="" onclick="if(!(confirm('削除してもよろしですか?')))return false" class="btn btn-outline-danger">削除</a></td>
      </tr>
      <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
       <tr>
        <td>12223</td>
        <td>aaaa</td>
        <td>22</td>
        <td>男</td>
        <td>2020-02-02</td>
        <td>0909</td>
        <td>aaaa＠yahoo</td>
        <td>aa</td>
        <td>2020/01/01</td>
        <td>1</td>
        <td><a href="">編集</td>
      　　<td><a href="">削除</td>
       </tr>
    </table>
    </div>
    </div>
    </div>

      <!-- コンテンツ終了 ------------------->
    </div>
</article>

  </body>
</html>