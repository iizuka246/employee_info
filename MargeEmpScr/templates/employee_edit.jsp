<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>ユーザ情報画面</title>
  <link rel="stylesheet" href="../script/base.css">
  <link rel="stylesheet" href="../script/user_info.css">
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
    <p id="login_name" class="name">山田太郎 様</p>
    <button id="admin_button" class="adminButton" onclick="location.href='./showemp.html'">管理者ページへ</button>


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
	  <form action="@{/edit}" method="post">
		<table id="main">
	
				<tr>
					<th>社員番号</th>
	
					<td class="cp_iptxt">
					<input  type="text" size="16" maxlength='8' name="id" placeholder="社員番号入力" required disabled/>
					</td>
				</tr>
	
				<tr>
					<th>職種</th>
					<td class="cp_iptxt">
					<input type="text" size="16" maxlength='8' name="category" placeholder="職種入力" required />
					</td>
				</tr>
				<tr>
					<th>性別</th>
					<td >
					<input type="radio" name="sex" value="0" checked="checked" />男
					<input type="radio" name="sex" value="1" />女
					<input type="radio" name="sex" value="2" />その他
					</td>
				</tr>
				<tr>
					<th>名前</th>
					<td class="cp_iptxt">
					<input type="text" size="16" name="name" placeholder="氏名入力" required />
					</td>
				</tr>
				<tr>
					<th>生年月日</th>
					<td>
					<select id="birthday_year" name="birthday_year" required ></select>年
					 <select id="birthday_month" name="birthday_month" required ></select>月
					 <select id="birthday_date" name="birthday_date" required ></select>日
					</td>
				</tr>
				<tr>
					<th>TEL</th>
					<td class="cp_iptxt">
					<input type="tel" size="16" maxlength='12' name="tel" placeholder="電話番号入力(数値のみ)" pattern="[\d]*" required />
					</td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td class="cp_iptxt">
					<input type="email" size="16" maxlength='25' name="adress" placeholder="メールアドレス入力" required />
					</td>
				</tr>
				<tr>
					<th>年齢</th>
					<td>
					<!-- <input type="text" size="6" maxlength='2' required/>歳 -->
					<select id="age" name="age" required ></select>歳
					</td>
				</tr>
				<tr>
					<th>入社日</th>
					<td>
					<select id="joined_day_year" name="joined_day_year" required ></select>年
					 <select id="joined_day_month" name="joined_day_month" required ></select>月
					 <select id="joined_day_date" name="joined_day_date" required ></select>日
					</td>
				</tr>
				<tr>
					<th>管理者権限</th>
					<td>
					<input type="radio" name="admin_auth" value="0"checked="checked" />無
					<input type="radio" name="admin_auth" value="1" />有
					</td>
				</tr>
				<tr>
					<th>パスワード</th>
					<td class="cp_iptxt">
					<input type="password" name="password" size="16" maxlength="12" placeholder="パスワード入力" required />
					</td>
				</tr>
	
		</table>
			<input type="submit" class="btn-square-so-pop" value="登録">
	
		</form>
		<!-- 終了 ----------------------------------------------------------------------------------------->
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
					option = '<option value="' + '' + '"hidden selected>' + '--' + '</option>';
					}else if (i === current) {
					option = '<option value="' + i + '" >' + i + '</option>';
				  } else {
					option = '<option value="' + i + '">' + i + '</option>';
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
				option = '<option value="' + '' + '"hidden selected>' + '--' + '</option>';
				}else if (i === current) {
				option = '<option value="' + i + '" >' + i + '</option>';
			  } else {
				option = '<option value="' + i + '">' + i + '</option>';
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
	
				  option = '<option value="' + '' + '"hidden selected>' + '--' + '</option>';
			  }else{
			option = '<option value="' + i + '">' + i + '</option>';
			  }
			selectBox.insertAdjacentHTML('beforeend', option);
		  }
	
		})();
	</script>